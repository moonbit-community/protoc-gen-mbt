///|
fn main {
  let path = @sys.get_cli_args().get(0).unwrap_or("../bin")
  let test_case = (try? @fs.read_dir(path)).unwrap()
  for file in test_case {
    println("Processing file: .../bin/\{file}")
    let bytes = try? @fs.read_file_to_bytes("\{path}/\{file}")
    if bytes is Ok(bytes) {
      let reader = @lib.BytesReader::from_bytes(bytes)
      let m = try? (@lib.Read::read(reader) : @gen_proto3.FooMessage)
      println("\{m}")
    }
  }
}
