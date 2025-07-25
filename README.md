# MoonBit protobuf generator

This is the protobuf compiler for MoonBit, consisting of the compiler plugin written in Go and the runtime library.

The compiler and the runtime library are not published yet. To use this protobuf generator:

1. Clone this [repository](https://github.com/moonbit-community/protoc-gen-mbt)
2. Build the compiler plugin with `moon build -C cli`
3. Generate the MoonBit output. You can either add the compiled plugin to your `PATH`, or specify it with the `--plugin` option:
   - Add to PATH: `PATH=".:$PATH" protoc --mbt_out=. --mbt_opt=paths=source_relative,project_name=gen-proto3 src/test/reader/proto3.proto`
   - Or use --plugin: `protoc --plugin=protoc-gen-mbt=protoc-gen-mbt.exe --mbt_out=. --mbt_opt=paths=source_relative,project_name=gen-proto3 src/test/reader/proto3.proto`
   Note: `project_name` must match the output directory name (e.g., `gen-proto3`), and the directory must exist.
4. Use the generated MoonBit file given that it imports the runtime library with the alias `lib`.

This will be simplified in the future development.

## Known Issues

- Deprecated group is not supported
- Extensions and custom options are ignored

## Supported

See [spec](doc/spec.md)

## Developing

```sh
moon build -C cli
mkdir gen-proto3
cp cli/target/native/release/build/protoc-gen-mbt.exe .
# Project name must match the directory name
protoc --plugin=protoc-gen-mbt=protoc-gen-mbt.exe --mbt_out=. --mbt_opt=paths=source_relative,project_name=gen-proto3 test/reader/proto3.proto
```

The generated MoonBit file (e.g., `proto3_pb.mbt`) will be placed in the specified output directory (e.g., `gen-proto3`).

## Arguments

You can pass project parameters using `--mbt_opt`, separated by commas:

| Name          | Type    | Description                                   | Default Value         |
|---------------|---------|-----------------------------------------------|----------------------|
| json          | bool    | Generate additional `JSON` serialization code   | true            |
| async         | bool    | Generate async read/write code                 | true                 |
| username      | string  | Username to be used in `moon.mod.json`        | username    |
| project_name  | string  | Project name to be used in `moon.mod.json` & `moon.pkg.json`     | protoc-gen-mbt    |

Example usage:

```sh
protoc --plugin=protoc-gen-mbt=protoc-gen-mbt.exe --mbt_out=. --mbt_opt=json=true,username=yourname,project_name=yourproject input.proto
```

### Structure

- `lib/`  MoonBit protobuf runtime library
- `cli/`  protoc-gen-mbt CLI implementation
- `plugin/`  MoonBit implementation generated from plugin.proto
