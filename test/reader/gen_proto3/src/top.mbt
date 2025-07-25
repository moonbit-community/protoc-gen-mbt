///|
pub(all) enum FooEnum {
  FIRST_VALUE
  SECOND_VALUE
} derive(Eq, Show)

///|
pub fn FooEnum::to_enum(self : FooEnum) -> @protobuf.Enum {
  match self {
    FooEnum::FIRST_VALUE => 0
    FooEnum::SECOND_VALUE => 2
  }
}

///|
pub fn FooEnum::from_enum(i : @protobuf.Enum) -> FooEnum {
  match i.inner() {
    0 => FooEnum::FIRST_VALUE
    2 => FooEnum::SECOND_VALUE
    _ => Default::default()
  }
}

///|
pub impl Default for FooEnum with default() -> FooEnum {
  FooEnum::FIRST_VALUE
}

///|
pub impl @protobuf.Sized for FooEnum with size_of(self : FooEnum) {
  @protobuf.Sized::size_of(self.to_enum())
}

///|
pub impl @json.FromJson for FooEnum with from_json(
  json : Json,
  path : @json.JsonPath,
) -> FooEnum raise {
  match json {
    String("FIRST_VALUE") => FooEnum::FIRST_VALUE
    String("SECOND_VALUE") => FooEnum::SECOND_VALUE
    Number(0, ..) => FooEnum::FIRST_VALUE
    Number(2, ..) => FooEnum::SECOND_VALUE
    _ =>
      raise @json.JsonDecodeError(
        (path, "Expected a number or string for enum"),
      )
  }
}

///|
pub impl ToJson for FooEnum with to_json(self : FooEnum) -> Json {
  match self {
    FooEnum::FIRST_VALUE => "FIRST_VALUE"
    FooEnum::SECOND_VALUE => "SECOND_VALUE"
  }
}

///|
pub(all) struct BarMessage {
  mut b_int32 : Int
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for BarMessage with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.b_int32)
  size
}

///|
pub impl Default for BarMessage with default() -> BarMessage {
  BarMessage::{ b_int32: Int::default() }
}

///|
pub fn[R : @protobuf.Reader] BarMessage::read(reader : R) -> BarMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  BarMessage::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] BarMessage::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> BarMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = BarMessage::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.b_int32 = reader |> @protobuf.read_int32()
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

///|
pub fn[W : @protobuf.Writer] BarMessage::write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.write_varint(8UL)
  writer |> @protobuf.write_int32(self.b_int32)
}

///|
pub impl ToJson for BarMessage with to_json(self) {
  let json : Map[String, Json] = {}
  if self.b_int32 != Default::default() {
    json["bInt32"] = self.b_int32.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for BarMessage with from_json(
  json : Json,
  path : @json.JsonPath,
) -> BarMessage raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for BarMessage"))
  }
  let message = BarMessage::default()
  for key, value in obj {
    match (key, value) {
      ("bInt32", value) => message.b_int32 = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] BarMessage::async_read(
  reader : R,
) -> BarMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  BarMessage::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] BarMessage::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> BarMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = BarMessage::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) => msg.b_int32 = reader |> @protobuf.async_read_int32()
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

///|
pub async fn[W : @protobuf.AsyncWriter] BarMessage::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL)
  writer |> @protobuf.async_write_int32(self.b_int32)
}

///|
pub(all) struct FooMessage_FMapEntry {
  mut key : String
  mut value : Int
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for FooMessage_FMapEntry with size_of(self) {
  let mut size = 0U
  size += 1U +
    {
      let size = @protobuf.size_of(self.key)
      @protobuf.size_of(size) + size
    }
  size += 1U + @protobuf.size_of(self.value)
  size
}

///|
pub impl Default for FooMessage_FMapEntry with default() -> FooMessage_FMapEntry {
  FooMessage_FMapEntry::{ key: String::default(), value: Int::default() }
}

///|
pub fn[R : @protobuf.Reader] FooMessage_FMapEntry::read(
  reader : R,
) -> FooMessage_FMapEntry raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FooMessage_FMapEntry::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] FooMessage_FMapEntry::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> FooMessage_FMapEntry raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = FooMessage_FMapEntry::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.key = reader |> @protobuf.read_string()
        (2, _) => msg.value = reader |> @protobuf.read_int32()
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

///|
pub fn[W : @protobuf.Writer] FooMessage_FMapEntry::write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.write_varint(10UL)
  writer |> @protobuf.write_string(self.key)
  writer |> @protobuf.write_varint(16UL)
  writer |> @protobuf.write_int32(self.value)
}

///|
pub impl ToJson for FooMessage_FMapEntry with to_json(self) {
  let json : Map[String, Json] = {}
  if self.key != Default::default() {
    json["key"] = self.key.to_json()
  }
  if self.value != Default::default() {
    json["value"] = self.value.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for FooMessage_FMapEntry with from_json(
  json : Json,
  path : @json.JsonPath,
) -> FooMessage_FMapEntry raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError(
      (path, "Expected an object for FooMessage_FMapEntry"),
    )
  }
  let message = FooMessage_FMapEntry::default()
  for key, value in obj {
    match (key, value) {
      ("key", value) => message.key = @json.from_json(value, path~)
      ("value", value) => message.value = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] FooMessage_FMapEntry::async_read(
  reader : R,
) -> FooMessage_FMapEntry raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FooMessage_FMapEntry::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] FooMessage_FMapEntry::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> FooMessage_FMapEntry raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = FooMessage_FMapEntry::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) => msg.key = reader |> @protobuf.async_read_string()
        (2, _) => msg.value = reader |> @protobuf.async_read_int32()
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

///|
pub async fn[W : @protobuf.AsyncWriter] FooMessage_FMapEntry::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL)
  writer |> @protobuf.async_write_string(self.key)
  writer |> @protobuf.async_write_varint(16UL)
  writer |> @protobuf.async_write_int32(self.value)
}

///|
pub(all) struct FooMessage {
  mut f_int32 : Int
  mut f_int64 : Int64
  mut f_uint32 : UInt
  mut f_uint64 : UInt64
  mut f_sint32 : Int
  mut f_sint64 : Int64
  mut f_bool : Bool
  mut f_foo_enum : FooEnum
  mut f_fixed64 : UInt64
  mut f_sfixed64 : Int64
  mut f_fixed32 : UInt
  mut f_sfixed32 : Int
  mut f_double : Double
  mut f_float : Float
  mut f_bytes : Bytes
  mut f_string : String
  mut f_bar_message : BarMessage
  mut f_repeated_int32 : Array[Int]
  mut f_repeated_packed_int32 : Array[Int]
  mut f_repeated_packed_float : Array[Float]
  mut f_baz : BazMessage
  mut f_nested : BazMessage_Nested
  mut f_nested_enum : BazMessage_Nested_NestedEnum
  mut f_map : Map[String, Int]
  mut f_repeated_string : Array[String]
  mut f_repeated_baz_message : Array[BazMessage]
  mut f_optional_string : String?
  mut test_oneof : FooMessage_TestOneof
} derive(Eq, Show)

