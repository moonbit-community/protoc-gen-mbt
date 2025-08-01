///|
fn main {
  main_prog() catch {
    err => println("Error in main program: \{err}")
  }
}

///|
fn main_prog() -> Unit raise {
  let loop_ = @uv.Loop::new()
  reset(async fn() noraise {
    let resp = parse_request(loop_)
    output_response(resp, loop_) catch {
      err => println("Error in output_response: \{err}")
    }
  })
  loop_.run(Default)
  loop_.close()
}

///|
struct Stdin {
  loop_ : @uv.Loop
  file : @uv.File
}

///|
struct Stdout {
  loop_ : @uv.Loop
  file : @uv.File
}

///|
impl @lib.AsyncReader for Stdin with read(
  self,
  bytes : FixedArray[Byte],
  offset~ : Int,
  max_length~ : Int,
) -> Int? raise {
  let value = shift(fn(resolve, reject) {
    let bytes = bytes.unsafe_reinterpret_as_bytes()[offset:offset + max_length]
    ignore(self.loop_.fs_read(self.file, [bytes], resolve, reject)) catch {
      e => reject(e)
    }
  }) catch {
    @uv.Errno(EOF) => return None
    err => raise err
  }
  Some(value)
}

///|
async fn[T, E : Error] shift(
  f : ((T) -> Unit, (E) -> Unit) -> Unit,
) -> T raise E = "%async.suspend"

///|
fn reset(f : async () -> Unit noraise) -> Unit = "%async.run"

///|
impl @lib.AsyncWriter for Stdout with write(self, bytes : @bytes.View) -> Unit raise {
  let mut bytes = bytes
  while bytes.length() > 0 {
    let length = shift(fn(resolve, reject) {
      ignore(self.loop_.fs_write(self.file, [bytes], resolve, reject)) catch {
        e => reject(e)
      }
    })
    bytes = bytes[length:]
  }
}

///|
async fn parse_request(
  loop_ : @uv.Loop,
) -> @compiler.CodeGeneratorResponse noraise {
  let reader = Stdin::{ loop_, file: @uv.stdin() }
  let request = @lib.AsyncRead::read(reader) catch {
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
  gen
}

///|
async fn output_response(
  response : @compiler.CodeGeneratorResponse,
  loop_ : @uv.Loop,
) -> Unit raise {
  let stdout = Stdout::{ loop_, file: @uv.stdout() }
  @lib.AsyncWrite::write(response, stdout)
}
