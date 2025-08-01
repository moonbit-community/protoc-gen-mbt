///|
fn run_protoscope_test(input : Bytes) -> String raise {
  @async_uv.start(async fn() -> String raise {
    let stdout = @async_uv.Pipe::new()
    let stdin = @async_uv.Pipe::new()
    let process = @async_uv.spawn(
      "protoscope",
      [],
      stdout=Pipe(stdout),
      stdin=Pipe(stdin),
    )
    stdin.write_bytes(input)
    stdin.close()
    inspect(process.status(), content="0")
    return stdout.read_text(encoding=UTF8)
  })
}

///|
fn async_run(f : async () -> Unit noraise) -> Unit = "%async.run"

///|
fn new_code_generator_request(
  file_to_generate~ : Array[String] = [],
  version? : Version,
  parameter? : String,
  proto_file~ : Array[@protobuf1.FileDescriptorProto] = [],
) -> CodeGeneratorRequest {
  // Create a default CodeGeneratorRequest for testing
  let generator = CodeGeneratorRequest::default()
  generator.file_to_generate = file_to_generate
  generator.compiler_version = version
  generator.parameter = parameter
  generator.proto_file = proto_file
  generator
}

///|
fn new_version(major~ : Int = 1, minor~ : Int = 0, patch~ : Int = 0) -> Version {
  // Create a default Version for testing
  let version = Version::default()
  version.major = Some(major)
  version.minor = Some(minor)
  version.patch = Some(patch)
  version
}

///|
test "CodeGeneratorRequest::size_of/empty_arrays" {
  // Test with empty arrays but non-empty strings
  let request_empty_arrays = new_code_generator_request(
    file_to_generate=["test_parameter"],
    parameter="test_parameter",
  )
  let size = request_empty_arrays.size_of()
  inspect(size > 0U, content="true")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_empty_arrays, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  inspect(
    bytes,
    content=(
      #|b"\x0a\x0e\x74\x65\x73\x74\x5f\x70\x61\x72\x61\x6d\x65\x74\x65\x72\x12\x0e\x74\x65\x73\x74\x5f\x70\x61\x72\x61\x6d\x65\x74\x65\x72"
    ),
  )
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|1: {"test_parameter"}
      #|2: {"test_parameter"}
      #|
    ),
  )
}

