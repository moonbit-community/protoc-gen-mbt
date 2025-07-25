///|
fn main {
  main_prog() catch {
    err => println("server exit with error \{err}")
  }
}

///|
fn main_prog() -> Unit raise {
  @async.with_event_loop(fn(_) { parse_request() |> output_response() })
}

///|
type Stdin @pipe.PipeRead

///|
fn Stdin::new() -> Stdin {
  @pipe.stdin
}

///|
type Stdout @pipe.PipeWrite

///|
fn Stdout::new() -> Stdout {
  @pipe.stdout
}

///|
impl @lib.AsyncReader for Stdin with read(
  self,
  bytes : FixedArray[Byte],
  offset~ : Int,
  max_length~ : Int,
) -> Int? raise {
  @async.pause()
  self.inner().read(bytes, offset~, max_len=max_length) |> Some
}

///|
impl @lib.AsyncWriter for Stdout with write(self, bytes : @bytes.View) -> Unit raise {
  let mut offset = 0
  self.inner().write(bytes.to_bytes(), offset~)
  offset += bytes.length()
}

///|
async fn parse_request() -> @compiler.CodeGeneratorResponse noraise {
  let reader = Stdin::new()
  let request = @compiler.CodeGeneratorRequest::async_read(reader) catch {
    err => {
      let response = @compiler.CodeGeneratorResponse::default()
      response.supported_features = Some(1)
      response.minimum_edition = Some(
        @protobuf.Edition::EDITION_UNKNOWN
        .to_enum()
        .inner()
        .reinterpret_as_int(),
      )
      response.maximum_edition = Some(
        @protobuf.Edition::EDITION_MAX.to_enum().inner().reinterpret_as_int(),
      )
      response.error = Some("Error reading CodeGeneratorRequest: \{err}")
      return response
    }
  }
  let generator = CodeGenerator::new(request)
  let gen = generator.generate()
  return gen
}

///|
async fn output_response(
  response : @compiler.CodeGeneratorResponse,
) -> Unit raise {
  let stdout = Stdout::new()
  response.async_write(stdout)
  stdout.inner().close()
}