///|
pub(all) enum FooMessage_TestOneof {
  F1(Int)
  F2(Bool)
  F3(String)
  NotSet
} derive(Eq, Show)

///|
pub impl Default for FooMessage_TestOneof with default() -> FooMessage_TestOneof {
  NotSet
}

///|
pub impl @json.FromJson for FooMessage_TestOneof with from_json(
  json : Json,
  path : @json.JsonPath,
) -> FooMessage_TestOneof raise {
  if (try? FooMessage_TestOneof::F1(json |> @json.from_json(path~)))
    is Ok(value) {
    return value
  }
  if (try? FooMessage_TestOneof::F2(json |> @json.from_json(path~)))
    is Ok(value) {
    return value
  }
  if (try? FooMessage_TestOneof::F3(json |> @json.from_json(path~)))
    is Ok(value) {
    return value
  }
  FooMessage_TestOneof::NotSet
}

///|
pub impl ToJson for FooMessage_TestOneof with to_json(
  self : FooMessage_TestOneof,
) -> Json {
  match self {
    FooMessage_TestOneof::F1(v) => v.to_json()
    FooMessage_TestOneof::F2(v) => v.to_json()
    FooMessage_TestOneof::F3(v) => v.to_json()
    FooMessage_TestOneof::NotSet => Json::null()
  }
}

///|
pub impl @protobuf.Sized for FooMessage with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.f_int32)
  size += 1U + @protobuf.size_of(self.f_int64)
  size += 1U + @protobuf.size_of(self.f_uint32)
  size += 1U + @protobuf.size_of(self.f_uint64)
  size += 1U + @protobuf.size_of(self.f_sint32)
  size += 1U + @protobuf.size_of(self.f_sint64)
  size += 1U + @protobuf.size_of(self.f_bool)
  size += 1U + @protobuf.size_of(self.f_foo_enum)
  size += 1U + 8U
  size += 1U + 8U
  size += 1U + 4U
  size += 1U + 4U
  size += 1U + 8U
  size += 1U + 4U
  size += 1U +
    {
      let size = @protobuf.size_of(self.f_bytes)
      @protobuf.size_of(size) + size
    }
  size += 2U +
    {
      let size = @protobuf.size_of(self.f_string)
      @protobuf.size_of(size) + size
    }
  size += 2U +
    {
      let size = @protobuf.size_of(self.f_bar_message)
      @protobuf.size_of(size) + size
    }
  size += 2U +
    {
      let size = self.f_repeated_int32
        .iter()
        .map(@protobuf.size_of)
        .fold(init=0U, UInt::op_add)
      @protobuf.size_of(size) + size
    }
  size += 2U +
    {
      let size = self.f_repeated_packed_int32
        .iter()
        .map(@protobuf.size_of)
        .fold(init=0U, UInt::op_add)
      @protobuf.size_of(size) + size
    }
  size += 2U +
    {
      let size = self.f_repeated_packed_float.length().reinterpret_as_uint() * 4
      @protobuf.size_of(size) + size
    }
  size += 2U +
    {
      let size = @protobuf.size_of(self.f_baz)
      @protobuf.size_of(size) + size
    }
  size += 2U +
    {
      let size = @protobuf.size_of(self.f_nested)
      @protobuf.size_of(size) + size
    }
  size += 2U + @protobuf.size_of(self.f_nested_enum)
  size += self.f_map
    .iter()
    .map(fn(key_value) {
      let (k, v) = key_value
      let key_size = 1U +
        {
          let size = @protobuf.size_of(k)
          @protobuf.size_of(size) + size
        }
      let value_size = 1U + @protobuf.size_of(v)
      2U + @protobuf.size_of(key_size + value_size) + key_size + value_size
    })
    .fold(init=0U, UInt::op_add)
  size += self.f_repeated_string
    .iter()
    .map(@protobuf.size_of)
    .map(s => 2U + @protobuf.size_of(s) + s)
    .fold(init=0U, UInt::op_add)
  size += self.f_repeated_baz_message
    .iter()
    .map(@protobuf.size_of)
    .map(s => 2U + @protobuf.size_of(s) + s)
    .fold(init=0U, UInt::op_add)
  match self.f_optional_string {
    Some(v) =>
      size += 2U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  match self.test_oneof {
    F1(v) => size += 2U + @protobuf.size_of(v)
    F2(v) => size += 2U + @protobuf.size_of(v)
    F3(v) =>
      size += 2U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    NotSet => ()
  }
  size
}

///|
pub impl Default for FooMessage with default() -> FooMessage {
  FooMessage::{
    f_int32: Int::default(),
    f_int64: Int64::default(),
    f_uint32: UInt::default(),
    f_uint64: UInt64::default(),
    f_sint32: Int::default(),
    f_sint64: Int64::default(),
    f_bool: Bool::default(),
    f_foo_enum: FooEnum::default(),
    f_fixed64: UInt64::default(),
    f_sfixed64: Int64::default(),
    f_fixed32: UInt::default(),
    f_sfixed32: Int::default(),
    f_double: Double::default(),
    f_float: Float::default(),
    f_bytes: Bytes::default(),
    f_string: String::default(),
    f_bar_message: BarMessage::default(),
    f_repeated_int32: [],
    f_repeated_packed_int32: [],
    f_repeated_packed_float: [],
    f_baz: BazMessage::default(),
    f_nested: BazMessage_Nested::default(),
    f_nested_enum: BazMessage_Nested_NestedEnum::default(),
    f_map: {},
    f_repeated_string: [],
    f_repeated_baz_message: [],
    f_optional_string: None,
    test_oneof: FooMessage_TestOneof::NotSet,
  }
}

