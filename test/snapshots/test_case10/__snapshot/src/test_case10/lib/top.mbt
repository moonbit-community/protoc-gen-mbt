pub(all) struct Hello_MetadataEntry {
  mut key : String
  mut value : String
} derive(Eq, Show)
pub impl @protobuf.Sized for Hello_MetadataEntry with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.key); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.value); @protobuf.size_of(size) + size }
  size
}
pub impl Default for Hello_MetadataEntry with default() -> Hello_MetadataEntry {
  Hello_MetadataEntry::{
    key : String::default(),
    value : String::default(),
  }
}
pub  fn[R: @protobuf.Reader] Hello_MetadataEntry::read(reader : R) -> Hello_MetadataEntry raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Hello_MetadataEntry::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] Hello_MetadataEntry::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Hello_MetadataEntry raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Hello_MetadataEntry::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.key = reader |> @protobuf.read_string()
      (2, _) => msg.value = reader |> @protobuf.read_string()
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
pub  fn[W: @protobuf.Writer] Hello_MetadataEntry::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.key)
  writer |> @protobuf.write_varint(18UL);
  writer |> @protobuf.write_string(self.value)
}
pub impl ToJson for Hello_MetadataEntry with to_json(self) {
  let json: Map[String, Json] = {}
  if self.key != Default::default() {
  json["key"] = self.key.to_json()
  }
  if self.value != Default::default() {
  json["value"] = self.value.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Hello_MetadataEntry with from_json(json: Json, path: @json.JsonPath) -> Hello_MetadataEntry raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Hello_MetadataEntry"))
  }
  let message = Hello_MetadataEntry::default()
  for key, value in obj {
    match (key, value) {
      ("key", value) => message.key = @json.from_json(value, path~)
      ("value", value) => message.value = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] Hello_MetadataEntry::async_read(reader : R) -> Hello_MetadataEntry raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Hello_MetadataEntry::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] Hello_MetadataEntry::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Hello_MetadataEntry raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Hello_MetadataEntry::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.key = reader |> @protobuf.async_read_string()
      (2, _) => msg.value = reader |> @protobuf.async_read_string()
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
pub async fn[W: @protobuf.AsyncWriter] Hello_MetadataEntry::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.key)
  writer |> @protobuf.async_write_varint(18UL);
  writer |> @protobuf.async_write_string(self.value)
}
pub(all) struct Hello {
  mut name : String
  mut age : Int
  mut hobbies : Array[String]
  mut metadata : Map[String, String]
  mut friend : Hello?
} derive(Eq, Show)
pub impl @protobuf.Sized for Hello with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.name); @protobuf.size_of(size) + size }
  size += 1U + @protobuf.size_of(self.age)
  size += self.hobbies.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.metadata.iter().map(fn(key_value) {
    let (k, v) = key_value
    let key_size = 1U + { let size = @protobuf.size_of(k); @protobuf.size_of(size) + size }
    let value_size = 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    1U + @protobuf.size_of(key_size + value_size) + key_size + value_size 
  }).fold(init=0U, UInt::op_add)
  match self.friend {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for Hello with default() -> Hello {
  Hello::{
    name : String::default(),
    age : Int::default(),
    hobbies : [],
    metadata : {},
    friend : None,
  }
}
pub  fn[R: @protobuf.Reader] Hello::read(reader : R) -> Hello raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Hello::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] Hello::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Hello raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Hello::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.age = reader |> @protobuf.read_int32()
      (3, _) => msg.hobbies.push(reader |> @protobuf.read_string())
      (4, _) => { let {key, value} =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      Hello_MetadataEntry::default()
    } else {
      Hello_MetadataEntry::read_with_limit(reader, limit=len)
    }
  }; msg.metadata[key] = value }
      (5, _) => msg.friend =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      Hello::default()
    } else {
      Hello::read_with_limit(reader, limit=len)
    }
  } |> Some
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
pub  fn[W: @protobuf.Writer] Hello::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.name)
  writer |> @protobuf.write_varint(16UL);
  writer |> @protobuf.write_int32(self.age)
  for item in self.hobbies {
    writer |> @protobuf.write_varint(26UL)
    writer |> @protobuf.write_string(item)

  }
  let keys = self.metadata.keys().collect()
  for i in 0..<keys.length() {
    let k = keys[i]
    let v = self.metadata.get(k).unwrap()
    writer |> @protobuf.write_varint(34UL)
    let key_size = 1U + { let size = @protobuf.size_of(k); @protobuf.size_of(size) + size }
    let value_size = 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    writer |> @protobuf.write_uint32(key_size + value_size)
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_string(k)

    writer |> @protobuf.write_varint(18UL);
    writer |> @protobuf.write_string(v)

  }
   match self.friend {
    Some(v) => {
      writer |> @protobuf.write_varint(42UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
}
pub impl ToJson for Hello with to_json(self) {
  let json: Map[String, Json] = {}
  if self.name != Default::default() {
  json["name"] = self.name.to_json()
  }
  if self.age != Default::default() {
  json["age"] = self.age.to_json()
  }
  if self.hobbies != Default::default() {
  json["hobbies"] = self.hobbies.to_json()
  }
  if self.metadata != Default::default() {
  json["metadata"] = self.metadata.to_json()
  }
  match self.friend {
      Some(v) => json["friend"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for Hello with from_json(json: Json, path: @json.JsonPath) -> Hello raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Hello"))
  }
  let message = Hello::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = @json.from_json(value, path~)
      ("age", value) => message.age = @json.from_json(value, path~)
      ("hobbies", Array(value)) => message.hobbies = value.map(v => 
@json.from_json(v, path~))
      ("metadata", _) => message.metadata = @json.from_json(value, path~)
      ("friend", value) => message.friend = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] Hello::async_read(reader : R) -> Hello raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Hello::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] Hello::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Hello raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Hello::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.age = reader |> @protobuf.async_read_int32()
      (3, _) => msg.hobbies.push(reader |> @protobuf.async_read_string())
      (4, _) => { let {key, value} =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      Hello_MetadataEntry::default()
    } else {
      Hello_MetadataEntry::async_read_with_limit(reader, limit=len)
    }
  }; msg.metadata[key] = value }
      (5, _) => msg.friend =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      Hello::default()
    } else {
      Hello::async_read_with_limit(reader, limit=len)
    }
  } |> Some
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
pub async fn[W: @protobuf.AsyncWriter] Hello::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.name)
  writer |> @protobuf.async_write_varint(16UL);
  writer |> @protobuf.async_write_int32(self.age)
  for item in self.hobbies {
    writer |> @protobuf.async_write_varint(26UL)
    writer |> @protobuf.async_write_string(item)

  }
  let keys = self.metadata.keys().collect()
  for i in 0..<keys.length() {
    let k = keys[i]
    let v = self.metadata.get(k).unwrap()
    writer |> @protobuf.async_write_varint(34UL)
    let key_size = 1U + { let size = @protobuf.size_of(k); @protobuf.size_of(size) + size }
    let value_size = 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    writer |> @protobuf.async_write_uint32(key_size + value_size)
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_string(k)

    writer |> @protobuf.async_write_varint(18UL);
    writer |> @protobuf.async_write_string(v)

  }
   match self.friend {
    Some(v) => {
      writer |> @protobuf.async_write_varint(42UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
}