///|
test "CodeGeneratorRequest::size_of/large_arrays" {
  // Test with large number of files
  let many_files = Array::makei(100, fn(i) { "file\{i}.proto" })
  let request_many_files = new_code_generator_request(
    file_to_generate=many_files,
  )
  let size = request_many_files.size_of()
  inspect(size > 100U, content="true")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_many_files, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|1: {"file0.proto"}
      #|1: {"file1.proto"}
      #|1: {"file2.proto"}
      #|1: {"file3.proto"}
      #|1: {"file4.proto"}
      #|1: {"file5.proto"}
      #|1: {"file6.proto"}
      #|1: {"file7.proto"}
      #|1: {"file8.proto"}
      #|1: {"file9.proto"}
      #|1: {"file10.proto"}
      #|1: {"file11.proto"}
      #|1: {"file12.proto"}
      #|1: {"file13.proto"}
      #|1: {"file14.proto"}
      #|1: {"file15.proto"}
      #|1: {"file16.proto"}
      #|1: {"file17.proto"}
      #|1: {"file18.proto"}
      #|1: {"file19.proto"}
      #|1: {"file20.proto"}
      #|1: {"file21.proto"}
      #|1: {"file22.proto"}
      #|1: {"file23.proto"}
      #|1: {"file24.proto"}
      #|1: {"file25.proto"}
      #|1: {"file26.proto"}
      #|1: {"file27.proto"}
      #|1: {"file28.proto"}
      #|1: {"file29.proto"}
      #|1: {"file30.proto"}
      #|1: {"file31.proto"}
      #|1: {"file32.proto"}
      #|1: {"file33.proto"}
      #|1: {"file34.proto"}
      #|1: {"file35.proto"}
      #|1: {"file36.proto"}
      #|1: {"file37.proto"}
      #|1: {"file38.proto"}
      #|1: {"file39.proto"}
      #|1: {"file40.proto"}
      #|1: {"file41.proto"}
      #|1: {"file42.proto"}
      #|1: {"file43.proto"}
      #|1: {"file44.proto"}
      #|1: {"file45.proto"}
      #|1: {"file46.proto"}
      #|1: {"file47.proto"}
      #|1: {"file48.proto"}
      #|1: {"file49.proto"}
      #|1: {"file50.proto"}
      #|1: {"file51.proto"}
      #|1: {"file52.proto"}
      #|1: {"file53.proto"}
      #|1: {"file54.proto"}
      #|1: {"file55.proto"}
      #|1: {"file56.proto"}
      #|1: {"file57.proto"}
      #|1: {"file58.proto"}
      #|1: {"file59.proto"}
      #|1: {"file60.proto"}
      #|1: {"file61.proto"}
      #|1: {"file62.proto"}
      #|1: {"file63.proto"}
      #|1: {"file64.proto"}
      #|1: {"file65.proto"}
      #|1: {"file66.proto"}
      #|1: {"file67.proto"}
      #|1: {"file68.proto"}
      #|1: {"file69.proto"}
      #|1: {"file70.proto"}
      #|1: {"file71.proto"}
      #|1: {"file72.proto"}
      #|1: {"file73.proto"}
      #|1: {"file74.proto"}
      #|1: {"file75.proto"}
      #|1: {"file76.proto"}
      #|1: {"file77.proto"}
      #|1: {"file78.proto"}
      #|1: {"file79.proto"}
      #|1: {"file80.proto"}
      #|1: {"file81.proto"}
      #|1: {"file82.proto"}
      #|1: {"file83.proto"}
      #|1: {"file84.proto"}
      #|1: {"file85.proto"}
      #|1: {"file86.proto"}
      #|1: {"file87.proto"}
      #|1: {"file88.proto"}
      #|1: {"file89.proto"}
      #|1: {"file90.proto"}
      #|1: {"file91.proto"}
      #|1: {"file92.proto"}
      #|1: {"file93.proto"}
      #|1: {"file94.proto"}
      #|1: {"file95.proto"}
      #|1: {"file96.proto"}
      #|1: {"file97.proto"}
      #|1: {"file98.proto"}
      #|1: {"file99.proto"}
      #|
    ),
  )
}

///|
test "CodeGeneratorRequest::size_of/single_file" {
  // Test with single file
  let request_single_file = new_code_generator_request(file_to_generate=[
    "main.proto",
  ])
  let size = request_single_file.size_of()
  inspect(size > 10U, content="true")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_single_file, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  inspect(
    bytes,
    content=(
      #|b"\x0a\x0a\x6d\x61\x69\x6e\x2e\x70\x72\x6f\x74\x6f"
    ),
  )
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|1: {"main.proto"}
      #|
    ),
  )
}

///|
test "CodeGeneratorRequest::size_of/with_parameter" {
  let request_with_param = new_code_generator_request(
    file_to_generate=["test.proto", "util.proto"],
    parameter="output_dir=/tmp",
  )
  let size = request_with_param.size_of()
  inspect(size > 20U, content="true")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_with_param, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  inspect(
    bytes,
    content=(
      #|b"\x0a\x0a\x74\x65\x73\x74\x2e\x70\x72\x6f\x74\x6f\x0a\x0a\x75\x74\x69\x6c\x2e\x70\x72\x6f\x74\x6f\x12\x0f\x6f\x75\x74\x70\x75\x74\x5f\x64\x69\x72\x3d\x2f\x74\x6d\x70"
    ),
  )
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|1: {"test.proto"}
      #|1: {"util.proto"}
      #|2: {"output_dir=/tmp"}
      #|
    ),
  )
}

///|
test "CodeGeneratorRequest::size_of/empty_request" {
  // Test with completely empty request
  let request_empty = new_code_generator_request()
  let size = request_empty.size_of()
  inspect(size > 0U, content="false")
  let writer = @buffer.new()
  let bytes = writer.to_bytes()
  inspect(
    bytes,
    content=(
      #|b""
    ),
  )
  inspect(run_protoscope_test(bytes), content="")
}