///|
pub fn[R : @protobuf.Reader] FooMessage::read(reader : R) -> FooMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FooMessage::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] FooMessage::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> FooMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = FooMessage::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.f_int32 = reader |> @protobuf.read_int32()
        (2, _) => msg.f_int64 = reader |> @protobuf.read_int64()
        (3, _) => msg.f_uint32 = reader |> @protobuf.read_uint32()
        (4, _) => msg.f_uint64 = reader |> @protobuf.read_uint64()
        (5, _) => msg.f_sint32 = (reader |> @protobuf.read_sint32()).inner()
        (6, _) => msg.f_sint64 = (reader |> @protobuf.read_sint64()).inner()
        (7, _) => msg.f_bool = reader |> @protobuf.read_bool()
        (8, _) =>
          msg.f_foo_enum = reader |> @protobuf.read_enum() |> FooEnum::from_enum
        (9, _) => msg.f_fixed64 = reader |> @protobuf.read_fixed64()
        (10, _) => msg.f_sfixed64 = reader |> @protobuf.read_sfixed64()
        (11, _) => msg.f_fixed32 = reader |> @protobuf.read_fixed32()
        (12, _) => msg.f_sfixed32 = reader |> @protobuf.read_sfixed32()
        (13, _) => msg.f_double = reader |> @protobuf.read_double()
        (14, _) => msg.f_float = reader |> @protobuf.read_float()
        (15, _) => msg.f_bytes = reader |> @protobuf.read_bytes()
        (16, _) => msg.f_string = reader |> @protobuf.read_string()
        (18, _) =>
          msg.f_bar_message = {
            let len = reader |> @protobuf.read_int32()
            if len == 0 {
              BarMessage::default()
            } else {
              BarMessage::read_with_limit(reader, limit=len)
            }
          }
        (19, _) =>
          msg.f_repeated_int32.push_iter(
            (reader |> @protobuf.read_packed(@protobuf.read_int32, None)).iter(),
          )
        (20, _) =>
          msg.f_repeated_packed_int32.push_iter(
            (reader |> @protobuf.read_packed(@protobuf.read_int32, None)).iter(),
          )
        (21, _) =>
          msg.f_repeated_packed_float.push_iter(
            (reader |> @protobuf.read_packed(@protobuf.read_float, Some(4))).iter(),
          )
        (23, _) =>
          msg.f_baz = {
            let len = reader |> @protobuf.read_int32()
            if len == 0 {
              BazMessage::default()
            } else {
              BazMessage::read_with_limit(reader, limit=len)
            }
          }
        (24, _) =>
          msg.f_nested = {
            let len = reader |> @protobuf.read_int32()
            if len == 0 {
              BazMessage_Nested::default()
            } else {
              BazMessage_Nested::read_with_limit(reader, limit=len)
            }
          }
        (25, _) =>
          msg.f_nested_enum = reader
            |> @protobuf.read_enum()
            |> BazMessage_Nested_NestedEnum::from_enum
        (26, _) => {
          let { key, value } = {
            let len = reader |> @protobuf.read_int32()
            if len == 0 {
              FooMessage_FMapEntry::default()
            } else {
              FooMessage_FMapEntry::read_with_limit(reader, limit=len)
            }
          }
          msg.f_map[key] = value
        }
        (30, _) => msg.f_repeated_string.push(reader |> @protobuf.read_string())
        (31, _) =>
          msg.f_repeated_baz_message.push(
            {
              let len = reader |> @protobuf.read_int32()
              if len == 0 {
                BazMessage::default()
              } else {
                BazMessage::read_with_limit(reader, limit=len)
              }
            },
          )
        (32, _) =>
          msg.f_optional_string = reader |> @protobuf.read_string() |> Some
        (27, _) =>
          msg.test_oneof = reader
            |> @protobuf.read_int32()
            |> FooMessage_TestOneof::F1
        (28, _) =>
          msg.test_oneof = reader
            |> @protobuf.read_bool()
            |> FooMessage_TestOneof::F2
        (29, _) =>
          msg.test_oneof = reader
            |> @protobuf.read_string()
            |> FooMessage_TestOneof::F3
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

///|
pub fn[W : @protobuf.Writer] FooMessage::write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.write_varint(8UL)
  writer |> @protobuf.write_int32(self.f_int32)
  writer |> @protobuf.write_varint(16UL)
  writer |> @protobuf.write_int64(self.f_int64)
  writer |> @protobuf.write_varint(24UL)
  writer |> @protobuf.write_uint32(self.f_uint32)
  writer |> @protobuf.write_varint(32UL)
  writer |> @protobuf.write_uint64(self.f_uint64)
  writer |> @protobuf.write_varint(40UL)
  writer |> @protobuf.write_sint32(self.f_sint32)
  writer |> @protobuf.write_varint(48UL)
  writer |> @protobuf.write_sint64(self.f_sint64)
  writer |> @protobuf.write_varint(56UL)
  writer |> @protobuf.write_bool(self.f_bool)
  writer |> @protobuf.write_varint(64UL)
  writer |> @protobuf.write_enum(self.f_foo_enum.to_enum())
  writer |> @protobuf.write_varint(73UL)
  writer |> @protobuf.write_fixed64(self.f_fixed64)
  writer |> @protobuf.write_varint(81UL)
  writer |> @protobuf.write_sfixed64(self.f_sfixed64)
  writer |> @protobuf.write_varint(93UL)
  writer |> @protobuf.write_fixed32(self.f_fixed32)
  writer |> @protobuf.write_varint(101UL)
  writer |> @protobuf.write_sfixed32(self.f_sfixed32)
  writer |> @protobuf.write_varint(105UL)
  writer |> @protobuf.write_double(self.f_double)
  writer |> @protobuf.write_varint(117UL)
  writer |> @protobuf.write_float(self.f_float)
  writer |> @protobuf.write_varint(122UL)
  writer |> @protobuf.write_bytes(self.f_bytes)
  writer |> @protobuf.write_varint(130UL)
  writer |> @protobuf.write_string(self.f_string)
  writer |> @protobuf.write_varint(146UL)
  writer |> @protobuf.write_uint32(@protobuf.size_of(self.f_bar_message))
  self.f_bar_message.write(writer)
  writer |> @protobuf.write_varint(154UL)
  let size = self.f_repeated_int32
    .iter()
    .map(@protobuf.size_of)
    .fold(init=0U, UInt::op_add)
  writer |> @protobuf.write_uint32(size)
  for item in self.f_repeated_int32 {
    writer |> @protobuf.write_int32(item)
  }
  writer |> @protobuf.write_varint(162UL)
  let size = self.f_repeated_packed_int32
    .iter()
    .map(@protobuf.size_of)
    .fold(init=0U, UInt::op_add)
  writer |> @protobuf.write_uint32(size)
  for item in self.f_repeated_packed_int32 {
    writer |> @protobuf.write_int32(item)
  }
  writer |> @protobuf.write_varint(170UL)
  let size = self.f_repeated_packed_float.length().reinterpret_as_uint() * 4
  writer |> @protobuf.write_uint32(size)
  for item in self.f_repeated_packed_float {
    writer |> @protobuf.write_float(item)
  }
  writer |> @protobuf.write_varint(186UL)
  writer |> @protobuf.write_uint32(@protobuf.size_of(self.f_baz))
  self.f_baz.write(writer)
  writer |> @protobuf.write_varint(194UL)
  writer |> @protobuf.write_uint32(@protobuf.size_of(self.f_nested))
  self.f_nested.write(writer)
  writer |> @protobuf.write_varint(200UL)
  writer |> @protobuf.write_enum(self.f_nested_enum.to_enum())
  let keys = self.f_map.keys().collect()
  for i in 0..<keys.length() {
    let k = keys[i]
    let v = self.f_map.get(k).unwrap()
    writer |> @protobuf.write_varint(210UL)
    let key_size = 1U +
      {
        let size = @protobuf.size_of(k)
        @protobuf.size_of(size) + size
      }
    let value_size = 1U + @protobuf.size_of(v)
    writer |> @protobuf.write_uint32(key_size + value_size)
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_string(k)
    writer |> @protobuf.write_varint(16UL)
    writer |> @protobuf.write_int32(v)
  }
  for item in self.f_repeated_string {
    writer |> @protobuf.write_varint(242UL)
    writer |> @protobuf.write_string(item)
  }
  for item in self.f_repeated_baz_message {
    writer |> @protobuf.write_varint(250UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item))
    item.write(writer)
  }
  match self.f_optional_string {
    Some(v) => {
      writer |> @protobuf.write_varint(258UL)
      writer |> @protobuf.write_string(v)
    }
    None => ()
  }
  match self.test_oneof {
    FooMessage_TestOneof::F1(v) => {
      writer |> @protobuf.write_varint(216UL)
      writer |> @protobuf.write_int32(v)
    }
    FooMessage_TestOneof::F2(v) => {
      writer |> @protobuf.write_varint(224UL)
      writer |> @protobuf.write_bool(v)
    }
    FooMessage_TestOneof::F3(v) => {
      writer |> @protobuf.write_varint(234UL)
      writer |> @protobuf.write_string(v)
    }
    FooMessage_TestOneof::NotSet => ()
  }
}

