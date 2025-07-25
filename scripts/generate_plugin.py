import json
from pathlib import Path
import subprocess
import sys
from common import (
    build_plugin,
    build_protoc_command,
    run_command,
    update_lib_deps,
    moon_fmt,
    moon_check,
    moon_info,
    moon_test
)

from logger import get_logger

logger = get_logger(__name__)


SCRIPT_DIR = Path(__file__).parent.absolute()
PROJECT_ROOT = SCRIPT_DIR.parent
PLUGIN_PROTO_DIR = PROJECT_ROOT / "plugin"
PLUGIN_OUT_DIR = PROJECT_ROOT


def main():
    logger.info(f"Working directory: {Path.cwd()}")
    logger.info(f"Script directory: {SCRIPT_DIR}")
    logger.info(f"Project root: {PROJECT_ROOT}")

    build_plugin(PROJECT_ROOT)

    proto_file = PLUGIN_PROTO_DIR / "plugin.proto"
    if not proto_file.exists():
        logger.error(f"plugin.proto not found: {proto_file}")
        sys.exit(1)

    protoc_cmd = build_protoc_command(
        PLUGIN_PROTO_DIR,
        PLUGIN_OUT_DIR,
        "plugin",
        PROJECT_ROOT,
        [proto_file.name, "google/protobuf/descriptor.proto"],
        username="moonbit-community",
    )
    try:
        run_command(protoc_cmd)
        update_lib_deps(PROJECT_ROOT, PLUGIN_PROTO_DIR)

        with open(PLUGIN_PROTO_DIR / "moon.mod.json", "r") as f:
            module_config = json.load(f)

        module_config["deps"]["tonyfettes/uv"] = "0.10.1"
        module_config["deps"]["moonbitlang/async"] = "0.2.2"

        with open(PLUGIN_PROTO_DIR / "moon.mod.json", "w") as f:
            json.dump(module_config, f, indent=2)

        pkg_json_path = PLUGIN_PROTO_DIR.joinpath(
            "src", "google", "protobuf", "compiler", "moon.pkg.json"
        )

        with open(pkg_json_path, "r") as f:
            json_model = json.load(f)

        test_import_list = [
            {"path": "tonyfettes/uv/async", "alias": "async_uv"},
            "tonyfettes/encoding",
            "moonbitlang/async",
        ]

        json_model["test-import"] = test_import_list
        json_model["targets"] = {"top_test.mbt": ["native"]}
        with open(pkg_json_path, "w") as f:
            json.dump(json_model, f, indent=2)

        moon_check(PLUGIN_PROTO_DIR)

        moon_test(PLUGIN_PROTO_DIR)

        moon_fmt(PLUGIN_PROTO_DIR)

        moon_info(PLUGIN_PROTO_DIR)

    except subprocess.CalledProcessError as e:
        logger.error(f"Protoc failed: {e}")
        if e.stdout:
            logger.error(f"stdout: {e.stdout}")
        if e.stderr:
            logger.error(f"stderr: {e.stderr}")

    logger.info("Plugin code generation completed.")


if __name__ == "__main__":
    main()
