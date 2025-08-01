pub(all) struct Test {
  mut test_hello :  @lib.Hello 
} derive(Eq, Show)
pub impl @protobuf.Sized for Test with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.test_hello); @protobuf.size_of(size) + size }
  size
}
pub impl Default for Test with default() -> Test {
  Test::{
    test_hello : @lib.Hello::default(),
  }
}
pub fn Test::new(test_hello : @lib.Hello) -> Test {
  Test::{
    test_hello,
  }
}
pub impl @protobuf.Read for Test with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> Test raise {
  let msg = Test::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.test_hello = (reader |> @protobuf.read_message() : @lib.Hello)
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for Test with write(self: Test, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_uint32(@protobuf.size_of(self.test_hello)); @protobuf.Write::write(self.test_hello, writer)
}
pub impl ToJson for Test with to_json(self) {
  let json: Map[String, Json] = {}
  if self.test_hello != Default::default() {
  json["testHello"] = self.test_hello.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Test with from_json(json: Json, path: @json.JsonPath) -> Test raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Test"))
  }
  let message = Test::default()
  for key, value in obj {
    match (key, value) {
      ("testHello", value) => message.test_hello = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncWrite for Test with write(self: Test, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_uint32(@protobuf.size_of(self.test_hello)); @protobuf.AsyncWrite::write(self.test_hello, writer)
}
pub impl @protobuf.AsyncRead for Test with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> Test raise {
  let msg = Test::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.test_hello = (reader |> @protobuf.async_read_message() : @lib.Hello)
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