///|
pub impl ToJson for FooMessage with to_json(self) {
  let json : Map[String, Json] = {}
  if self.f_int32 != Default::default() {
    json["fInt32"] = self.f_int32.to_json()
  }
  if self.f_int64 != Default::default() {
    json["fInt64"] = self.f_int64.to_json()
  }
  if self.f_uint32 != Default::default() {
    json["fUint32"] = self.f_uint32.to_json()
  }
  if self.f_uint64 != Default::default() {
    json["fUint64"] = self.f_uint64.to_json()
  }
  if self.f_sint32 != Default::default() {
    json["fSint32"] = self.f_sint32.to_json()
  }
  if self.f_sint64 != Default::default() {
    json["fSint64"] = self.f_sint64.to_json()
  }
  if self.f_bool != Default::default() {
    json["fBool"] = self.f_bool.to_json()
  }
  if self.f_foo_enum != Default::default() {
    json["fFooEnum"] = self.f_foo_enum.to_json()
  }
  if self.f_fixed64 != Default::default() {
    json["fFixed64"] = self.f_fixed64.to_json()
  }
  if self.f_sfixed64 != Default::default() {
    json["fSfixed64"] = self.f_sfixed64.to_json()
  }
  if self.f_fixed32 != Default::default() {
    json["fFixed32"] = self.f_fixed32.to_json()
  }
  if self.f_sfixed32 != Default::default() {
    json["fSfixed32"] = self.f_sfixed32.to_json()
  }
  if self.f_double != Default::default() {
    json["fDouble"] = self.f_double.to_json()
  }
  if self.f_float != Default::default() {
    json["fFloat"] = self.f_float.to_json()
  }
  if self.f_bytes != Default::default() {
    json["fBytes"] = @protobuf.base64_encode(self.f_bytes).to_json()
  }
  if self.f_string != Default::default() {
    json["fString"] = self.f_string.to_json()
  }
  if self.f_bar_message != Default::default() {
    json["fBarMessage"] = self.f_bar_message.to_json()
  }
  if self.f_repeated_int32 != Default::default() {
    json["fRepeatedInt32"] = self.f_repeated_int32.to_json()
  }
  if self.f_repeated_packed_int32 != Default::default() {
    json["fRepeatedPackedInt32"] = self.f_repeated_packed_int32.to_json()
  }
  if self.f_repeated_packed_float != Default::default() {
    json["fRepeatedPackedFloat"] = self.f_repeated_packed_float.to_json()
  }
  if self.f_baz != Default::default() {
    json["fBaz"] = self.f_baz.to_json()
  }
  if self.f_nested != Default::default() {
    json["fNested"] = self.f_nested.to_json()
  }
  if self.f_nested_enum != Default::default() {
    json["fNestedEnum"] = self.f_nested_enum.to_json()
  }
  if self.f_map != Default::default() {
    json["fMap"] = self.f_map.to_json()
  }
  if self.f_repeated_string != Default::default() {
    json["fRepeatedString"] = self.f_repeated_string.to_json()
  }
  if self.f_repeated_baz_message != Default::default() {
    json["fRepeatedBazMessage"] = self.f_repeated_baz_message.to_json()
  }
  match self.f_optional_string {
    Some(v) => json["fOptionalString"] = v.to_json()
    _ => ()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for FooMessage with from_json(
  json : Json,
  path : @json.JsonPath,
) -> FooMessage raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FooMessage"))
  }
  let message = FooMessage::default()
  for key, value in obj {
    match (key, value) {
      ("fInt32", value) => message.f_int32 = @json.from_json(value, path~)
      ("fInt64", value) => message.f_int64 = @json.from_json(value, path~)
      ("fUint32", value) => message.f_uint32 = @json.from_json(value, path~)
      ("fUint64", value) => message.f_uint64 = @json.from_json(value, path~)
      ("fSint32", value) => message.f_sint32 = @json.from_json(value, path~)
      ("fSint64", value) => message.f_sint64 = @json.from_json(value, path~)
      ("fBool", value) => message.f_bool = @json.from_json(value, path~)
      ("fFooEnum", value) => message.f_foo_enum = @json.from_json(value, path~)
      ("fFixed64", value) => message.f_fixed64 = @json.from_json(value, path~)
      ("fSfixed64", value) => message.f_sfixed64 = @json.from_json(value, path~)
      ("fFixed32", value) => message.f_fixed32 = @json.from_json(value, path~)
      ("fSfixed32", value) => message.f_sfixed32 = @json.from_json(value, path~)
      ("fDouble", value) => message.f_double = @json.from_json(value, path~)
      ("fFloat", Number(value, ..)) => message.f_float = value.to_float()
      ("fBytes", String(value)) =>
        message.f_bytes = @protobuf.base64_decode(value)
      ("fString", value) => message.f_string = @json.from_json(value, path~)
      ("fBarMessage", value) =>
        message.f_bar_message = @json.from_json(value, path~)
      ("fRepeatedInt32", Array(value)) =>
        message.f_repeated_int32 = value.map(v => @json.from_json(v, path~))
      ("fRepeatedPackedInt32", Array(value)) =>
        message.f_repeated_packed_int32 = value.map(v => @json.from_json(
          v,
          path~,
        ))
      ("fRepeatedPackedFloat", Array(value)) =>
        message.f_repeated_packed_float = value.map(v => v
          .as_number()
          .unwrap()
          .to_float())
      ("fBaz", value) => message.f_baz = @json.from_json(value, path~)
      ("fNested", value) => message.f_nested = @json.from_json(value, path~)
      ("fNestedEnum", value) =>
        message.f_nested_enum = @json.from_json(value, path~)
      ("fMap", _) => message.f_map = @json.from_json(value, path~)
      ("fRepeatedString", Array(value)) =>
        message.f_repeated_string = value.map(v => @json.from_json(v, path~))
      ("fRepeatedBazMessage", Array(value)) =>
        message.f_repeated_baz_message = value.map(v => @json.from_json(
          v,
          path~,
        ))
      ("fOptionalString", value) =>
        message.f_optional_string = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] FooMessage::async_read(
  reader : R,
) -> FooMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FooMessage::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] FooMessage::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> FooMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = FooMessage::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) => msg.f_int32 = reader |> @protobuf.async_read_int32()
        (2, _) => msg.f_int64 = reader |> @protobuf.async_read_int64()
        (3, _) => msg.f_uint32 = reader |> @protobuf.async_read_uint32()
        (4, _) => msg.f_uint64 = reader |> @protobuf.async_read_uint64()
        (5, _) =>
          msg.f_sint32 = (reader |> @protobuf.async_read_sint32()).inner()
        (6, _) =>
          msg.f_sint64 = (reader |> @protobuf.async_read_sint64()).inner()
        (7, _) => msg.f_bool = reader |> @protobuf.async_read_bool()
        (8, _) =>
          msg.f_foo_enum = reader
            |> @protobuf.async_read_enum()
            |> FooEnum::from_enum
        (9, _) => msg.f_fixed64 = reader |> @protobuf.async_read_fixed64()
        (10, _) => msg.f_sfixed64 = reader |> @protobuf.async_read_sfixed64()
        (11, _) => msg.f_fixed32 = reader |> @protobuf.async_read_fixed32()
        (12, _) => msg.f_sfixed32 = reader |> @protobuf.async_read_sfixed32()
        (13, _) => msg.f_double = reader |> @protobuf.async_read_double()
        (14, _) => msg.f_float = reader |> @protobuf.async_read_float()
        (15, _) => msg.f_bytes = reader |> @protobuf.async_read_bytes()
        (16, _) => msg.f_string = reader |> @protobuf.async_read_string()
        (18, _) =>
          msg.f_bar_message = {
            let len = reader |> @protobuf.async_read_int32()
            if len == 0 {
              BarMessage::default()
            } else {
              BarMessage::async_read_with_limit(reader, limit=len)
            }
          }
        (19, _) =>
          msg.f_repeated_int32.push_iter(
            (reader
            |> @protobuf.async_read_packed(@protobuf.async_read_int32, None)).iter(),
          )
        (20, _) =>
          msg.f_repeated_packed_int32.push_iter(
            (reader
            |> @protobuf.async_read_packed(@protobuf.async_read_int32, None)).iter(),
          )
        (21, _) =>
          msg.f_repeated_packed_float.push_iter(
            (reader
            |> @protobuf.async_read_packed(@protobuf.async_read_float, Some(4))).iter(),
          )
        (23, _) =>
          msg.f_baz = {
            let len = reader |> @protobuf.async_read_int32()
            if len == 0 {
              BazMessage::default()
            } else {
              BazMessage::async_read_with_limit(reader, limit=len)
            }
          }
        (24, _) =>
          msg.f_nested = {
            let len = reader |> @protobuf.async_read_int32()
            if len == 0 {
              BazMessage_Nested::default()
            } else {
              BazMessage_Nested::async_read_with_limit(reader, limit=len)
            }
          }
        (25, _) =>
          msg.f_nested_enum = reader
            |> @protobuf.async_read_enum()
            |> BazMessage_Nested_NestedEnum::from_enum
        (26, _) => {
          let { key, value } = {
            let len = reader |> @protobuf.async_read_int32()
            if len == 0 {
              FooMessage_FMapEntry::default()
            } else {
              FooMessage_FMapEntry::async_read_with_limit(reader, limit=len)
            }
          }
          msg.f_map[key] = value
        }
        (30, _) =>
          msg.f_repeated_string.push(reader |> @protobuf.async_read_string())
        (31, _) =>
          msg.f_repeated_baz_message.push(
            {
              let len = reader |> @protobuf.async_read_int32()
              if len == 0 {
                BazMessage::default()
              } else {
                BazMessage::async_read_with_limit(reader, limit=len)
              }
            },
          )
        (32, _) =>
          msg.f_optional_string = reader
            |> @protobuf.async_read_string()
            |> Some
        (27, _) =>
          msg.test_oneof = reader
            |> @protobuf.async_read_int32()
            |> FooMessage_TestOneof::F1
        (28, _) =>
          msg.test_oneof = reader
            |> @protobuf.async_read_bool()
            |> FooMessage_TestOneof::F2
        (29, _) =>
          msg.test_oneof = reader
            |> @protobuf.async_read_string()
            |> FooMessage_TestOneof::F3
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