///|
test "CodeGeneratorRequest::size_of/medium_files" {
  // Test with medium number of files (10)
  let medium_files = Array::makei(10, fn(i) { "module\{i}.proto" })
  let request_medium_files = new_code_generator_request(
    file_to_generate=medium_files,
    parameter="lang=mbt",
  )
  let size = request_medium_files.size_of()
  inspect(size > 50U, content="true")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_medium_files, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|1: {"module0.proto"}
      #|1: {"module1.proto"}
      #|1: {"module2.proto"}
      #|1: {"module3.proto"}
      #|1: {"module4.proto"}
      #|1: {"module5.proto"}
      #|1: {"module6.proto"}
      #|1: {"module7.proto"}
      #|1: {"module8.proto"}
      #|1: {"module9.proto"}
      #|2: {"lang=mbt"}
      #|
    ),
  )
}

///|
test "CodeGeneratorRequest::size_of/special_characters" {
  // Test with files containing special characters
  let special_files = ["测试.proto", "файл.proto", "файл-2.proto"]
  let request_special = new_code_generator_request(
    file_to_generate=special_files,
    parameter="unicode=true",
  )
  let size = request_special.size_of()
  inspect(size > 30U, content="true")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_special, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  // Note: The exact bytes will depend on UTF-8 encoding of special characters
  inspect(bytes.length() > 40, content="true")
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|1: {"测试.proto"}
      #|1: {"файл.proto"}
      #|1: {"файл-2.proto"}
      #|2: {"unicode=true"}
      #|
    ),
  )
}

///|
test "CodeGeneratorRequest::size_of/long_parameter" {
  // Test with very long parameter string
  let long_param = "very_long_parameter_" + Array::make(50, "option").join("_")
  let request_long_param = new_code_generator_request(
    file_to_generate=["test.proto"],
    parameter=long_param,
  )
  let size = request_long_param.size_of()
  inspect(size > 300U, content="true")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_long_param, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  inspect(bytes.length() > 300, content="true")
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|1: {"test.proto"}
      #|2: {
      #|  "very_long_parameter_option_option_option_option_option_option_option_option_opti"
      #|  "on_option_option_option_option_option_option_option_option_option_option_option_"
      #|  "option_option_option_option_option_option_option_option_option_option_option_opt"
      #|  "ion_option_option_option_option_option_option_option_option_option_option_option"
      #|  "_option_option_option_option_option_option_option"
      #|}
      #|
    ),
  )
}

///|
test "coroutine CodeGeneratorRequest::size_of/mixed_filename_lengths" {
  // Test with files of varying name lengths
  let mixed_files = [
    "a.proto", "medium_name.proto", "very_very_very_long_filename_with_lots_of_characters.proto",
  ]
  let request_mixed = new_code_generator_request(
    file_to_generate=mixed_files,
    parameter="format=json",
  )
  let size = request_mixed.size_of()
  inspect(size > 80U, content="true")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_mixed, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|1: {"a.proto"}
      #|1: {"medium_name.proto"}
      #|1: {"very_very_very_long_filename_with_lots_of_characters.proto"}
      #|2: {"format=json"}
      #|
    ),
  )
}

///|
test "CodeGeneratorRequest::version/other_versions" {
  let version = new_version(major=2, minor=1, patch=3)
  let request_empty_files = new_code_generator_request(
    file_to_generate=[],
    version~,
  )
  let size = request_empty_files.size_of()
  inspect(size == 0U, content="false")
  let writer = @buffer.new()
  async_run(async fn() -> Unit noraise {
    @protobuf.AsyncWrite::write(request_empty_files, writer) catch {
      err => println("Error writing CodeGeneratorRequest: \{err}")
    }
  })
  let bytes = writer.to_bytes()
  inspect(
    bytes,
    content=(
      #|b"\x1a\x06\x08\x02\x10\x01\x18\x03"
    ),
  )
  inspect(
    run_protoscope_test(bytes),
    content=(
      #|3: {
      #|  1: 2
      #|  2: 1
      #|  3: 3
      #|}
      #|
    ),
  )
}
