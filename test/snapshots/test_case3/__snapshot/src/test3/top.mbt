pub(all) struct Test {
  mut created_at :  @test2.Hello 
} derive(Eq, Show)
pub impl @protobuf.Sized for Test with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.created_at); @protobuf.size_of(size) + size }
  size
}
pub impl Default for Test with default() -> Test {
  Test::{
    created_at : @test2.Hello::default(),
  }
}
pub  fn[R: @protobuf.Reader] Test::read(reader : R) -> Test raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Test::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] Test::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Test raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Test::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.created_at =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      @test2.Hello::default()
    } else {
      @test2.Hello::read_with_limit(reader, limit=len)
    }
  }
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub  fn[W: @protobuf.Writer] Test::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_uint32(@protobuf.size_of(self.created_at)); self.created_at.write(writer)
}
pub impl ToJson for Test with to_json(self) {
  let json: Map[String, Json] = {}
  if self.created_at != Default::default() {
  json["createdAt"] = self.created_at.to_json()
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
      ("createdAt", value) => message.created_at = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] Test::async_read(reader : R) -> Test raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Test::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] Test::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Test raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Test::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.created_at =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      @test2.Hello::default()
    } else {
      @test2.Hello::async_read_with_limit(reader, limit=len)
    }
  }
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub async fn[W: @protobuf.AsyncWriter] Test::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_uint32(@protobuf.size_of(self.created_at)); self.created_at.async_write(writer)
}