///|
pub async fn[W : @protobuf.AsyncWriter] FooMessage::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL)
  writer |> @protobuf.async_write_int32(self.f_int32)
  writer |> @protobuf.async_write_varint(16UL)
  writer |> @protobuf.async_write_int64(self.f_int64)
  writer |> @protobuf.async_write_varint(24UL)
  writer |> @protobuf.async_write_uint32(self.f_uint32)
  writer |> @protobuf.async_write_varint(32UL)
  writer |> @protobuf.async_write_uint64(self.f_uint64)
  writer |> @protobuf.async_write_varint(40UL)
  writer |> @protobuf.async_write_sint32(self.f_sint32)
  writer |> @protobuf.async_write_varint(48UL)
  writer |> @protobuf.async_write_sint64(self.f_sint64)
  writer |> @protobuf.async_write_varint(56UL)
  writer |> @protobuf.async_write_bool(self.f_bool)
  writer |> @protobuf.async_write_varint(64UL)
  writer |> @protobuf.async_write_enum(self.f_foo_enum.to_enum())
  writer |> @protobuf.async_write_varint(73UL)
  writer |> @protobuf.async_write_fixed64(self.f_fixed64)
  writer |> @protobuf.async_write_varint(81UL)
  writer |> @protobuf.async_write_sfixed64(self.f_sfixed64)
  writer |> @protobuf.async_write_varint(93UL)
  writer |> @protobuf.async_write_fixed32(self.f_fixed32)
  writer |> @protobuf.async_write_varint(101UL)
  writer |> @protobuf.async_write_sfixed32(self.f_sfixed32)
  writer |> @protobuf.async_write_varint(105UL)
  writer |> @protobuf.async_write_double(self.f_double)
  writer |> @protobuf.async_write_varint(117UL)
  writer |> @protobuf.async_write_float(self.f_float)
  writer |> @protobuf.async_write_varint(122UL)
  writer |> @protobuf.async_write_bytes(self.f_bytes)
  writer |> @protobuf.async_write_varint(130UL)
  writer |> @protobuf.async_write_string(self.f_string)
  writer |> @protobuf.async_write_varint(146UL)
  writer |> @protobuf.async_write_uint32(@protobuf.size_of(self.f_bar_message))
  self.f_bar_message.async_write(writer)
  writer |> @protobuf.async_write_varint(154UL)
  let size = self.f_repeated_int32
    .iter()
    .map(@protobuf.size_of)
    .fold(init=0U, UInt::op_add)
  writer |> @protobuf.async_write_uint32(size)
  for item in self.f_repeated_int32 {
    writer |> @protobuf.async_write_int32(item)
  }
  writer |> @protobuf.async_write_varint(162UL)
  let size = self.f_repeated_packed_int32
    .iter()
    .map(@protobuf.size_of)
    .fold(init=0U, UInt::op_add)
  writer |> @protobuf.async_write_uint32(size)
  for item in self.f_repeated_packed_int32 {
    writer |> @protobuf.async_write_int32(item)
  }
  writer |> @protobuf.async_write_varint(170UL)
  let size = self.f_repeated_packed_float.length().reinterpret_as_uint() * 4
  writer |> @protobuf.async_write_uint32(size)
  for item in self.f_repeated_packed_float {
    writer |> @protobuf.async_write_float(item)
  }
  writer |> @protobuf.async_write_varint(186UL)
  writer |> @protobuf.async_write_uint32(@protobuf.size_of(self.f_baz))
  self.f_baz.async_write(writer)
  writer |> @protobuf.async_write_varint(194UL)
  writer |> @protobuf.async_write_uint32(@protobuf.size_of(self.f_nested))
  self.f_nested.async_write(writer)
  writer |> @protobuf.async_write_varint(200UL)
  writer |> @protobuf.async_write_enum(self.f_nested_enum.to_enum())
  let keys = self.f_map.keys().collect()
  for i in 0..<keys.length() {
    let k = keys[i]
    let v = self.f_map.get(k).unwrap()
    writer |> @protobuf.async_write_varint(210UL)
    let key_size = 1U +
      {
        let size = @protobuf.size_of(k)
        @protobuf.size_of(size) + size
      }
    let value_size = 1U + @protobuf.size_of(v)
    writer |> @protobuf.async_write_uint32(key_size + value_size)
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_string(k)
    writer |> @protobuf.async_write_varint(16UL)
    writer |> @protobuf.async_write_int32(v)
  }
  for item in self.f_repeated_string {
    writer |> @protobuf.async_write_varint(242UL)
    writer |> @protobuf.async_write_string(item)
  }
  for item in self.f_repeated_baz_message {
    writer |> @protobuf.async_write_varint(250UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item))
    item.async_write(writer)
  }
  match self.f_optional_string {
    Some(v) => {
      writer |> @protobuf.async_write_varint(258UL)
      writer |> @protobuf.async_write_string(v)
    }
    None => ()
  }
  match self.test_oneof {
    FooMessage_TestOneof::F1(v) => {
      writer |> @protobuf.async_write_varint(216UL)
      writer |> @protobuf.async_write_int32(v)
    }
    FooMessage_TestOneof::F2(v) => {
      writer |> @protobuf.async_write_varint(224UL)
      writer |> @protobuf.async_write_bool(v)
    }
    FooMessage_TestOneof::F3(v) => {
      writer |> @protobuf.async_write_varint(234UL)
      writer |> @protobuf.async_write_string(v)
    }
    FooMessage_TestOneof::NotSet => ()
  }
}

