#!/usr/bin/env python3
"""
Snapshot test runner for MoonBit protobuf code generator.

This script tests the code generation functionality by:
1. Generating MoonBit code from proto files
2. Updating moon.mod.json dependencies
3. Comparing generated code with snapshots
4. Running moon check on generated and snapshot directories
5. Optionally updating snapshots if requested
"""

import argparse
import json
import shutil
import subprocess
import sys
from pathlib import Path
from typing import List, Optional
import os

# Import common functions
from common import build_plugin, build_protoc_command

from logger import get_logger

logger = get_logger(__name__)


# Project paths as constants
SCRIPT_DIR = Path(__file__).parent.absolute()
PROJECT_ROOT = SCRIPT_DIR.parent
TEST_PROTO_DIR = PROJECT_ROOT / "test" / "snapshots"


def parse_arguments():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description="Run snapshot test for MoonBit protobuf generator",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                                    Run snapshot test (compare only)
  %(prog)s --update-snapshots                Run test and update snapshots if different
  %(prog)s --include-path /usr/include       Use custom include path for protobuf
  %(prog)s -I /opt/protobuf/include -u       Combine include path with update
        """,
    )

    parser.add_argument(
        "--update-snapshots",
        "-u",
        action="store_true",
        help="Update __snapshot directories with generated code",
    )

    parser.add_argument(
        "--include-path",
        "-I",
        metavar="PATH",
        help="Additional proto include path for protoc",
    )

    return parser.parse_args()


def find_proto_directories() -> List[Path]:
    """Find all directories containing .proto files."""
    proto_dirs = set()
    for proto_file in TEST_PROTO_DIR.rglob("*.proto"):
        proto_dirs.add(proto_file.parent)

    if not proto_dirs:
        logger.error(f"No .proto files found in {TEST_PROTO_DIR}")
        sys.exit(1)

    return sorted(proto_dirs)


def update_moon_deps(moon_json_path: Path, relative_path: str) -> None:
    """Update moon.mod.json deps using jq-like functionality."""
    if not moon_json_path.exists():
        return

    try:
        with open(moon_json_path, "r") as f:
            data = json.load(f)

        # Update the deps field
        if "deps" not in data:
            data["deps"] = {}

        data["deps"]["moonbit-community/protobuf/lib"] = {
            "path": relative_path,
            "version": "0.1.0",
        }

        # Write back with proper formatting
        with open(moon_json_path, "w") as f:
            json.dump(data, f, indent=1)

        logger.info(f"Updating deps: {moon_json_path.relative_to(PROJECT_ROOT)}")

    except (json.JSONDecodeError, IOError) as e:
        logger.error(f"Failed to update {moon_json_path}: {e}")
        sys.exit(1)


def generate_code(proto_dirs: List[Path], include_path: Optional[str]) -> None:
    """Generate code for each proto directory."""

    for proto_dir in proto_dirs:
        gen_dir = proto_dir
        gen_dir.mkdir(exist_ok=True)

        # Find proto files in the directory
        proto_files = list(proto_dir.glob("*.proto"))
        if not proto_files:
            logger.error(f"No proto files found in {proto_dir}")
            sys.exit(1)

        # Build protoc command for each proto file separately
        for proto_file in proto_files:
            cmd = build_protoc_command(
                proto_dir,
                proto_dir,
                "__gen",
                PROJECT_ROOT,
                proto_file.name,
                include_path,
            )

            try:
                subprocess.run(cmd, check=True, capture_output=True, text=True)
            except subprocess.CalledProcessError as e:
                logger.error(
                    f"Protoc failed for {proto_dir.name}/{proto_file.name}: {e}"
                )
                if e.stderr:
                    logger.error(f"Error: {e.stderr}")
                sys.exit(1)

    logger.info("Code generation completed")


def update_dependencies(proto_dirs: List[Path]) -> None:
    """Update moon.mod.json deps in all generated directories."""

    for proto_dir in proto_dirs:
        # Define relative path to lib directory (4 levels up)
        relative_path = "../../../../lib"

        # Update __gen directory only
        gen_dir = proto_dir / "__gen"
        moon_json = gen_dir / "moon.mod.json"

        if gen_dir.exists() and moon_json.exists():
            update_moon_deps(moon_json, relative_path)

        # Also check for nested snapshot directories in __gen
        nested_snapshot = gen_dir / "snapshot"
        nested_moon_json = nested_snapshot / "moon.mod.json"

        if nested_snapshot.exists() and nested_moon_json.exists():
            logger.info(f"Updating deps: {proto_dir.name}/__gen/snapshot/moon.mod.json")
            # Use 5 levels up for nested directories
            nested_relative_path = "../../../../../lib"
            update_moon_deps(nested_moon_json, nested_relative_path)

    logger.info("moon.mod.json deps updated")


def compare_directories(proto_dirs: List[Path], update_snapshots: bool) -> bool:
    """Compare __gen and __snapshot directories."""
    has_changes = False

    for proto_dir in proto_dirs:
        gen_dir = proto_dir / "__gen"
        snapshot_dir = proto_dir / "__snapshot"

        if not gen_dir.exists() or not any(gen_dir.iterdir()):
            logger.error(f"No generated files found in: {proto_dir.name}")
            sys.exit(1)

        if snapshot_dir.exists() and any(snapshot_dir.iterdir()):
            # Compare directories using diff
            try:
                subprocess.run(
                    [
                        "diff",
                        "-r",
                        "--strip-trailing-cr",
                        str(gen_dir),
                        str(snapshot_dir),
                    ],
                    check=True,
                    capture_output=True,
                )
                continue  # No differences
            except subprocess.CalledProcessError:
                logger.warning(f"Differences detected in: {proto_dir.name}")
                # Show differences
                try:
                    result = subprocess.run(
                        [
                            "diff",
                            "-r",
                            "--strip-trailing-cr",
                            str(gen_dir),
                            str(snapshot_dir),
                        ],
                        capture_output=True,
                        text=True,
                    )
                    logger.info("Differences found:")
                    logger.info(result.stdout)
                except subprocess.CalledProcessError:
                    pass

                if update_snapshots:
                    shutil.rmtree(snapshot_dir, ignore_errors=True)
                    shutil.copytree(gen_dir, snapshot_dir)
                    logger.info(f"Snapshot updated: {proto_dir.name}")
                else:
                    has_changes = True
        else:
            if update_snapshots:
                shutil.rmtree(snapshot_dir, ignore_errors=True)
                shutil.copytree(gen_dir, snapshot_dir)
                logger.info(f"Snapshot created: {proto_dir.name}")
            else:
                logger.warning(f"New snapshot needed for: {proto_dir.name}")
                has_changes = True

    return has_changes


def run_moon_check(proto_dirs: List[Path]) -> None:
    """Run moon check on all generated and snapshot directories."""

    # # Check generated directories
    for proto_dir in proto_dirs:
        gen_dir = proto_dir / "__gen"
        if gen_dir.exists() and any(gen_dir.iterdir()):
            logger.info(f"Checking: {proto_dir.name}/__gen")
            try:
                subprocess.run(
                    ["moon", "check"], cwd=gen_dir, check=True, capture_output=True
                )
            except subprocess.CalledProcessError as _:
                logger.error(
                    f"Moon check failed for generated code in: {proto_dir.name}/__gen"
                )


def cleanup_generated_directories(proto_dirs: List[Path]) -> None:
    """Clean up __gen directories after test completion."""

    for proto_dir in proto_dirs:
        gen_dir = proto_dir / "__gen"
        if gen_dir.exists():
            shutil.rmtree(gen_dir)
            logger.info(f"Removed: {proto_dir.name}/__gen")

    logger.info("Cleanup completed")


def main():
    """Main entry point."""
    args = parse_arguments()

    logger.info(f"   Working directory: {Path.cwd()}")
    logger.info(f"   Script directory: {SCRIPT_DIR}")
    logger.info(f"   Project root: {PROJECT_ROOT}")

    # Build protoc-gen-mbt plugin
    build_plugin(PROJECT_ROOT)

    # Find test proto files
    proto_dirs = find_proto_directories()

    # Change to project root directory
    os.chdir(PROJECT_ROOT)

    # Generate code for each proto directory
    generate_code(proto_dirs, args.include_path)

    # Update moon.mod.json deps
    update_dependencies(proto_dirs)

    # Compare directories and update if requested
    has_changes = compare_directories(proto_dirs, args.update_snapshots)

    # Run moon check on all directories
    run_moon_check(proto_dirs)

    # Clean up __gen directories after successful completion
    cleanup_generated_directories(proto_dirs)

    # Final check for changes
    if has_changes:
        logger.error("Snapshot test failed - differences detected")
        logger.info(
            "To update snapshots, run: python scripts/snapshot_test.py --update-snapshots"
        )
        sys.exit(1)
    elif args.update_snapshots:
        logger.info("All snapshots updated successfully")
    else:
        logger.info("All snapshots match")


if __name__ == "__main__":
    main()