///|
pub(all) enum BazMessage_Nested_NestedEnum {
  Foo
  Bar
  Baz
} derive(Eq, Show)

///|
pub fn BazMessage_Nested_NestedEnum::to_enum(
  self : BazMessage_Nested_NestedEnum,
) -> @protobuf.Enum {
  match self {
    BazMessage_Nested_NestedEnum::Foo => 0
    BazMessage_Nested_NestedEnum::Bar => 1
    BazMessage_Nested_NestedEnum::Baz => 2
  }
}

///|
pub fn BazMessage_Nested_NestedEnum::from_enum(
  i : @protobuf.Enum,
) -> BazMessage_Nested_NestedEnum {
  match i.inner() {
    0 => BazMessage_Nested_NestedEnum::Foo
    1 => BazMessage_Nested_NestedEnum::Bar
    2 => BazMessage_Nested_NestedEnum::Baz
    _ => Default::default()
  }
}

///|
pub impl Default for BazMessage_Nested_NestedEnum with default() -> BazMessage_Nested_NestedEnum {
  BazMessage_Nested_NestedEnum::Foo
}

///|
pub impl @protobuf.Sized for BazMessage_Nested_NestedEnum with size_of(
  self : BazMessage_Nested_NestedEnum,
) {
  @protobuf.Sized::size_of(self.to_enum())
}

///|
pub impl @json.FromJson for BazMessage_Nested_NestedEnum with from_json(
  json : Json,
  path : @json.JsonPath,
) -> BazMessage_Nested_NestedEnum raise {
  match json {
    String("Foo") => BazMessage_Nested_NestedEnum::Foo
    String("Bar") => BazMessage_Nested_NestedEnum::Bar
    String("Baz") => BazMessage_Nested_NestedEnum::Baz
    Number(0, ..) => BazMessage_Nested_NestedEnum::Foo
    Number(1, ..) => BazMessage_Nested_NestedEnum::Bar
    Number(2, ..) => BazMessage_Nested_NestedEnum::Baz
    _ =>
      raise @json.JsonDecodeError(
        (path, "Expected a number or string for enum"),
      )
  }
}

///|
pub impl ToJson for BazMessage_Nested_NestedEnum with to_json(
  self : BazMessage_Nested_NestedEnum,
) -> Json {
  match self {
    BazMessage_Nested_NestedEnum::Foo => "Foo"
    BazMessage_Nested_NestedEnum::Bar => "Bar"
    BazMessage_Nested_NestedEnum::Baz => "Baz"
  }
}

///|
pub(all) struct BazMessage_Nested_NestedMessage {
  mut f_nested : Int
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for BazMessage_Nested_NestedMessage with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.f_nested)
  size
}

///|
pub impl Default for BazMessage_Nested_NestedMessage with default() -> BazMessage_Nested_NestedMessage {
  BazMessage_Nested_NestedMessage::{ f_nested: Int::default() }
}

///|
pub fn[R : @protobuf.Reader] BazMessage_Nested_NestedMessage::read(
  reader : R,
) -> BazMessage_Nested_NestedMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  BazMessage_Nested_NestedMessage::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] BazMessage_Nested_NestedMessage::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> BazMessage_Nested_NestedMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = BazMessage_Nested_NestedMessage::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.f_nested = reader |> @protobuf.read_int32()
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

///|
pub fn[W : @protobuf.Writer] BazMessage_Nested_NestedMessage::write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.write_varint(8UL)
  writer |> @protobuf.write_int32(self.f_nested)
}

///|
pub impl ToJson for BazMessage_Nested_NestedMessage with to_json(self) {
  let json : Map[String, Json] = {}
  if self.f_nested != Default::default() {
    json["fNested"] = self.f_nested.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for BazMessage_Nested_NestedMessage with from_json(
  json : Json,
  path : @json.JsonPath,
) -> BazMessage_Nested_NestedMessage raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError(
      (path, "Expected an object for BazMessage_Nested_NestedMessage"),
    )
  }
  let message = BazMessage_Nested_NestedMessage::default()
  for key, value in obj {
    match (key, value) {
      ("fNested", value) => message.f_nested = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] BazMessage_Nested_NestedMessage::async_read(
  reader : R,
) -> BazMessage_Nested_NestedMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  BazMessage_Nested_NestedMessage::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] BazMessage_Nested_NestedMessage::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> BazMessage_Nested_NestedMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = BazMessage_Nested_NestedMessage::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) => msg.f_nested = reader |> @protobuf.async_read_int32()
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

///|
pub async fn[W : @protobuf.AsyncWriter] BazMessage_Nested_NestedMessage::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL)
  writer |> @protobuf.async_write_int32(self.f_nested)
}

///|
pub(all) struct BazMessage_Nested {
  mut f_nested : BazMessage_Nested_NestedMessage
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for BazMessage_Nested with size_of(self) {
  let mut size = 0U
  size += 1U +
    {
      let size = @protobuf.size_of(self.f_nested)
      @protobuf.size_of(size) + size
    }
  size
}

///|
pub impl Default for BazMessage_Nested with default() -> BazMessage_Nested {
  BazMessage_Nested::{ f_nested: BazMessage_Nested_NestedMessage::default() }
}

///|
pub fn[R : @protobuf.Reader] BazMessage_Nested::read(
  reader : R,
) -> BazMessage_Nested raise {
  let reader = @protobuf.LimitedReader::new(reader)
  BazMessage_Nested::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] BazMessage_Nested::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> BazMessage_Nested raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = BazMessage_Nested::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) =>
          msg.f_nested = {
            let len = reader |> @protobuf.read_int32()
            if len == 0 {
              BazMessage_Nested_NestedMessage::default()
            } else {
              BazMessage_Nested_NestedMessage::read_with_limit(
                reader,
                limit=len,
              )
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

///|
pub fn[W : @protobuf.Writer] BazMessage_Nested::write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.write_varint(10UL)
  writer |> @protobuf.write_uint32(@protobuf.size_of(self.f_nested))
  self.f_nested.write(writer)
}

///|
pub impl ToJson for BazMessage_Nested with to_json(self) {
  let json : Map[String, Json] = {}
  if self.f_nested != Default::default() {
    json["fNested"] = self.f_nested.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for BazMessage_Nested with from_json(
  json : Json,
  path : @json.JsonPath,
) -> BazMessage_Nested raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError(
      (path, "Expected an object for BazMessage_Nested"),
    )
  }
  let message = BazMessage_Nested::default()
  for key, value in obj {
    match (key, value) {
      ("fNested", value) => message.f_nested = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] BazMessage_Nested::async_read(
  reader : R,
) -> BazMessage_Nested raise {
  let reader = @protobuf.LimitedReader::new(reader)
  BazMessage_Nested::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] BazMessage_Nested::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> BazMessage_Nested raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = BazMessage_Nested::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) =>
          msg.f_nested = {
            let len = reader |> @protobuf.async_read_int32()
            if len == 0 {
              BazMessage_Nested_NestedMessage::default()
            } else {
              BazMessage_Nested_NestedMessage::async_read_with_limit(
                reader,
                limit=len,
              )
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

///|
pub async fn[W : @protobuf.AsyncWriter] BazMessage_Nested::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL)
  writer |> @protobuf.async_write_uint32(@protobuf.size_of(self.f_nested))
  self.f_nested.async_write(writer)
}

///|
pub(all) struct BazMessage {
  mut nested : BazMessage_Nested
  mut b_int64 : Int64
  mut b_string : String
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for BazMessage with size_of(self) {
  let mut size = 0U
  size += 1U +
    {
      let size = @protobuf.size_of(self.nested)
      @protobuf.size_of(size) + size
    }
  size += 1U + @protobuf.size_of(self.b_int64)
  size += 1U +
    {
      let size = @protobuf.size_of(self.b_string)
      @protobuf.size_of(size) + size
    }
  size
}

///|
pub impl Default for BazMessage with default() -> BazMessage {
  BazMessage::{
    nested: BazMessage_Nested::default(),
    b_int64: Int64::default(),
    b_string: String::default(),
  }
}

///|
pub fn[R : @protobuf.Reader] BazMessage::read(reader : R) -> BazMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  BazMessage::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] BazMessage::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> BazMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = BazMessage::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) =>
          msg.nested = {
            let len = reader |> @protobuf.read_int32()
            if len == 0 {
              BazMessage_Nested::default()
            } else {
              BazMessage_Nested::read_with_limit(reader, limit=len)
            }
          }
        (2, _) => msg.b_int64 = reader |> @protobuf.read_int64()
        (3, _) => msg.b_string = reader |> @protobuf.read_string()
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

///|
pub fn[W : @protobuf.Writer] BazMessage::write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.write_varint(10UL)
  writer |> @protobuf.write_uint32(@protobuf.size_of(self.nested))
  self.nested.write(writer)
  writer |> @protobuf.write_varint(16UL)
  writer |> @protobuf.write_int64(self.b_int64)
  writer |> @protobuf.write_varint(26UL)
  writer |> @protobuf.write_string(self.b_string)
}

///|
pub impl ToJson for BazMessage with to_json(self) {
  let json : Map[String, Json] = {}
  if self.nested != Default::default() {
    json["nested"] = self.nested.to_json()
  }
  if self.b_int64 != Default::default() {
    json["bInt64"] = self.b_int64.to_json()
  }
  if self.b_string != Default::default() {
    json["bString"] = self.b_string.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for BazMessage with from_json(
  json : Json,
  path : @json.JsonPath,
) -> BazMessage raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for BazMessage"))
  }
  let message = BazMessage::default()
  for key, value in obj {
    match (key, value) {
      ("nested", value) => message.nested = @json.from_json(value, path~)
      ("bInt64", value) => message.b_int64 = @json.from_json(value, path~)
      ("bString", value) => message.b_string = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] BazMessage::async_read(
  reader : R,
) -> BazMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  BazMessage::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] BazMessage::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> BazMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = BazMessage::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) =>
          msg.nested = {
            let len = reader |> @protobuf.async_read_int32()
            if len == 0 {
              BazMessage_Nested::default()
            } else {
              BazMessage_Nested::async_read_with_limit(reader, limit=len)
            }
          }
        (2, _) => msg.b_int64 = reader |> @protobuf.async_read_int64()
        (3, _) => msg.b_string = reader |> @protobuf.async_read_string()
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

///|
pub async fn[W : @protobuf.AsyncWriter] BazMessage::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL)
  writer |> @protobuf.async_write_uint32(@protobuf.size_of(self.nested))
  self.nested.async_write(writer)
  writer |> @protobuf.async_write_varint(16UL)
  writer |> @protobuf.async_write_int64(self.b_int64)
  writer |> @protobuf.async_write_varint(26UL)
  writer |> @protobuf.async_write_string(self.b_string)
}

///|
pub(all) struct RepeatedMessage {
  mut bar_message : Array[BarMessage]
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for RepeatedMessage with size_of(self) {
  let mut size = 0U
  size += self.bar_message
    .iter()
    .map(@protobuf.size_of)
    .map(s => 1U + @protobuf.size_of(s) + s)
    .fold(init=0U, UInt::op_add)
  size
}

///|
pub impl Default for RepeatedMessage with default() -> RepeatedMessage {
  RepeatedMessage::{ bar_message: [] }
}

///|
pub fn[R : @protobuf.Reader] RepeatedMessage::read(
  reader : R,
) -> RepeatedMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  RepeatedMessage::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] RepeatedMessage::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> RepeatedMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = RepeatedMessage::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) =>
          msg.bar_message.push(
            {
              let len = reader |> @protobuf.read_int32()
              if len == 0 {
                BarMessage::default()
              } else {
                BarMessage::read_with_limit(reader, limit=len)
              }
            },
          )
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

///|
pub fn[W : @protobuf.Writer] RepeatedMessage::write(
  self : Self,
  writer : W,
) -> Unit raise {
  for item in self.bar_message {
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item))
    item.write(writer)
  }
}

///|
pub impl ToJson for RepeatedMessage with to_json(self) {
  let json : Map[String, Json] = {}
  if self.bar_message != Default::default() {
    json["barMessage"] = self.bar_message.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for RepeatedMessage with from_json(
  json : Json,
  path : @json.JsonPath,
) -> RepeatedMessage raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError(
      (path, "Expected an object for RepeatedMessage"),
    )
  }
  let message = RepeatedMessage::default()
  for key, value in obj {
    match (key, value) {
      ("barMessage", Array(value)) =>
        message.bar_message = value.map(v => @json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] RepeatedMessage::async_read(
  reader : R,
) -> RepeatedMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  RepeatedMessage::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] RepeatedMessage::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> RepeatedMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = RepeatedMessage::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) =>
          msg.bar_message.push(
            {
              let len = reader |> @protobuf.async_read_int32()
              if len == 0 {
                BarMessage::default()
              } else {
                BarMessage::async_read_with_limit(reader, limit=len)
              }
            },
          )
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

///|
pub async fn[W : @protobuf.AsyncWriter] RepeatedMessage::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  for item in self.bar_message {
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item))
    item.async_write(writer)
  }
}

///|
pub(all) struct EmptyMessage {
  mut field : Int
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for EmptyMessage with size_of(self) {
  let mut size = 0U
  size += 1U + @protobuf.size_of(self.field)
  size
}

///|
pub impl Default for EmptyMessage with default() -> EmptyMessage {
  EmptyMessage::{ field: Int::default() }
}

///|
pub fn[R : @protobuf.Reader] EmptyMessage::read(
  reader : R,
) -> EmptyMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EmptyMessage::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] EmptyMessage::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> EmptyMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = EmptyMessage::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.field = reader |> @protobuf.read_int32()
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

///|
pub fn[W : @protobuf.Writer] EmptyMessage::write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.write_varint(8UL)
  writer |> @protobuf.write_int32(self.field)
}

///|
pub impl ToJson for EmptyMessage with to_json(self) {
  let json : Map[String, Json] = {}
  if self.field != Default::default() {
    json["field"] = self.field.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for EmptyMessage with from_json(
  json : Json,
  path : @json.JsonPath,
) -> EmptyMessage raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for EmptyMessage"))
  }
  let message = EmptyMessage::default()
  for key, value in obj {
    match (key, value) {
      ("field", value) => message.field = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] EmptyMessage::async_read(
  reader : R,
) -> EmptyMessage raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EmptyMessage::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] EmptyMessage::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> EmptyMessage raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = EmptyMessage::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) => msg.field = reader |> @protobuf.async_read_int32()
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

///|
pub async fn[W : @protobuf.AsyncWriter] EmptyMessage::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.async_write_varint(8UL)
  writer |> @protobuf.async_write_int32(self.field)
}

///|
pub(all) struct EmptyMessageWithField {
  mut empty_message : EmptyMessage
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for EmptyMessageWithField with size_of(self) {
  let mut size = 0U
  size += 1U +
    {
      let size = @protobuf.size_of(self.empty_message)
      @protobuf.size_of(size) + size
    }
  size
}

///|
pub impl Default for EmptyMessageWithField with default() -> EmptyMessageWithField {
  EmptyMessageWithField::{ empty_message: EmptyMessage::default() }
}

///|
pub fn[R : @protobuf.Reader] EmptyMessageWithField::read(
  reader : R,
) -> EmptyMessageWithField raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EmptyMessageWithField::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] EmptyMessageWithField::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> EmptyMessageWithField raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = EmptyMessageWithField::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) =>
          msg.empty_message = {
            let len = reader |> @protobuf.read_int32()
            if len == 0 {
              EmptyMessage::default()
            } else {
              EmptyMessage::read_with_limit(reader, limit=len)
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

///|
pub fn[W : @protobuf.Writer] EmptyMessageWithField::write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.write_varint(10UL)
  writer |> @protobuf.write_uint32(@protobuf.size_of(self.empty_message))
  self.empty_message.write(writer)
}

///|
pub impl ToJson for EmptyMessageWithField with to_json(self) {
  let json : Map[String, Json] = {}
  if self.empty_message != Default::default() {
    json["emptyMessage"] = self.empty_message.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for EmptyMessageWithField with from_json(
  json : Json,
  path : @json.JsonPath,
) -> EmptyMessageWithField raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError(
      (path, "Expected an object for EmptyMessageWithField"),
    )
  }
  let message = EmptyMessageWithField::default()
  for key, value in obj {
    match (key, value) {
      ("emptyMessage", value) =>
        message.empty_message = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] EmptyMessageWithField::async_read(
  reader : R,
) -> EmptyMessageWithField raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EmptyMessageWithField::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] EmptyMessageWithField::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> EmptyMessageWithField raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = EmptyMessageWithField::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) =>
          msg.empty_message = {
            let len = reader |> @protobuf.async_read_int32()
            if len == 0 {
              EmptyMessage::default()
            } else {
              EmptyMessage::async_read_with_limit(reader, limit=len)
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

///|
pub async fn[W : @protobuf.AsyncWriter] EmptyMessageWithField::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL)
  writer |> @protobuf.async_write_uint32(@protobuf.size_of(self.empty_message))
  self.empty_message.async_write(writer)
}
