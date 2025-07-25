pub(all) enum Edition {
  EDITION_UNKNOWN
  EDITION_LEGACY
  EDITION_PROTO2
  EDITION_PROTO3
  EDITION_2023
  EDITION_2024
  EDITION_1_TEST_ONLY
  EDITION_2_TEST_ONLY
  EDITION_99997_TEST_ONLY
  EDITION_99998_TEST_ONLY
  EDITION_99999_TEST_ONLY
  EDITION_MAX
} derive(Eq, Show)
pub fn Edition::to_enum(self : Edition) -> @protobuf.Enum {
  match self {
    Edition::EDITION_UNKNOWN => 0
    Edition::EDITION_LEGACY => 900
    Edition::EDITION_PROTO2 => 998
    Edition::EDITION_PROTO3 => 999
    Edition::EDITION_2023 => 1000
    Edition::EDITION_2024 => 1001
    Edition::EDITION_1_TEST_ONLY => 1
    Edition::EDITION_2_TEST_ONLY => 2
    Edition::EDITION_99997_TEST_ONLY => 99997
    Edition::EDITION_99998_TEST_ONLY => 99998
    Edition::EDITION_99999_TEST_ONLY => 99999
    Edition::EDITION_MAX => 2147483647
  }
}
pub fn Edition::from_enum(i : @protobuf.Enum) -> Edition {
  match i.inner() {
    0 => Edition::EDITION_UNKNOWN
    900 => Edition::EDITION_LEGACY
    998 => Edition::EDITION_PROTO2
    999 => Edition::EDITION_PROTO3
    1000 => Edition::EDITION_2023
    1001 => Edition::EDITION_2024
    1 => Edition::EDITION_1_TEST_ONLY
    2 => Edition::EDITION_2_TEST_ONLY
    99997 => Edition::EDITION_99997_TEST_ONLY
    99998 => Edition::EDITION_99998_TEST_ONLY
    99999 => Edition::EDITION_99999_TEST_ONLY
    2147483647 => Edition::EDITION_MAX
    _ => Default::default()
  }
}
pub impl Default for Edition with default() -> Edition {
  Edition::EDITION_UNKNOWN
}
pub impl @protobuf.Sized for Edition with size_of(self : Edition) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for Edition with from_json(json: Json, path: @json.JsonPath) -> Edition raise {
  match json {
    String("EDITION_UNKNOWN") => Edition::EDITION_UNKNOWN
    String("EDITION_LEGACY") => Edition::EDITION_LEGACY
    String("EDITION_PROTO2") => Edition::EDITION_PROTO2
    String("EDITION_PROTO3") => Edition::EDITION_PROTO3
    String("EDITION_2023") => Edition::EDITION_2023
    String("EDITION_2024") => Edition::EDITION_2024
    String("EDITION_1_TEST_ONLY") => Edition::EDITION_1_TEST_ONLY
    String("EDITION_2_TEST_ONLY") => Edition::EDITION_2_TEST_ONLY
    String("EDITION_99997_TEST_ONLY") => Edition::EDITION_99997_TEST_ONLY
    String("EDITION_99998_TEST_ONLY") => Edition::EDITION_99998_TEST_ONLY
    String("EDITION_99999_TEST_ONLY") => Edition::EDITION_99999_TEST_ONLY
    String("EDITION_MAX") => Edition::EDITION_MAX
    Number(0, ..) => Edition::EDITION_UNKNOWN
    Number(900, ..) => Edition::EDITION_LEGACY
    Number(998, ..) => Edition::EDITION_PROTO2
    Number(999, ..) => Edition::EDITION_PROTO3
    Number(1000, ..) => Edition::EDITION_2023
    Number(1001, ..) => Edition::EDITION_2024
    Number(1, ..) => Edition::EDITION_1_TEST_ONLY
    Number(2, ..) => Edition::EDITION_2_TEST_ONLY
    Number(99997, ..) => Edition::EDITION_99997_TEST_ONLY
    Number(99998, ..) => Edition::EDITION_99998_TEST_ONLY
    Number(99999, ..) => Edition::EDITION_99999_TEST_ONLY
    Number(2147483647, ..) => Edition::EDITION_MAX
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for Edition with to_json(self : Edition) -> Json {
  match self {
    Edition::EDITION_UNKNOWN => "EDITION_UNKNOWN"
    Edition::EDITION_LEGACY => "EDITION_LEGACY"
    Edition::EDITION_PROTO2 => "EDITION_PROTO2"
    Edition::EDITION_PROTO3 => "EDITION_PROTO3"
    Edition::EDITION_2023 => "EDITION_2023"
    Edition::EDITION_2024 => "EDITION_2024"
    Edition::EDITION_1_TEST_ONLY => "EDITION_1_TEST_ONLY"
    Edition::EDITION_2_TEST_ONLY => "EDITION_2_TEST_ONLY"
    Edition::EDITION_99997_TEST_ONLY => "EDITION_99997_TEST_ONLY"
    Edition::EDITION_99998_TEST_ONLY => "EDITION_99998_TEST_ONLY"
    Edition::EDITION_99999_TEST_ONLY => "EDITION_99999_TEST_ONLY"
    Edition::EDITION_MAX => "EDITION_MAX"
  }
}
pub(all) enum SymbolVisibility {
  VISIBILITY_UNSET
  VISIBILITY_LOCAL
  VISIBILITY_EXPORT
} derive(Eq, Show)
pub fn SymbolVisibility::to_enum(self : SymbolVisibility) -> @protobuf.Enum {
  match self {
    SymbolVisibility::VISIBILITY_UNSET => 0
    SymbolVisibility::VISIBILITY_LOCAL => 1
    SymbolVisibility::VISIBILITY_EXPORT => 2
  }
}
pub fn SymbolVisibility::from_enum(i : @protobuf.Enum) -> SymbolVisibility {
  match i.inner() {
    0 => SymbolVisibility::VISIBILITY_UNSET
    1 => SymbolVisibility::VISIBILITY_LOCAL
    2 => SymbolVisibility::VISIBILITY_EXPORT
    _ => Default::default()
  }
}
pub impl Default for SymbolVisibility with default() -> SymbolVisibility {
  SymbolVisibility::VISIBILITY_UNSET
}
pub impl @protobuf.Sized for SymbolVisibility with size_of(self : SymbolVisibility) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for SymbolVisibility with from_json(json: Json, path: @json.JsonPath) -> SymbolVisibility raise {
  match json {
    String("VISIBILITY_UNSET") => SymbolVisibility::VISIBILITY_UNSET
    String("VISIBILITY_LOCAL") => SymbolVisibility::VISIBILITY_LOCAL
    String("VISIBILITY_EXPORT") => SymbolVisibility::VISIBILITY_EXPORT
    Number(0, ..) => SymbolVisibility::VISIBILITY_UNSET
    Number(1, ..) => SymbolVisibility::VISIBILITY_LOCAL
    Number(2, ..) => SymbolVisibility::VISIBILITY_EXPORT
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for SymbolVisibility with to_json(self : SymbolVisibility) -> Json {
  match self {
    SymbolVisibility::VISIBILITY_UNSET => "VISIBILITY_UNSET"
    SymbolVisibility::VISIBILITY_LOCAL => "VISIBILITY_LOCAL"
    SymbolVisibility::VISIBILITY_EXPORT => "VISIBILITY_EXPORT"
  }
}
pub(all) struct FileDescriptorSet {
  mut file : Array[FileDescriptorProto]
} derive(Eq, Show)
pub impl @protobuf.Sized for FileDescriptorSet with size_of(self) {
  let mut size = 0U
  size += self.file.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for FileDescriptorSet with default() -> FileDescriptorSet {
  FileDescriptorSet::{
    file : [],
  }
}
pub  fn[R: @protobuf.Reader] FileDescriptorSet::read(reader : R) -> FileDescriptorSet raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FileDescriptorSet::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FileDescriptorSet::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FileDescriptorSet raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FileDescriptorSet::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.file.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FileDescriptorProto::default()
    } else {
      FileDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] FileDescriptorSet::write(self:Self, writer : W) -> Unit raise {
  for item in self.file {
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for FileDescriptorSet with to_json(self) {
  let json: Map[String, Json] = {}
  if self.file != Default::default() {
  json["file"] = self.file.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for FileDescriptorSet with from_json(json: Json, path: @json.JsonPath) -> FileDescriptorSet raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FileDescriptorSet"))
  }
  let message = FileDescriptorSet::default()
  for key, value in obj {
    match (key, value) {
      ("file", Array(value)) => message.file = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FileDescriptorSet::async_read(reader : R) -> FileDescriptorSet raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FileDescriptorSet::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FileDescriptorSet::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FileDescriptorSet raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FileDescriptorSet::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.file.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FileDescriptorProto::default()
    } else {
      FileDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] FileDescriptorSet::async_write(self:Self, writer : W) -> Unit raise {
  for item in self.file {
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) struct FileDescriptorProto {
  mut name : String?
  mut package_ : String?
  mut dependency : Array[String]
  mut public_dependency : Array[Int]
  mut weak_dependency : Array[Int]
  mut option_dependency : Array[String]
  mut message_type : Array[DescriptorProto]
  mut enum_type : Array[EnumDescriptorProto]
  mut service : Array[ServiceDescriptorProto]
  mut extension : Array[FieldDescriptorProto]
  mut options : FileOptions?
  mut source_code_info : SourceCodeInfo?
  mut syntax : String?
  mut edition : Edition?
} derive(Eq, Show)
pub impl @protobuf.Sized for FileDescriptorProto with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.package_ {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.dependency.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.public_dependency.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.weak_dependency.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.option_dependency.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.message_type.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.enum_type.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.service.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.extension.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.source_code_info {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.syntax {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.edition {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for FileDescriptorProto with default() -> FileDescriptorProto {
  FileDescriptorProto::{
    name : None,
    package_ : None,
    dependency : [],
    public_dependency : [],
    weak_dependency : [],
    option_dependency : [],
    message_type : [],
    enum_type : [],
    service : [],
    extension : [],
    options : None,
    source_code_info : None,
    syntax : None,
    edition : None,
  }
}
pub  fn[R: @protobuf.Reader] FileDescriptorProto::read(reader : R) -> FileDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FileDescriptorProto::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FileDescriptorProto::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FileDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FileDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.package_ = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.dependency.push(reader |> @protobuf.read_string())
      (10, _) => msg.public_dependency.push(reader |> @protobuf.read_int32())
      (11, _) => msg.weak_dependency.push(reader |> @protobuf.read_int32())
      (15, _) => msg.option_dependency.push(reader |> @protobuf.read_string())
      (4, _) => msg.message_type.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      DescriptorProto::default()
    } else {
      DescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.enum_type.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      EnumDescriptorProto::default()
    } else {
      EnumDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (6, _) => msg.service.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      ServiceDescriptorProto::default()
    } else {
      ServiceDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (7, _) => msg.extension.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FieldDescriptorProto::default()
    } else {
      FieldDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (8, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FileOptions::default()
    } else {
      FileOptions::read_with_limit(reader, limit=len)
    }
  } |> Some
      (9, _) => msg.source_code_info =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      SourceCodeInfo::default()
    } else {
      SourceCodeInfo::read_with_limit(reader, limit=len)
    }
  } |> Some
      (12, _) => msg.syntax = reader |> @protobuf.read_string() |> Some
      (14, _) => msg.edition = reader |> @protobuf.read_enum() |> Edition::from_enum |> Some
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
pub  fn[W: @protobuf.Writer] FileDescriptorProto::write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.package_ {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  for item in self.dependency {
    writer |> @protobuf.write_varint(26UL)
    writer |> @protobuf.write_string(item)

  }
  for item in self.public_dependency {
    writer |> @protobuf.write_varint(80UL)
    writer |> @protobuf.write_int32(item)

  }
  for item in self.weak_dependency {
    writer |> @protobuf.write_varint(88UL)
    writer |> @protobuf.write_int32(item)

  }
  for item in self.option_dependency {
    writer |> @protobuf.write_varint(122UL)
    writer |> @protobuf.write_string(item)

  }
  for item in self.message_type {
    writer |> @protobuf.write_varint(34UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.enum_type {
    writer |> @protobuf.write_varint(42UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.service {
    writer |> @protobuf.write_varint(50UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.extension {
    writer |> @protobuf.write_varint(58UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(66UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.source_code_info {
    Some(v) => {
      writer |> @protobuf.write_varint(74UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.syntax {
    Some(v) => {
      writer |> @protobuf.write_varint(98UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.edition {
    Some(v) => {
      writer |> @protobuf.write_varint(112UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
}
pub impl ToJson for FileDescriptorProto with to_json(self) {
  let json: Map[String, Json] = {}
  match self.name {
      Some(v) => json["name"] = v.to_json()
      _ => ()
    }
  match self.package_ {
      Some(v) => json["package"] = v.to_json()
      _ => ()
    }
  if self.dependency != Default::default() {
  json["dependency"] = self.dependency.to_json()
  }
  if self.public_dependency != Default::default() {
  json["publicDependency"] = self.public_dependency.to_json()
  }
  if self.weak_dependency != Default::default() {
  json["weakDependency"] = self.weak_dependency.to_json()
  }
  if self.option_dependency != Default::default() {
  json["optionDependency"] = self.option_dependency.to_json()
  }
  if self.message_type != Default::default() {
  json["messageType"] = self.message_type.to_json()
  }
  if self.enum_type != Default::default() {
  json["enumType"] = self.enum_type.to_json()
  }
  if self.service != Default::default() {
  json["service"] = self.service.to_json()
  }
  if self.extension != Default::default() {
  json["extension"] = self.extension.to_json()
  }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  match self.source_code_info {
      Some(v) => json["sourceCodeInfo"] = v.to_json()
      _ => ()
    }
  match self.syntax {
      Some(v) => json["syntax"] = v.to_json()
      _ => ()
    }
  match self.edition {
      Some(v) => json["edition"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for FileDescriptorProto with from_json(json: Json, path: @json.JsonPath) -> FileDescriptorProto raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FileDescriptorProto"))
  }
  let message = FileDescriptorProto::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("package", value) => message.package_ = Some(@json.from_json(value, path~))
      ("dependency", Array(value)) => message.dependency = value.map(v => 
@json.from_json(v, path~))
      ("publicDependency", Array(value)) => message.public_dependency = value.map(v => 
@json.from_json(v, path~))
      ("weakDependency", Array(value)) => message.weak_dependency = value.map(v => 
@json.from_json(v, path~))
      ("optionDependency", Array(value)) => message.option_dependency = value.map(v => 
@json.from_json(v, path~))
      ("messageType", Array(value)) => message.message_type = value.map(v => 
@json.from_json(v, path~))
      ("enumType", Array(value)) => message.enum_type = value.map(v => 
@json.from_json(v, path~))
      ("service", Array(value)) => message.service = value.map(v => 
@json.from_json(v, path~))
      ("extension", Array(value)) => message.extension = value.map(v => 
@json.from_json(v, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      ("sourceCodeInfo", value) => message.source_code_info = Some(@json.from_json(value, path~))
      ("syntax", value) => message.syntax = Some(@json.from_json(value, path~))
      ("edition", value) => message.edition = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FileDescriptorProto::async_read(reader : R) -> FileDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FileDescriptorProto::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FileDescriptorProto::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FileDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FileDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.package_ = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.dependency.push(reader |> @protobuf.async_read_string())
      (10, _) => msg.public_dependency.push(reader |> @protobuf.async_read_int32())
      (11, _) => msg.weak_dependency.push(reader |> @protobuf.async_read_int32())
      (15, _) => msg.option_dependency.push(reader |> @protobuf.async_read_string())
      (4, _) => msg.message_type.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      DescriptorProto::default()
    } else {
      DescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.enum_type.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      EnumDescriptorProto::default()
    } else {
      EnumDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (6, _) => msg.service.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      ServiceDescriptorProto::default()
    } else {
      ServiceDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (7, _) => msg.extension.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FieldDescriptorProto::default()
    } else {
      FieldDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (8, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FileOptions::default()
    } else {
      FileOptions::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (9, _) => msg.source_code_info =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      SourceCodeInfo::default()
    } else {
      SourceCodeInfo::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (12, _) => msg.syntax = reader |> @protobuf.async_read_string() |> Some
      (14, _) => msg.edition = reader |> @protobuf.async_read_enum() |> Edition::from_enum |> Some
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
pub async fn[W: @protobuf.AsyncWriter] FileDescriptorProto::async_write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.package_ {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  for item in self.dependency {
    writer |> @protobuf.async_write_varint(26UL)
    writer |> @protobuf.async_write_string(item)

  }
  for item in self.public_dependency {
    writer |> @protobuf.async_write_varint(80UL)
    writer |> @protobuf.async_write_int32(item)

  }
  for item in self.weak_dependency {
    writer |> @protobuf.async_write_varint(88UL)
    writer |> @protobuf.async_write_int32(item)

  }
  for item in self.option_dependency {
    writer |> @protobuf.async_write_varint(122UL)
    writer |> @protobuf.async_write_string(item)

  }
  for item in self.message_type {
    writer |> @protobuf.async_write_varint(34UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.enum_type {
    writer |> @protobuf.async_write_varint(42UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.service {
    writer |> @protobuf.async_write_varint(50UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.extension {
    writer |> @protobuf.async_write_varint(58UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(66UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.source_code_info {
    Some(v) => {
      writer |> @protobuf.async_write_varint(74UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.syntax {
    Some(v) => {
      writer |> @protobuf.async_write_varint(98UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.edition {
    Some(v) => {
      writer |> @protobuf.async_write_varint(112UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
}
pub(all) struct DescriptorProto_ExtensionRange {
  mut start : Int?
  mut end : Int?
  mut options : ExtensionRangeOptions?
} derive(Eq, Show)
pub impl @protobuf.Sized for DescriptorProto_ExtensionRange with size_of(self) {
  let mut size = 0U
  match self.start {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.end {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for DescriptorProto_ExtensionRange with default() -> DescriptorProto_ExtensionRange {
  DescriptorProto_ExtensionRange::{
    start : None,
    end : None,
    options : None,
  }
}
pub  fn[R: @protobuf.Reader] DescriptorProto_ExtensionRange::read(reader : R) -> DescriptorProto_ExtensionRange raise {
  let reader = @protobuf.LimitedReader::new(reader)
  DescriptorProto_ExtensionRange::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] DescriptorProto_ExtensionRange::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> DescriptorProto_ExtensionRange raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = DescriptorProto_ExtensionRange::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.start = reader |> @protobuf.read_int32() |> Some
      (2, _) => msg.end = reader |> @protobuf.read_int32() |> Some
      (3, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      ExtensionRangeOptions::default()
    } else {
      ExtensionRangeOptions::read_with_limit(reader, limit=len)
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
pub  fn[W: @protobuf.Writer] DescriptorProto_ExtensionRange::write(self:Self, writer : W) -> Unit raise {
  match self.start {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.end {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
}
pub impl ToJson for DescriptorProto_ExtensionRange with to_json(self) {
  let json: Map[String, Json] = {}
  match self.start {
      Some(v) => json["start"] = v.to_json()
      _ => ()
    }
  match self.end {
      Some(v) => json["end"] = v.to_json()
      _ => ()
    }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for DescriptorProto_ExtensionRange with from_json(json: Json, path: @json.JsonPath) -> DescriptorProto_ExtensionRange raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for DescriptorProto_ExtensionRange"))
  }
  let message = DescriptorProto_ExtensionRange::default()
  for key, value in obj {
    match (key, value) {
      ("start", value) => message.start = Some(@json.from_json(value, path~))
      ("end", value) => message.end = Some(@json.from_json(value, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] DescriptorProto_ExtensionRange::async_read(reader : R) -> DescriptorProto_ExtensionRange raise {
  let reader = @protobuf.LimitedReader::new(reader)
  DescriptorProto_ExtensionRange::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] DescriptorProto_ExtensionRange::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> DescriptorProto_ExtensionRange raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = DescriptorProto_ExtensionRange::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.start = reader |> @protobuf.async_read_int32() |> Some
      (2, _) => msg.end = reader |> @protobuf.async_read_int32() |> Some
      (3, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      ExtensionRangeOptions::default()
    } else {
      ExtensionRangeOptions::async_read_with_limit(reader, limit=len)
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
pub async fn[W: @protobuf.AsyncWriter] DescriptorProto_ExtensionRange::async_write(self:Self, writer : W) -> Unit raise {
  match self.start {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.end {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
}
pub(all) struct DescriptorProto_ReservedRange {
  mut start : Int?
  mut end : Int?
} derive(Eq, Show)
pub impl @protobuf.Sized for DescriptorProto_ReservedRange with size_of(self) {
  let mut size = 0U
  match self.start {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.end {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for DescriptorProto_ReservedRange with default() -> DescriptorProto_ReservedRange {
  DescriptorProto_ReservedRange::{
    start : None,
    end : None,
  }
}
pub  fn[R: @protobuf.Reader] DescriptorProto_ReservedRange::read(reader : R) -> DescriptorProto_ReservedRange raise {
  let reader = @protobuf.LimitedReader::new(reader)
  DescriptorProto_ReservedRange::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] DescriptorProto_ReservedRange::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> DescriptorProto_ReservedRange raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = DescriptorProto_ReservedRange::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.start = reader |> @protobuf.read_int32() |> Some
      (2, _) => msg.end = reader |> @protobuf.read_int32() |> Some
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
pub  fn[W: @protobuf.Writer] DescriptorProto_ReservedRange::write(self:Self, writer : W) -> Unit raise {
  match self.start {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.end {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
}
pub impl ToJson for DescriptorProto_ReservedRange with to_json(self) {
  let json: Map[String, Json] = {}
  match self.start {
      Some(v) => json["start"] = v.to_json()
      _ => ()
    }
  match self.end {
      Some(v) => json["end"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for DescriptorProto_ReservedRange with from_json(json: Json, path: @json.JsonPath) -> DescriptorProto_ReservedRange raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for DescriptorProto_ReservedRange"))
  }
  let message = DescriptorProto_ReservedRange::default()
  for key, value in obj {
    match (key, value) {
      ("start", value) => message.start = Some(@json.from_json(value, path~))
      ("end", value) => message.end = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] DescriptorProto_ReservedRange::async_read(reader : R) -> DescriptorProto_ReservedRange raise {
  let reader = @protobuf.LimitedReader::new(reader)
  DescriptorProto_ReservedRange::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] DescriptorProto_ReservedRange::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> DescriptorProto_ReservedRange raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = DescriptorProto_ReservedRange::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.start = reader |> @protobuf.async_read_int32() |> Some
      (2, _) => msg.end = reader |> @protobuf.async_read_int32() |> Some
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
pub async fn[W: @protobuf.AsyncWriter] DescriptorProto_ReservedRange::async_write(self:Self, writer : W) -> Unit raise {
  match self.start {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.end {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
}
pub(all) struct DescriptorProto {
  mut name : String?
  mut field : Array[FieldDescriptorProto]
  mut extension : Array[FieldDescriptorProto]
  mut nested_type : Array[DescriptorProto]
  mut enum_type : Array[EnumDescriptorProto]
  mut extension_range : Array[DescriptorProto_ExtensionRange]
  mut oneof_decl : Array[OneofDescriptorProto]
  mut options : MessageOptions?
  mut reserved_range : Array[DescriptorProto_ReservedRange]
  mut reserved_name : Array[String]
  mut visibility : SymbolVisibility?
} derive(Eq, Show)
pub impl @protobuf.Sized for DescriptorProto with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.field.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.extension.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.nested_type.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.enum_type.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.extension_range.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.oneof_decl.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.reserved_range.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.reserved_name.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.visibility {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for DescriptorProto with default() -> DescriptorProto {
  DescriptorProto::{
    name : None,
    field : [],
    extension : [],
    nested_type : [],
    enum_type : [],
    extension_range : [],
    oneof_decl : [],
    options : None,
    reserved_range : [],
    reserved_name : [],
    visibility : None,
  }
}
pub  fn[R: @protobuf.Reader] DescriptorProto::read(reader : R) -> DescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  DescriptorProto::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] DescriptorProto::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> DescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = DescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.field.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FieldDescriptorProto::default()
    } else {
      FieldDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (6, _) => msg.extension.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FieldDescriptorProto::default()
    } else {
      FieldDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (3, _) => msg.nested_type.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      DescriptorProto::default()
    } else {
      DescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (4, _) => msg.enum_type.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      EnumDescriptorProto::default()
    } else {
      EnumDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.extension_range.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      DescriptorProto_ExtensionRange::default()
    } else {
      DescriptorProto_ExtensionRange::read_with_limit(reader, limit=len)
    }
  })
      (8, _) => msg.oneof_decl.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      OneofDescriptorProto::default()
    } else {
      OneofDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (7, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      MessageOptions::default()
    } else {
      MessageOptions::read_with_limit(reader, limit=len)
    }
  } |> Some
      (9, _) => msg.reserved_range.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      DescriptorProto_ReservedRange::default()
    } else {
      DescriptorProto_ReservedRange::read_with_limit(reader, limit=len)
    }
  })
      (10, _) => msg.reserved_name.push(reader |> @protobuf.read_string())
      (11, _) => msg.visibility = reader |> @protobuf.read_enum() |> SymbolVisibility::from_enum |> Some
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
pub  fn[W: @protobuf.Writer] DescriptorProto::write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  for item in self.field {
    writer |> @protobuf.write_varint(18UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.extension {
    writer |> @protobuf.write_varint(50UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.nested_type {
    writer |> @protobuf.write_varint(26UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.enum_type {
    writer |> @protobuf.write_varint(34UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.extension_range {
    writer |> @protobuf.write_varint(42UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.oneof_decl {
    writer |> @protobuf.write_varint(66UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(58UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.reserved_range {
    writer |> @protobuf.write_varint(74UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.reserved_name {
    writer |> @protobuf.write_varint(82UL)
    writer |> @protobuf.write_string(item)

  }
  match self.visibility {
    Some(v) => {
      writer |> @protobuf.write_varint(88UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
}
pub impl ToJson for DescriptorProto with to_json(self) {
  let json: Map[String, Json] = {}
  match self.name {
      Some(v) => json["name"] = v.to_json()
      _ => ()
    }
  if self.field != Default::default() {
  json["field"] = self.field.to_json()
  }
  if self.extension != Default::default() {
  json["extension"] = self.extension.to_json()
  }
  if self.nested_type != Default::default() {
  json["nestedType"] = self.nested_type.to_json()
  }
  if self.enum_type != Default::default() {
  json["enumType"] = self.enum_type.to_json()
  }
  if self.extension_range != Default::default() {
  json["extensionRange"] = self.extension_range.to_json()
  }
  if self.oneof_decl != Default::default() {
  json["oneofDecl"] = self.oneof_decl.to_json()
  }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  if self.reserved_range != Default::default() {
  json["reservedRange"] = self.reserved_range.to_json()
  }
  if self.reserved_name != Default::default() {
  json["reservedName"] = self.reserved_name.to_json()
  }
  match self.visibility {
      Some(v) => json["visibility"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for DescriptorProto with from_json(json: Json, path: @json.JsonPath) -> DescriptorProto raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for DescriptorProto"))
  }
  let message = DescriptorProto::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("field", Array(value)) => message.field = value.map(v => 
@json.from_json(v, path~))
      ("extension", Array(value)) => message.extension = value.map(v => 
@json.from_json(v, path~))
      ("nestedType", Array(value)) => message.nested_type = value.map(v => 
@json.from_json(v, path~))
      ("enumType", Array(value)) => message.enum_type = value.map(v => 
@json.from_json(v, path~))
      ("extensionRange", Array(value)) => message.extension_range = value.map(v => 
@json.from_json(v, path~))
      ("oneofDecl", Array(value)) => message.oneof_decl = value.map(v => 
@json.from_json(v, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      ("reservedRange", Array(value)) => message.reserved_range = value.map(v => 
@json.from_json(v, path~))
      ("reservedName", Array(value)) => message.reserved_name = value.map(v => 
@json.from_json(v, path~))
      ("visibility", value) => message.visibility = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] DescriptorProto::async_read(reader : R) -> DescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  DescriptorProto::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] DescriptorProto::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> DescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = DescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.field.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FieldDescriptorProto::default()
    } else {
      FieldDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (6, _) => msg.extension.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FieldDescriptorProto::default()
    } else {
      FieldDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (3, _) => msg.nested_type.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      DescriptorProto::default()
    } else {
      DescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (4, _) => msg.enum_type.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      EnumDescriptorProto::default()
    } else {
      EnumDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.extension_range.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      DescriptorProto_ExtensionRange::default()
    } else {
      DescriptorProto_ExtensionRange::async_read_with_limit(reader, limit=len)
    }
  })
      (8, _) => msg.oneof_decl.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      OneofDescriptorProto::default()
    } else {
      OneofDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (7, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      MessageOptions::default()
    } else {
      MessageOptions::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (9, _) => msg.reserved_range.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      DescriptorProto_ReservedRange::default()
    } else {
      DescriptorProto_ReservedRange::async_read_with_limit(reader, limit=len)
    }
  })
      (10, _) => msg.reserved_name.push(reader |> @protobuf.async_read_string())
      (11, _) => msg.visibility = reader |> @protobuf.async_read_enum() |> SymbolVisibility::from_enum |> Some
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
pub async fn[W: @protobuf.AsyncWriter] DescriptorProto::async_write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  for item in self.field {
    writer |> @protobuf.async_write_varint(18UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.extension {
    writer |> @protobuf.async_write_varint(50UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.nested_type {
    writer |> @protobuf.async_write_varint(26UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.enum_type {
    writer |> @protobuf.async_write_varint(34UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.extension_range {
    writer |> @protobuf.async_write_varint(42UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.oneof_decl {
    writer |> @protobuf.async_write_varint(66UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(58UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.reserved_range {
    writer |> @protobuf.async_write_varint(74UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.reserved_name {
    writer |> @protobuf.async_write_varint(82UL)
    writer |> @protobuf.async_write_string(item)

  }
  match self.visibility {
    Some(v) => {
      writer |> @protobuf.async_write_varint(88UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
}
pub(all) enum ExtensionRangeOptions_VerificationState {
  DECLARATION
  UNVERIFIED
} derive(Eq, Show)
pub fn ExtensionRangeOptions_VerificationState::to_enum(self : ExtensionRangeOptions_VerificationState) -> @protobuf.Enum {
  match self {
    ExtensionRangeOptions_VerificationState::DECLARATION => 0
    ExtensionRangeOptions_VerificationState::UNVERIFIED => 1
  }
}
pub fn ExtensionRangeOptions_VerificationState::from_enum(i : @protobuf.Enum) -> ExtensionRangeOptions_VerificationState {
  match i.inner() {
    0 => ExtensionRangeOptions_VerificationState::DECLARATION
    1 => ExtensionRangeOptions_VerificationState::UNVERIFIED
    _ => Default::default()
  }
}
pub impl Default for ExtensionRangeOptions_VerificationState with default() -> ExtensionRangeOptions_VerificationState {
  ExtensionRangeOptions_VerificationState::DECLARATION
}
pub impl @protobuf.Sized for ExtensionRangeOptions_VerificationState with size_of(self : ExtensionRangeOptions_VerificationState) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for ExtensionRangeOptions_VerificationState with from_json(json: Json, path: @json.JsonPath) -> ExtensionRangeOptions_VerificationState raise {
  match json {
    String("DECLARATION") => ExtensionRangeOptions_VerificationState::DECLARATION
    String("UNVERIFIED") => ExtensionRangeOptions_VerificationState::UNVERIFIED
    Number(0, ..) => ExtensionRangeOptions_VerificationState::DECLARATION
    Number(1, ..) => ExtensionRangeOptions_VerificationState::UNVERIFIED
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for ExtensionRangeOptions_VerificationState with to_json(self : ExtensionRangeOptions_VerificationState) -> Json {
  match self {
    ExtensionRangeOptions_VerificationState::DECLARATION => "DECLARATION"
    ExtensionRangeOptions_VerificationState::UNVERIFIED => "UNVERIFIED"
  }
}
pub(all) struct ExtensionRangeOptions_Declaration {
  mut number : Int?
  mut full_name : String?
  mut type_ : String?
  mut reserved : Bool?
  mut repeated : Bool?
} derive(Eq, Show)
pub impl @protobuf.Sized for ExtensionRangeOptions_Declaration with size_of(self) {
  let mut size = 0U
  match self.number {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.full_name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.type_ {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.reserved {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.repeated {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for ExtensionRangeOptions_Declaration with default() -> ExtensionRangeOptions_Declaration {
  ExtensionRangeOptions_Declaration::{
    number : None,
    full_name : None,
    type_ : None,
    reserved : None,
    repeated : None,
  }
}
pub  fn[R: @protobuf.Reader] ExtensionRangeOptions_Declaration::read(reader : R) -> ExtensionRangeOptions_Declaration raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ExtensionRangeOptions_Declaration::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] ExtensionRangeOptions_Declaration::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ExtensionRangeOptions_Declaration raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ExtensionRangeOptions_Declaration::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.number = reader |> @protobuf.read_int32() |> Some
      (2, _) => msg.full_name = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.type_ = reader |> @protobuf.read_string() |> Some
      (5, _) => msg.reserved = reader |> @protobuf.read_bool() |> Some
      (6, _) => msg.repeated = reader |> @protobuf.read_bool() |> Some
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
pub  fn[W: @protobuf.Writer] ExtensionRangeOptions_Declaration::write(self:Self, writer : W) -> Unit raise {
  match self.number {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.full_name {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.type_ {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.reserved {
    Some(v) => {
      writer |> @protobuf.write_varint(40UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.repeated {
    Some(v) => {
      writer |> @protobuf.write_varint(48UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
}
pub impl ToJson for ExtensionRangeOptions_Declaration with to_json(self) {
  let json: Map[String, Json] = {}
  match self.number {
      Some(v) => json["number"] = v.to_json()
      _ => ()
    }
  match self.full_name {
      Some(v) => json["fullName"] = v.to_json()
      _ => ()
    }
  match self.type_ {
      Some(v) => json["type"] = v.to_json()
      _ => ()
    }
  match self.reserved {
      Some(v) => json["reserved"] = v.to_json()
      _ => ()
    }
  match self.repeated {
      Some(v) => json["repeated"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for ExtensionRangeOptions_Declaration with from_json(json: Json, path: @json.JsonPath) -> ExtensionRangeOptions_Declaration raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ExtensionRangeOptions_Declaration"))
  }
  let message = ExtensionRangeOptions_Declaration::default()
  for key, value in obj {
    match (key, value) {
      ("number", value) => message.number = Some(@json.from_json(value, path~))
      ("fullName", value) => message.full_name = Some(@json.from_json(value, path~))
      ("type", value) => message.type_ = Some(@json.from_json(value, path~))
      ("reserved", value) => message.reserved = Some(@json.from_json(value, path~))
      ("repeated", value) => message.repeated = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] ExtensionRangeOptions_Declaration::async_read(reader : R) -> ExtensionRangeOptions_Declaration raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ExtensionRangeOptions_Declaration::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] ExtensionRangeOptions_Declaration::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ExtensionRangeOptions_Declaration raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ExtensionRangeOptions_Declaration::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.number = reader |> @protobuf.async_read_int32() |> Some
      (2, _) => msg.full_name = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.type_ = reader |> @protobuf.async_read_string() |> Some
      (5, _) => msg.reserved = reader |> @protobuf.async_read_bool() |> Some
      (6, _) => msg.repeated = reader |> @protobuf.async_read_bool() |> Some
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
pub async fn[W: @protobuf.AsyncWriter] ExtensionRangeOptions_Declaration::async_write(self:Self, writer : W) -> Unit raise {
  match self.number {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.full_name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.type_ {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.reserved {
    Some(v) => {
      writer |> @protobuf.async_write_varint(40UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.repeated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(48UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
}
pub(all) struct ExtensionRangeOptions {
  mut uninterpreted_option : Array[UninterpretedOption]
  mut declaration : Array[ExtensionRangeOptions_Declaration]
  mut features : FeatureSet?
  mut verification : ExtensionRangeOptions_VerificationState?
} derive(Eq, Show)
pub impl @protobuf.Sized for ExtensionRangeOptions with size_of(self) {
  let mut size = 0U
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.declaration.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.features {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.verification {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for ExtensionRangeOptions with default() -> ExtensionRangeOptions {
  ExtensionRangeOptions::{
    uninterpreted_option : [],
    declaration : [],
    features : None,
    verification : Some(ExtensionRangeOptions_VerificationState::UNVERIFIED),
  }
}
pub  fn[R: @protobuf.Reader] ExtensionRangeOptions::read(reader : R) -> ExtensionRangeOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ExtensionRangeOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] ExtensionRangeOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ExtensionRangeOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ExtensionRangeOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
      (2, _) => msg.declaration.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      ExtensionRangeOptions_Declaration::default()
    } else {
      ExtensionRangeOptions_Declaration::read_with_limit(reader, limit=len)
    }
  })
      (50, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.verification = reader |> @protobuf.read_enum() |> ExtensionRangeOptions_VerificationState::from_enum |> Some
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
pub  fn[W: @protobuf.Writer] ExtensionRangeOptions::write(self:Self, writer : W) -> Unit raise {
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.declaration {
    writer |> @protobuf.write_varint(18UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(402UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.verification {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
}
pub impl ToJson for ExtensionRangeOptions with to_json(self) {
  let json: Map[String, Json] = {}
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  if self.declaration != Default::default() {
  json["declaration"] = self.declaration.to_json()
  }
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  match self.verification {
      Some(v) if v != ExtensionRangeOptions_VerificationState::UNVERIFIED => json["verification"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for ExtensionRangeOptions with from_json(json: Json, path: @json.JsonPath) -> ExtensionRangeOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ExtensionRangeOptions"))
  }
  let message = ExtensionRangeOptions::default()
  for key, value in obj {
    match (key, value) {
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      ("declaration", Array(value)) => message.declaration = value.map(v => 
@json.from_json(v, path~))
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("verification", value) => message.verification = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] ExtensionRangeOptions::async_read(reader : R) -> ExtensionRangeOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ExtensionRangeOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] ExtensionRangeOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ExtensionRangeOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ExtensionRangeOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
      (2, _) => msg.declaration.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      ExtensionRangeOptions_Declaration::default()
    } else {
      ExtensionRangeOptions_Declaration::async_read_with_limit(reader, limit=len)
    }
  })
      (50, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.verification = reader |> @protobuf.async_read_enum() |> ExtensionRangeOptions_VerificationState::from_enum |> Some
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
pub async fn[W: @protobuf.AsyncWriter] ExtensionRangeOptions::async_write(self:Self, writer : W) -> Unit raise {
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.declaration {
    writer |> @protobuf.async_write_varint(18UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(402UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.verification {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
}
pub(all) enum FieldDescriptorProto_Type {
  TYPE_DOUBLE
  TYPE_FLOAT
  TYPE_INT64
  TYPE_UINT64
  TYPE_INT32
  TYPE_FIXED64
  TYPE_FIXED32
  TYPE_BOOL
  TYPE_STRING
  TYPE_GROUP
  TYPE_MESSAGE
  TYPE_BYTES
  TYPE_UINT32
  TYPE_ENUM
  TYPE_SFIXED32
  TYPE_SFIXED64
  TYPE_SINT32
  TYPE_SINT64
} derive(Eq, Show)
pub fn FieldDescriptorProto_Type::to_enum(self : FieldDescriptorProto_Type) -> @protobuf.Enum {
  match self {
    FieldDescriptorProto_Type::TYPE_DOUBLE => 1
    FieldDescriptorProto_Type::TYPE_FLOAT => 2
    FieldDescriptorProto_Type::TYPE_INT64 => 3
    FieldDescriptorProto_Type::TYPE_UINT64 => 4
    FieldDescriptorProto_Type::TYPE_INT32 => 5
    FieldDescriptorProto_Type::TYPE_FIXED64 => 6
    FieldDescriptorProto_Type::TYPE_FIXED32 => 7
    FieldDescriptorProto_Type::TYPE_BOOL => 8
    FieldDescriptorProto_Type::TYPE_STRING => 9
    FieldDescriptorProto_Type::TYPE_GROUP => 10
    FieldDescriptorProto_Type::TYPE_MESSAGE => 11
    FieldDescriptorProto_Type::TYPE_BYTES => 12
    FieldDescriptorProto_Type::TYPE_UINT32 => 13
    FieldDescriptorProto_Type::TYPE_ENUM => 14
    FieldDescriptorProto_Type::TYPE_SFIXED32 => 15
    FieldDescriptorProto_Type::TYPE_SFIXED64 => 16
    FieldDescriptorProto_Type::TYPE_SINT32 => 17
    FieldDescriptorProto_Type::TYPE_SINT64 => 18
  }
}
pub fn FieldDescriptorProto_Type::from_enum(i : @protobuf.Enum) -> FieldDescriptorProto_Type {
  match i.inner() {
    1 => FieldDescriptorProto_Type::TYPE_DOUBLE
    2 => FieldDescriptorProto_Type::TYPE_FLOAT
    3 => FieldDescriptorProto_Type::TYPE_INT64
    4 => FieldDescriptorProto_Type::TYPE_UINT64
    5 => FieldDescriptorProto_Type::TYPE_INT32
    6 => FieldDescriptorProto_Type::TYPE_FIXED64
    7 => FieldDescriptorProto_Type::TYPE_FIXED32
    8 => FieldDescriptorProto_Type::TYPE_BOOL
    9 => FieldDescriptorProto_Type::TYPE_STRING
    10 => FieldDescriptorProto_Type::TYPE_GROUP
    11 => FieldDescriptorProto_Type::TYPE_MESSAGE
    12 => FieldDescriptorProto_Type::TYPE_BYTES
    13 => FieldDescriptorProto_Type::TYPE_UINT32
    14 => FieldDescriptorProto_Type::TYPE_ENUM
    15 => FieldDescriptorProto_Type::TYPE_SFIXED32
    16 => FieldDescriptorProto_Type::TYPE_SFIXED64
    17 => FieldDescriptorProto_Type::TYPE_SINT32
    18 => FieldDescriptorProto_Type::TYPE_SINT64
    _ => Default::default()
  }
}
pub impl Default for FieldDescriptorProto_Type with default() -> FieldDescriptorProto_Type {
  FieldDescriptorProto_Type::TYPE_DOUBLE
}
pub impl @protobuf.Sized for FieldDescriptorProto_Type with size_of(self : FieldDescriptorProto_Type) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FieldDescriptorProto_Type with from_json(json: Json, path: @json.JsonPath) -> FieldDescriptorProto_Type raise {
  match json {
    String("TYPE_DOUBLE") => FieldDescriptorProto_Type::TYPE_DOUBLE
    String("TYPE_FLOAT") => FieldDescriptorProto_Type::TYPE_FLOAT
    String("TYPE_INT64") => FieldDescriptorProto_Type::TYPE_INT64
    String("TYPE_UINT64") => FieldDescriptorProto_Type::TYPE_UINT64
    String("TYPE_INT32") => FieldDescriptorProto_Type::TYPE_INT32
    String("TYPE_FIXED64") => FieldDescriptorProto_Type::TYPE_FIXED64
    String("TYPE_FIXED32") => FieldDescriptorProto_Type::TYPE_FIXED32
    String("TYPE_BOOL") => FieldDescriptorProto_Type::TYPE_BOOL
    String("TYPE_STRING") => FieldDescriptorProto_Type::TYPE_STRING
    String("TYPE_GROUP") => FieldDescriptorProto_Type::TYPE_GROUP
    String("TYPE_MESSAGE") => FieldDescriptorProto_Type::TYPE_MESSAGE
    String("TYPE_BYTES") => FieldDescriptorProto_Type::TYPE_BYTES
    String("TYPE_UINT32") => FieldDescriptorProto_Type::TYPE_UINT32
    String("TYPE_ENUM") => FieldDescriptorProto_Type::TYPE_ENUM
    String("TYPE_SFIXED32") => FieldDescriptorProto_Type::TYPE_SFIXED32
    String("TYPE_SFIXED64") => FieldDescriptorProto_Type::TYPE_SFIXED64
    String("TYPE_SINT32") => FieldDescriptorProto_Type::TYPE_SINT32
    String("TYPE_SINT64") => FieldDescriptorProto_Type::TYPE_SINT64
    Number(1, ..) => FieldDescriptorProto_Type::TYPE_DOUBLE
    Number(2, ..) => FieldDescriptorProto_Type::TYPE_FLOAT
    Number(3, ..) => FieldDescriptorProto_Type::TYPE_INT64
    Number(4, ..) => FieldDescriptorProto_Type::TYPE_UINT64
    Number(5, ..) => FieldDescriptorProto_Type::TYPE_INT32
    Number(6, ..) => FieldDescriptorProto_Type::TYPE_FIXED64
    Number(7, ..) => FieldDescriptorProto_Type::TYPE_FIXED32
    Number(8, ..) => FieldDescriptorProto_Type::TYPE_BOOL
    Number(9, ..) => FieldDescriptorProto_Type::TYPE_STRING
    Number(10, ..) => FieldDescriptorProto_Type::TYPE_GROUP
    Number(11, ..) => FieldDescriptorProto_Type::TYPE_MESSAGE
    Number(12, ..) => FieldDescriptorProto_Type::TYPE_BYTES
    Number(13, ..) => FieldDescriptorProto_Type::TYPE_UINT32
    Number(14, ..) => FieldDescriptorProto_Type::TYPE_ENUM
    Number(15, ..) => FieldDescriptorProto_Type::TYPE_SFIXED32
    Number(16, ..) => FieldDescriptorProto_Type::TYPE_SFIXED64
    Number(17, ..) => FieldDescriptorProto_Type::TYPE_SINT32
    Number(18, ..) => FieldDescriptorProto_Type::TYPE_SINT64
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FieldDescriptorProto_Type with to_json(self : FieldDescriptorProto_Type) -> Json {
  match self {
    FieldDescriptorProto_Type::TYPE_DOUBLE => "TYPE_DOUBLE"
    FieldDescriptorProto_Type::TYPE_FLOAT => "TYPE_FLOAT"
    FieldDescriptorProto_Type::TYPE_INT64 => "TYPE_INT64"
    FieldDescriptorProto_Type::TYPE_UINT64 => "TYPE_UINT64"
    FieldDescriptorProto_Type::TYPE_INT32 => "TYPE_INT32"
    FieldDescriptorProto_Type::TYPE_FIXED64 => "TYPE_FIXED64"
    FieldDescriptorProto_Type::TYPE_FIXED32 => "TYPE_FIXED32"
    FieldDescriptorProto_Type::TYPE_BOOL => "TYPE_BOOL"
    FieldDescriptorProto_Type::TYPE_STRING => "TYPE_STRING"
    FieldDescriptorProto_Type::TYPE_GROUP => "TYPE_GROUP"
    FieldDescriptorProto_Type::TYPE_MESSAGE => "TYPE_MESSAGE"
    FieldDescriptorProto_Type::TYPE_BYTES => "TYPE_BYTES"
    FieldDescriptorProto_Type::TYPE_UINT32 => "TYPE_UINT32"
    FieldDescriptorProto_Type::TYPE_ENUM => "TYPE_ENUM"
    FieldDescriptorProto_Type::TYPE_SFIXED32 => "TYPE_SFIXED32"
    FieldDescriptorProto_Type::TYPE_SFIXED64 => "TYPE_SFIXED64"
    FieldDescriptorProto_Type::TYPE_SINT32 => "TYPE_SINT32"
    FieldDescriptorProto_Type::TYPE_SINT64 => "TYPE_SINT64"
  }
}
pub(all) enum FieldDescriptorProto_Label {
  LABEL_OPTIONAL
  LABEL_REPEATED
  LABEL_REQUIRED
} derive(Eq, Show)
pub fn FieldDescriptorProto_Label::to_enum(self : FieldDescriptorProto_Label) -> @protobuf.Enum {
  match self {
    FieldDescriptorProto_Label::LABEL_OPTIONAL => 1
    FieldDescriptorProto_Label::LABEL_REPEATED => 3
    FieldDescriptorProto_Label::LABEL_REQUIRED => 2
  }
}
pub fn FieldDescriptorProto_Label::from_enum(i : @protobuf.Enum) -> FieldDescriptorProto_Label {
  match i.inner() {
    1 => FieldDescriptorProto_Label::LABEL_OPTIONAL
    3 => FieldDescriptorProto_Label::LABEL_REPEATED
    2 => FieldDescriptorProto_Label::LABEL_REQUIRED
    _ => Default::default()
  }
}
pub impl Default for FieldDescriptorProto_Label with default() -> FieldDescriptorProto_Label {
  FieldDescriptorProto_Label::LABEL_OPTIONAL
}
pub impl @protobuf.Sized for FieldDescriptorProto_Label with size_of(self : FieldDescriptorProto_Label) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FieldDescriptorProto_Label with from_json(json: Json, path: @json.JsonPath) -> FieldDescriptorProto_Label raise {
  match json {
    String("LABEL_OPTIONAL") => FieldDescriptorProto_Label::LABEL_OPTIONAL
    String("LABEL_REPEATED") => FieldDescriptorProto_Label::LABEL_REPEATED
    String("LABEL_REQUIRED") => FieldDescriptorProto_Label::LABEL_REQUIRED
    Number(1, ..) => FieldDescriptorProto_Label::LABEL_OPTIONAL
    Number(3, ..) => FieldDescriptorProto_Label::LABEL_REPEATED
    Number(2, ..) => FieldDescriptorProto_Label::LABEL_REQUIRED
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FieldDescriptorProto_Label with to_json(self : FieldDescriptorProto_Label) -> Json {
  match self {
    FieldDescriptorProto_Label::LABEL_OPTIONAL => "LABEL_OPTIONAL"
    FieldDescriptorProto_Label::LABEL_REPEATED => "LABEL_REPEATED"
    FieldDescriptorProto_Label::LABEL_REQUIRED => "LABEL_REQUIRED"
  }
}
pub(all) struct FieldDescriptorProto {
  mut name : String?
  mut number : Int?
  mut label : FieldDescriptorProto_Label?
  mut type_ : FieldDescriptorProto_Type?
  mut type_name : String?
  mut extendee : String?
  mut default_value : String?
  mut oneof_index : Int?
  mut json_name : String?
  mut options : FieldOptions?
  mut proto3_optional : Bool?
} derive(Eq, Show)
pub impl @protobuf.Sized for FieldDescriptorProto with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.number {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.label {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.type_ {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.type_name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.extendee {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.default_value {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.oneof_index {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.json_name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.proto3_optional {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for FieldDescriptorProto with default() -> FieldDescriptorProto {
  FieldDescriptorProto::{
    name : None,
    number : None,
    label : None,
    type_ : None,
    type_name : None,
    extendee : None,
    default_value : None,
    oneof_index : None,
    json_name : None,
    options : None,
    proto3_optional : None,
  }
}
pub  fn[R: @protobuf.Reader] FieldDescriptorProto::read(reader : R) -> FieldDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FieldDescriptorProto::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FieldDescriptorProto::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FieldDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FieldDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.number = reader |> @protobuf.read_int32() |> Some
      (4, _) => msg.label = reader |> @protobuf.read_enum() |> FieldDescriptorProto_Label::from_enum |> Some
      (5, _) => msg.type_ = reader |> @protobuf.read_enum() |> FieldDescriptorProto_Type::from_enum |> Some
      (6, _) => msg.type_name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.extendee = reader |> @protobuf.read_string() |> Some
      (7, _) => msg.default_value = reader |> @protobuf.read_string() |> Some
      (9, _) => msg.oneof_index = reader |> @protobuf.read_int32() |> Some
      (10, _) => msg.json_name = reader |> @protobuf.read_string() |> Some
      (8, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FieldOptions::default()
    } else {
      FieldOptions::read_with_limit(reader, limit=len)
    }
  } |> Some
      (17, _) => msg.proto3_optional = reader |> @protobuf.read_bool() |> Some
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
pub  fn[W: @protobuf.Writer] FieldDescriptorProto::write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.number {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.label {
    Some(v) => {
      writer |> @protobuf.write_varint(32UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.type_ {
    Some(v) => {
      writer |> @protobuf.write_varint(40UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.type_name {
    Some(v) => {
      writer |> @protobuf.write_varint(50UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.extendee {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.default_value {
    Some(v) => {
      writer |> @protobuf.write_varint(58UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.oneof_index {
    Some(v) => {
      writer |> @protobuf.write_varint(72UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.json_name {
    Some(v) => {
      writer |> @protobuf.write_varint(82UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(66UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.proto3_optional {
    Some(v) => {
      writer |> @protobuf.write_varint(136UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
}
pub impl ToJson for FieldDescriptorProto with to_json(self) {
  let json: Map[String, Json] = {}
  match self.name {
      Some(v) => json["name"] = v.to_json()
      _ => ()
    }
  match self.number {
      Some(v) => json["number"] = v.to_json()
      _ => ()
    }
  match self.label {
      Some(v) => json["label"] = v.to_json()
      _ => ()
    }
  match self.type_ {
      Some(v) => json["type"] = v.to_json()
      _ => ()
    }
  match self.type_name {
      Some(v) => json["typeName"] = v.to_json()
      _ => ()
    }
  match self.extendee {
      Some(v) => json["extendee"] = v.to_json()
      _ => ()
    }
  match self.default_value {
      Some(v) => json["defaultValue"] = v.to_json()
      _ => ()
    }
  match self.oneof_index {
      Some(v) => json["oneofIndex"] = v.to_json()
      _ => ()
    }
  match self.json_name {
      Some(v) => json["jsonName"] = v.to_json()
      _ => ()
    }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  match self.proto3_optional {
      Some(v) => json["proto3Optional"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for FieldDescriptorProto with from_json(json: Json, path: @json.JsonPath) -> FieldDescriptorProto raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FieldDescriptorProto"))
  }
  let message = FieldDescriptorProto::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("number", value) => message.number = Some(@json.from_json(value, path~))
      ("label", value) => message.label = Some(@json.from_json(value, path~))
      ("type", value) => message.type_ = Some(@json.from_json(value, path~))
      ("typeName", value) => message.type_name = Some(@json.from_json(value, path~))
      ("extendee", value) => message.extendee = Some(@json.from_json(value, path~))
      ("defaultValue", value) => message.default_value = Some(@json.from_json(value, path~))
      ("oneofIndex", value) => message.oneof_index = Some(@json.from_json(value, path~))
      ("jsonName", value) => message.json_name = Some(@json.from_json(value, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      ("proto3Optional", value) => message.proto3_optional = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FieldDescriptorProto::async_read(reader : R) -> FieldDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FieldDescriptorProto::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FieldDescriptorProto::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FieldDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FieldDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.number = reader |> @protobuf.async_read_int32() |> Some
      (4, _) => msg.label = reader |> @protobuf.async_read_enum() |> FieldDescriptorProto_Label::from_enum |> Some
      (5, _) => msg.type_ = reader |> @protobuf.async_read_enum() |> FieldDescriptorProto_Type::from_enum |> Some
      (6, _) => msg.type_name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.extendee = reader |> @protobuf.async_read_string() |> Some
      (7, _) => msg.default_value = reader |> @protobuf.async_read_string() |> Some
      (9, _) => msg.oneof_index = reader |> @protobuf.async_read_int32() |> Some
      (10, _) => msg.json_name = reader |> @protobuf.async_read_string() |> Some
      (8, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FieldOptions::default()
    } else {
      FieldOptions::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (17, _) => msg.proto3_optional = reader |> @protobuf.async_read_bool() |> Some
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
pub async fn[W: @protobuf.AsyncWriter] FieldDescriptorProto::async_write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.number {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.label {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.type_ {
    Some(v) => {
      writer |> @protobuf.async_write_varint(40UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.type_name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(50UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.extendee {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.default_value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(58UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.oneof_index {
    Some(v) => {
      writer |> @protobuf.async_write_varint(72UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.json_name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(82UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(66UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.proto3_optional {
    Some(v) => {
      writer |> @protobuf.async_write_varint(136UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
}
pub(all) struct OneofDescriptorProto {
  mut name : String?
  mut options : OneofOptions?
} derive(Eq, Show)
pub impl @protobuf.Sized for OneofDescriptorProto with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for OneofDescriptorProto with default() -> OneofDescriptorProto {
  OneofDescriptorProto::{
    name : None,
    options : None,
  }
}
pub  fn[R: @protobuf.Reader] OneofDescriptorProto::read(reader : R) -> OneofDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  OneofDescriptorProto::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] OneofDescriptorProto::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> OneofDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = OneofDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      OneofOptions::default()
    } else {
      OneofOptions::read_with_limit(reader, limit=len)
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
pub  fn[W: @protobuf.Writer] OneofDescriptorProto::write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
}
pub impl ToJson for OneofDescriptorProto with to_json(self) {
  let json: Map[String, Json] = {}
  match self.name {
      Some(v) => json["name"] = v.to_json()
      _ => ()
    }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for OneofDescriptorProto with from_json(json: Json, path: @json.JsonPath) -> OneofDescriptorProto raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for OneofDescriptorProto"))
  }
  let message = OneofDescriptorProto::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] OneofDescriptorProto::async_read(reader : R) -> OneofDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  OneofDescriptorProto::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] OneofDescriptorProto::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> OneofDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = OneofDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      OneofOptions::default()
    } else {
      OneofOptions::async_read_with_limit(reader, limit=len)
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
pub async fn[W: @protobuf.AsyncWriter] OneofDescriptorProto::async_write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
}
pub(all) struct EnumDescriptorProto_EnumReservedRange {
  mut start : Int?
  mut end : Int?
} derive(Eq, Show)
pub impl @protobuf.Sized for EnumDescriptorProto_EnumReservedRange with size_of(self) {
  let mut size = 0U
  match self.start {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.end {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for EnumDescriptorProto_EnumReservedRange with default() -> EnumDescriptorProto_EnumReservedRange {
  EnumDescriptorProto_EnumReservedRange::{
    start : None,
    end : None,
  }
}
pub  fn[R: @protobuf.Reader] EnumDescriptorProto_EnumReservedRange::read(reader : R) -> EnumDescriptorProto_EnumReservedRange raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumDescriptorProto_EnumReservedRange::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] EnumDescriptorProto_EnumReservedRange::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumDescriptorProto_EnumReservedRange raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumDescriptorProto_EnumReservedRange::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.start = reader |> @protobuf.read_int32() |> Some
      (2, _) => msg.end = reader |> @protobuf.read_int32() |> Some
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
pub  fn[W: @protobuf.Writer] EnumDescriptorProto_EnumReservedRange::write(self:Self, writer : W) -> Unit raise {
  match self.start {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.end {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
}
pub impl ToJson for EnumDescriptorProto_EnumReservedRange with to_json(self) {
  let json: Map[String, Json] = {}
  match self.start {
      Some(v) => json["start"] = v.to_json()
      _ => ()
    }
  match self.end {
      Some(v) => json["end"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for EnumDescriptorProto_EnumReservedRange with from_json(json: Json, path: @json.JsonPath) -> EnumDescriptorProto_EnumReservedRange raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for EnumDescriptorProto_EnumReservedRange"))
  }
  let message = EnumDescriptorProto_EnumReservedRange::default()
  for key, value in obj {
    match (key, value) {
      ("start", value) => message.start = Some(@json.from_json(value, path~))
      ("end", value) => message.end = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] EnumDescriptorProto_EnumReservedRange::async_read(reader : R) -> EnumDescriptorProto_EnumReservedRange raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumDescriptorProto_EnumReservedRange::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] EnumDescriptorProto_EnumReservedRange::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumDescriptorProto_EnumReservedRange raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumDescriptorProto_EnumReservedRange::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.start = reader |> @protobuf.async_read_int32() |> Some
      (2, _) => msg.end = reader |> @protobuf.async_read_int32() |> Some
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
pub async fn[W: @protobuf.AsyncWriter] EnumDescriptorProto_EnumReservedRange::async_write(self:Self, writer : W) -> Unit raise {
  match self.start {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.end {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
}
pub(all) struct EnumDescriptorProto {
  mut name : String?
  mut value : Array[EnumValueDescriptorProto]
  mut options : EnumOptions?
  mut reserved_range : Array[EnumDescriptorProto_EnumReservedRange]
  mut reserved_name : Array[String]
  mut visibility : SymbolVisibility?
} derive(Eq, Show)
pub impl @protobuf.Sized for EnumDescriptorProto with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.value.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.reserved_range.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.reserved_name.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.visibility {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for EnumDescriptorProto with default() -> EnumDescriptorProto {
  EnumDescriptorProto::{
    name : None,
    value : [],
    options : None,
    reserved_range : [],
    reserved_name : [],
    visibility : None,
  }
}
pub  fn[R: @protobuf.Reader] EnumDescriptorProto::read(reader : R) -> EnumDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumDescriptorProto::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] EnumDescriptorProto::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.value.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      EnumValueDescriptorProto::default()
    } else {
      EnumValueDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (3, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      EnumOptions::default()
    } else {
      EnumOptions::read_with_limit(reader, limit=len)
    }
  } |> Some
      (4, _) => msg.reserved_range.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      EnumDescriptorProto_EnumReservedRange::default()
    } else {
      EnumDescriptorProto_EnumReservedRange::read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.reserved_name.push(reader |> @protobuf.read_string())
      (6, _) => msg.visibility = reader |> @protobuf.read_enum() |> SymbolVisibility::from_enum |> Some
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
pub  fn[W: @protobuf.Writer] EnumDescriptorProto::write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  for item in self.value {
    writer |> @protobuf.write_varint(18UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.reserved_range {
    writer |> @protobuf.write_varint(34UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.reserved_name {
    writer |> @protobuf.write_varint(42UL)
    writer |> @protobuf.write_string(item)

  }
  match self.visibility {
    Some(v) => {
      writer |> @protobuf.write_varint(48UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
}
pub impl ToJson for EnumDescriptorProto with to_json(self) {
  let json: Map[String, Json] = {}
  match self.name {
      Some(v) => json["name"] = v.to_json()
      _ => ()
    }
  if self.value != Default::default() {
  json["value"] = self.value.to_json()
  }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  if self.reserved_range != Default::default() {
  json["reservedRange"] = self.reserved_range.to_json()
  }
  if self.reserved_name != Default::default() {
  json["reservedName"] = self.reserved_name.to_json()
  }
  match self.visibility {
      Some(v) => json["visibility"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for EnumDescriptorProto with from_json(json: Json, path: @json.JsonPath) -> EnumDescriptorProto raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for EnumDescriptorProto"))
  }
  let message = EnumDescriptorProto::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("value", Array(value)) => message.value = value.map(v => 
@json.from_json(v, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      ("reservedRange", Array(value)) => message.reserved_range = value.map(v => 
@json.from_json(v, path~))
      ("reservedName", Array(value)) => message.reserved_name = value.map(v => 
@json.from_json(v, path~))
      ("visibility", value) => message.visibility = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] EnumDescriptorProto::async_read(reader : R) -> EnumDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumDescriptorProto::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] EnumDescriptorProto::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.value.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      EnumValueDescriptorProto::default()
    } else {
      EnumValueDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (3, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      EnumOptions::default()
    } else {
      EnumOptions::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (4, _) => msg.reserved_range.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      EnumDescriptorProto_EnumReservedRange::default()
    } else {
      EnumDescriptorProto_EnumReservedRange::async_read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.reserved_name.push(reader |> @protobuf.async_read_string())
      (6, _) => msg.visibility = reader |> @protobuf.async_read_enum() |> SymbolVisibility::from_enum |> Some
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
pub async fn[W: @protobuf.AsyncWriter] EnumDescriptorProto::async_write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  for item in self.value {
    writer |> @protobuf.async_write_varint(18UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.reserved_range {
    writer |> @protobuf.async_write_varint(34UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.reserved_name {
    writer |> @protobuf.async_write_varint(42UL)
    writer |> @protobuf.async_write_string(item)

  }
  match self.visibility {
    Some(v) => {
      writer |> @protobuf.async_write_varint(48UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
}
pub(all) struct EnumValueDescriptorProto {
  mut name : String?
  mut number : Int?
  mut options : EnumValueOptions?
} derive(Eq, Show)
pub impl @protobuf.Sized for EnumValueDescriptorProto with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.number {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for EnumValueDescriptorProto with default() -> EnumValueDescriptorProto {
  EnumValueDescriptorProto::{
    name : None,
    number : None,
    options : None,
  }
}
pub  fn[R: @protobuf.Reader] EnumValueDescriptorProto::read(reader : R) -> EnumValueDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumValueDescriptorProto::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] EnumValueDescriptorProto::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumValueDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumValueDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.number = reader |> @protobuf.read_int32() |> Some
      (3, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      EnumValueOptions::default()
    } else {
      EnumValueOptions::read_with_limit(reader, limit=len)
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
pub  fn[W: @protobuf.Writer] EnumValueDescriptorProto::write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.number {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
}
pub impl ToJson for EnumValueDescriptorProto with to_json(self) {
  let json: Map[String, Json] = {}
  match self.name {
      Some(v) => json["name"] = v.to_json()
      _ => ()
    }
  match self.number {
      Some(v) => json["number"] = v.to_json()
      _ => ()
    }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for EnumValueDescriptorProto with from_json(json: Json, path: @json.JsonPath) -> EnumValueDescriptorProto raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for EnumValueDescriptorProto"))
  }
  let message = EnumValueDescriptorProto::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("number", value) => message.number = Some(@json.from_json(value, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] EnumValueDescriptorProto::async_read(reader : R) -> EnumValueDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumValueDescriptorProto::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] EnumValueDescriptorProto::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumValueDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumValueDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.number = reader |> @protobuf.async_read_int32() |> Some
      (3, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      EnumValueOptions::default()
    } else {
      EnumValueOptions::async_read_with_limit(reader, limit=len)
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
pub async fn[W: @protobuf.AsyncWriter] EnumValueDescriptorProto::async_write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.number {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
}
pub(all) struct ServiceDescriptorProto {
  mut name : String?
  mut method_ : Array[MethodDescriptorProto]
  mut options : ServiceOptions?
} derive(Eq, Show)
pub impl @protobuf.Sized for ServiceDescriptorProto with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.method_.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for ServiceDescriptorProto with default() -> ServiceDescriptorProto {
  ServiceDescriptorProto::{
    name : None,
    method_ : [],
    options : None,
  }
}
pub  fn[R: @protobuf.Reader] ServiceDescriptorProto::read(reader : R) -> ServiceDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ServiceDescriptorProto::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] ServiceDescriptorProto::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ServiceDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ServiceDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.method_.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      MethodDescriptorProto::default()
    } else {
      MethodDescriptorProto::read_with_limit(reader, limit=len)
    }
  })
      (3, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      ServiceOptions::default()
    } else {
      ServiceOptions::read_with_limit(reader, limit=len)
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
pub  fn[W: @protobuf.Writer] ServiceDescriptorProto::write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  for item in self.method_ {
    writer |> @protobuf.write_varint(18UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
}
pub impl ToJson for ServiceDescriptorProto with to_json(self) {
  let json: Map[String, Json] = {}
  match self.name {
      Some(v) => json["name"] = v.to_json()
      _ => ()
    }
  if self.method_ != Default::default() {
  json["method"] = self.method_.to_json()
  }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for ServiceDescriptorProto with from_json(json: Json, path: @json.JsonPath) -> ServiceDescriptorProto raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ServiceDescriptorProto"))
  }
  let message = ServiceDescriptorProto::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("method", Array(value)) => message.method_ = value.map(v => 
@json.from_json(v, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] ServiceDescriptorProto::async_read(reader : R) -> ServiceDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ServiceDescriptorProto::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] ServiceDescriptorProto::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ServiceDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ServiceDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.method_.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      MethodDescriptorProto::default()
    } else {
      MethodDescriptorProto::async_read_with_limit(reader, limit=len)
    }
  })
      (3, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      ServiceOptions::default()
    } else {
      ServiceOptions::async_read_with_limit(reader, limit=len)
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
pub async fn[W: @protobuf.AsyncWriter] ServiceDescriptorProto::async_write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  for item in self.method_ {
    writer |> @protobuf.async_write_varint(18UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
}
pub(all) struct MethodDescriptorProto {
  mut name : String?
  mut input_type : String?
  mut output_type : String?
  mut options : MethodOptions?
  mut client_streaming : Bool?
  mut server_streaming : Bool?
} derive(Eq, Show)
pub impl @protobuf.Sized for MethodDescriptorProto with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.input_type {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.output_type {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.options {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.client_streaming {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.server_streaming {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for MethodDescriptorProto with default() -> MethodDescriptorProto {
  MethodDescriptorProto::{
    name : None,
    input_type : None,
    output_type : None,
    options : None,
    client_streaming : Some(false),
    server_streaming : Some(false),
  }
}
pub  fn[R: @protobuf.Reader] MethodDescriptorProto::read(reader : R) -> MethodDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  MethodDescriptorProto::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] MethodDescriptorProto::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> MethodDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = MethodDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.input_type = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.output_type = reader |> @protobuf.read_string() |> Some
      (4, _) => msg.options =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      MethodOptions::default()
    } else {
      MethodOptions::read_with_limit(reader, limit=len)
    }
  } |> Some
      (5, _) => msg.client_streaming = reader |> @protobuf.read_bool() |> Some
      (6, _) => msg.server_streaming = reader |> @protobuf.read_bool() |> Some
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
pub  fn[W: @protobuf.Writer] MethodDescriptorProto::write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.input_type {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.output_type {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.write_varint(34UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.client_streaming {
    Some(v) => {
      writer |> @protobuf.write_varint(40UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.server_streaming {
    Some(v) => {
      writer |> @protobuf.write_varint(48UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
}
pub impl ToJson for MethodDescriptorProto with to_json(self) {
  let json: Map[String, Json] = {}
  match self.name {
      Some(v) => json["name"] = v.to_json()
      _ => ()
    }
  match self.input_type {
      Some(v) => json["inputType"] = v.to_json()
      _ => ()
    }
  match self.output_type {
      Some(v) => json["outputType"] = v.to_json()
      _ => ()
    }
  match self.options {
      Some(v) => json["options"] = v.to_json()
      _ => ()
    }
  match self.client_streaming {
      Some(v) if v != false => json["clientStreaming"] = v.to_json()
      _ => ()
    }
  match self.server_streaming {
      Some(v) if v != false => json["serverStreaming"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for MethodDescriptorProto with from_json(json: Json, path: @json.JsonPath) -> MethodDescriptorProto raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for MethodDescriptorProto"))
  }
  let message = MethodDescriptorProto::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("inputType", value) => message.input_type = Some(@json.from_json(value, path~))
      ("outputType", value) => message.output_type = Some(@json.from_json(value, path~))
      ("options", value) => message.options = Some(@json.from_json(value, path~))
      ("clientStreaming", value) => message.client_streaming = Some(@json.from_json(value, path~))
      ("serverStreaming", value) => message.server_streaming = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] MethodDescriptorProto::async_read(reader : R) -> MethodDescriptorProto raise {
  let reader = @protobuf.LimitedReader::new(reader)
  MethodDescriptorProto::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] MethodDescriptorProto::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> MethodDescriptorProto raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = MethodDescriptorProto::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.input_type = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.output_type = reader |> @protobuf.async_read_string() |> Some
      (4, _) => msg.options =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      MethodOptions::default()
    } else {
      MethodOptions::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (5, _) => msg.client_streaming = reader |> @protobuf.async_read_bool() |> Some
      (6, _) => msg.server_streaming = reader |> @protobuf.async_read_bool() |> Some
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
pub async fn[W: @protobuf.AsyncWriter] MethodDescriptorProto::async_write(self:Self, writer : W) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.input_type {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.output_type {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.options {
    Some(v) => {
      writer |> @protobuf.async_write_varint(34UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.client_streaming {
    Some(v) => {
      writer |> @protobuf.async_write_varint(40UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.server_streaming {
    Some(v) => {
      writer |> @protobuf.async_write_varint(48UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
}
pub(all) enum FileOptions_OptimizeMode {
  SPEED
  CODE_SIZE
  LITE_RUNTIME
} derive(Eq, Show)
pub fn FileOptions_OptimizeMode::to_enum(self : FileOptions_OptimizeMode) -> @protobuf.Enum {
  match self {
    FileOptions_OptimizeMode::SPEED => 1
    FileOptions_OptimizeMode::CODE_SIZE => 2
    FileOptions_OptimizeMode::LITE_RUNTIME => 3
  }
}
pub fn FileOptions_OptimizeMode::from_enum(i : @protobuf.Enum) -> FileOptions_OptimizeMode {
  match i.inner() {
    1 => FileOptions_OptimizeMode::SPEED
    2 => FileOptions_OptimizeMode::CODE_SIZE
    3 => FileOptions_OptimizeMode::LITE_RUNTIME
    _ => Default::default()
  }
}
pub impl Default for FileOptions_OptimizeMode with default() -> FileOptions_OptimizeMode {
  FileOptions_OptimizeMode::SPEED
}
pub impl @protobuf.Sized for FileOptions_OptimizeMode with size_of(self : FileOptions_OptimizeMode) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FileOptions_OptimizeMode with from_json(json: Json, path: @json.JsonPath) -> FileOptions_OptimizeMode raise {
  match json {
    String("SPEED") => FileOptions_OptimizeMode::SPEED
    String("CODE_SIZE") => FileOptions_OptimizeMode::CODE_SIZE
    String("LITE_RUNTIME") => FileOptions_OptimizeMode::LITE_RUNTIME
    Number(1, ..) => FileOptions_OptimizeMode::SPEED
    Number(2, ..) => FileOptions_OptimizeMode::CODE_SIZE
    Number(3, ..) => FileOptions_OptimizeMode::LITE_RUNTIME
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FileOptions_OptimizeMode with to_json(self : FileOptions_OptimizeMode) -> Json {
  match self {
    FileOptions_OptimizeMode::SPEED => "SPEED"
    FileOptions_OptimizeMode::CODE_SIZE => "CODE_SIZE"
    FileOptions_OptimizeMode::LITE_RUNTIME => "LITE_RUNTIME"
  }
}
pub(all) struct FileOptions {
  mut java_package : String?
  mut java_outer_classname : String?
  mut java_multiple_files : Bool?
  mut java_generate_equals_and_hash : Bool?
  mut java_string_check_utf8 : Bool?
  mut optimize_for : FileOptions_OptimizeMode?
  mut go_package : String?
  mut cc_generic_services : Bool?
  mut java_generic_services : Bool?
  mut py_generic_services : Bool?
  mut deprecated : Bool?
  mut cc_enable_arenas : Bool?
  mut objc_class_prefix : String?
  mut csharp_namespace : String?
  mut swift_prefix : String?
  mut php_class_prefix : String?
  mut php_namespace : String?
  mut php_metadata_namespace : String?
  mut ruby_package : String?
  mut features : FeatureSet?
  mut uninterpreted_option : Array[UninterpretedOption]
} derive(Eq, Show)
pub impl @protobuf.Sized for FileOptions with size_of(self) {
  let mut size = 0U
  match self.java_package {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.java_outer_classname {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.java_multiple_files {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.java_generate_equals_and_hash {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.java_string_check_utf8 {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.optimize_for {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.go_package {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.cc_generic_services {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.java_generic_services {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.py_generic_services {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.deprecated {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.cc_enable_arenas {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.objc_class_prefix {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.csharp_namespace {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.swift_prefix {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.php_class_prefix {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.php_namespace {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.php_metadata_namespace {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.ruby_package {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.features {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for FileOptions with default() -> FileOptions {
  FileOptions::{
    java_package : None,
    java_outer_classname : None,
    java_multiple_files : Some(false),
    java_generate_equals_and_hash : None,
    java_string_check_utf8 : Some(false),
    optimize_for : Some(FileOptions_OptimizeMode::SPEED),
    go_package : None,
    cc_generic_services : Some(false),
    java_generic_services : Some(false),
    py_generic_services : Some(false),
    deprecated : Some(false),
    cc_enable_arenas : Some(true),
    objc_class_prefix : None,
    csharp_namespace : None,
    swift_prefix : None,
    php_class_prefix : None,
    php_namespace : None,
    php_metadata_namespace : None,
    ruby_package : None,
    features : None,
    uninterpreted_option : [],
  }
}
pub  fn[R: @protobuf.Reader] FileOptions::read(reader : R) -> FileOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FileOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FileOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FileOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FileOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.java_package = reader |> @protobuf.read_string() |> Some
      (8, _) => msg.java_outer_classname = reader |> @protobuf.read_string() |> Some
      (10, _) => msg.java_multiple_files = reader |> @protobuf.read_bool() |> Some
      (20, _) => msg.java_generate_equals_and_hash = reader |> @protobuf.read_bool() |> Some
      (27, _) => msg.java_string_check_utf8 = reader |> @protobuf.read_bool() |> Some
      (9, _) => msg.optimize_for = reader |> @protobuf.read_enum() |> FileOptions_OptimizeMode::from_enum |> Some
      (11, _) => msg.go_package = reader |> @protobuf.read_string() |> Some
      (16, _) => msg.cc_generic_services = reader |> @protobuf.read_bool() |> Some
      (17, _) => msg.java_generic_services = reader |> @protobuf.read_bool() |> Some
      (18, _) => msg.py_generic_services = reader |> @protobuf.read_bool() |> Some
      (23, _) => msg.deprecated = reader |> @protobuf.read_bool() |> Some
      (31, _) => msg.cc_enable_arenas = reader |> @protobuf.read_bool() |> Some
      (36, _) => msg.objc_class_prefix = reader |> @protobuf.read_string() |> Some
      (37, _) => msg.csharp_namespace = reader |> @protobuf.read_string() |> Some
      (39, _) => msg.swift_prefix = reader |> @protobuf.read_string() |> Some
      (40, _) => msg.php_class_prefix = reader |> @protobuf.read_string() |> Some
      (41, _) => msg.php_namespace = reader |> @protobuf.read_string() |> Some
      (44, _) => msg.php_metadata_namespace = reader |> @protobuf.read_string() |> Some
      (45, _) => msg.ruby_package = reader |> @protobuf.read_string() |> Some
      (50, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] FileOptions::write(self:Self, writer : W) -> Unit raise {
  match self.java_package {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.java_outer_classname {
    Some(v) => {
      writer |> @protobuf.write_varint(66UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.java_multiple_files {
    Some(v) => {
      writer |> @protobuf.write_varint(80UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.java_generate_equals_and_hash {
    Some(v) => {
      writer |> @protobuf.write_varint(160UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.java_string_check_utf8 {
    Some(v) => {
      writer |> @protobuf.write_varint(216UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.optimize_for {
    Some(v) => {
      writer |> @protobuf.write_varint(72UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.go_package {
    Some(v) => {
      writer |> @protobuf.write_varint(90UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.cc_generic_services {
    Some(v) => {
      writer |> @protobuf.write_varint(128UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.java_generic_services {
    Some(v) => {
      writer |> @protobuf.write_varint(136UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.py_generic_services {
    Some(v) => {
      writer |> @protobuf.write_varint(144UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.write_varint(184UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.cc_enable_arenas {
    Some(v) => {
      writer |> @protobuf.write_varint(248UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.objc_class_prefix {
    Some(v) => {
      writer |> @protobuf.write_varint(290UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.csharp_namespace {
    Some(v) => {
      writer |> @protobuf.write_varint(298UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.swift_prefix {
    Some(v) => {
      writer |> @protobuf.write_varint(314UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.php_class_prefix {
    Some(v) => {
      writer |> @protobuf.write_varint(322UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.php_namespace {
    Some(v) => {
      writer |> @protobuf.write_varint(330UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.php_metadata_namespace {
    Some(v) => {
      writer |> @protobuf.write_varint(354UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.ruby_package {
    Some(v) => {
      writer |> @protobuf.write_varint(362UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(402UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for FileOptions with to_json(self) {
  let json: Map[String, Json] = {}
  match self.java_package {
      Some(v) => json["javaPackage"] = v.to_json()
      _ => ()
    }
  match self.java_outer_classname {
      Some(v) => json["javaOuterClassname"] = v.to_json()
      _ => ()
    }
  match self.java_multiple_files {
      Some(v) if v != false => json["javaMultipleFiles"] = v.to_json()
      _ => ()
    }
  match self.java_generate_equals_and_hash {
      Some(v) => json["javaGenerateEqualsAndHash"] = v.to_json()
      _ => ()
    }
  match self.java_string_check_utf8 {
      Some(v) if v != false => json["javaStringCheckUtf8"] = v.to_json()
      _ => ()
    }
  match self.optimize_for {
      Some(v) if v != FileOptions_OptimizeMode::SPEED => json["optimizeFor"] = v.to_json()
      _ => ()
    }
  match self.go_package {
      Some(v) => json["goPackage"] = v.to_json()
      _ => ()
    }
  match self.cc_generic_services {
      Some(v) if v != false => json["ccGenericServices"] = v.to_json()
      _ => ()
    }
  match self.java_generic_services {
      Some(v) if v != false => json["javaGenericServices"] = v.to_json()
      _ => ()
    }
  match self.py_generic_services {
      Some(v) if v != false => json["pyGenericServices"] = v.to_json()
      _ => ()
    }
  match self.deprecated {
      Some(v) if v != false => json["deprecated"] = v.to_json()
      _ => ()
    }
  match self.cc_enable_arenas {
      Some(v) if v != true => json["ccEnableArenas"] = v.to_json()
      _ => ()
    }
  match self.objc_class_prefix {
      Some(v) => json["objcClassPrefix"] = v.to_json()
      _ => ()
    }
  match self.csharp_namespace {
      Some(v) => json["csharpNamespace"] = v.to_json()
      _ => ()
    }
  match self.swift_prefix {
      Some(v) => json["swiftPrefix"] = v.to_json()
      _ => ()
    }
  match self.php_class_prefix {
      Some(v) => json["phpClassPrefix"] = v.to_json()
      _ => ()
    }
  match self.php_namespace {
      Some(v) => json["phpNamespace"] = v.to_json()
      _ => ()
    }
  match self.php_metadata_namespace {
      Some(v) => json["phpMetadataNamespace"] = v.to_json()
      _ => ()
    }
  match self.ruby_package {
      Some(v) => json["rubyPackage"] = v.to_json()
      _ => ()
    }
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for FileOptions with from_json(json: Json, path: @json.JsonPath) -> FileOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FileOptions"))
  }
  let message = FileOptions::default()
  for key, value in obj {
    match (key, value) {
      ("javaPackage", value) => message.java_package = Some(@json.from_json(value, path~))
      ("javaOuterClassname", value) => message.java_outer_classname = Some(@json.from_json(value, path~))
      ("javaMultipleFiles", value) => message.java_multiple_files = Some(@json.from_json(value, path~))
      ("javaGenerateEqualsAndHash", value) => message.java_generate_equals_and_hash = Some(@json.from_json(value, path~))
      ("javaStringCheckUtf8", value) => message.java_string_check_utf8 = Some(@json.from_json(value, path~))
      ("optimizeFor", value) => message.optimize_for = Some(@json.from_json(value, path~))
      ("goPackage", value) => message.go_package = Some(@json.from_json(value, path~))
      ("ccGenericServices", value) => message.cc_generic_services = Some(@json.from_json(value, path~))
      ("javaGenericServices", value) => message.java_generic_services = Some(@json.from_json(value, path~))
      ("pyGenericServices", value) => message.py_generic_services = Some(@json.from_json(value, path~))
      ("deprecated", value) => message.deprecated = Some(@json.from_json(value, path~))
      ("ccEnableArenas", value) => message.cc_enable_arenas = Some(@json.from_json(value, path~))
      ("objcClassPrefix", value) => message.objc_class_prefix = Some(@json.from_json(value, path~))
      ("csharpNamespace", value) => message.csharp_namespace = Some(@json.from_json(value, path~))
      ("swiftPrefix", value) => message.swift_prefix = Some(@json.from_json(value, path~))
      ("phpClassPrefix", value) => message.php_class_prefix = Some(@json.from_json(value, path~))
      ("phpNamespace", value) => message.php_namespace = Some(@json.from_json(value, path~))
      ("phpMetadataNamespace", value) => message.php_metadata_namespace = Some(@json.from_json(value, path~))
      ("rubyPackage", value) => message.ruby_package = Some(@json.from_json(value, path~))
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FileOptions::async_read(reader : R) -> FileOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FileOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FileOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FileOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FileOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.java_package = reader |> @protobuf.async_read_string() |> Some
      (8, _) => msg.java_outer_classname = reader |> @protobuf.async_read_string() |> Some
      (10, _) => msg.java_multiple_files = reader |> @protobuf.async_read_bool() |> Some
      (20, _) => msg.java_generate_equals_and_hash = reader |> @protobuf.async_read_bool() |> Some
      (27, _) => msg.java_string_check_utf8 = reader |> @protobuf.async_read_bool() |> Some
      (9, _) => msg.optimize_for = reader |> @protobuf.async_read_enum() |> FileOptions_OptimizeMode::from_enum |> Some
      (11, _) => msg.go_package = reader |> @protobuf.async_read_string() |> Some
      (16, _) => msg.cc_generic_services = reader |> @protobuf.async_read_bool() |> Some
      (17, _) => msg.java_generic_services = reader |> @protobuf.async_read_bool() |> Some
      (18, _) => msg.py_generic_services = reader |> @protobuf.async_read_bool() |> Some
      (23, _) => msg.deprecated = reader |> @protobuf.async_read_bool() |> Some
      (31, _) => msg.cc_enable_arenas = reader |> @protobuf.async_read_bool() |> Some
      (36, _) => msg.objc_class_prefix = reader |> @protobuf.async_read_string() |> Some
      (37, _) => msg.csharp_namespace = reader |> @protobuf.async_read_string() |> Some
      (39, _) => msg.swift_prefix = reader |> @protobuf.async_read_string() |> Some
      (40, _) => msg.php_class_prefix = reader |> @protobuf.async_read_string() |> Some
      (41, _) => msg.php_namespace = reader |> @protobuf.async_read_string() |> Some
      (44, _) => msg.php_metadata_namespace = reader |> @protobuf.async_read_string() |> Some
      (45, _) => msg.ruby_package = reader |> @protobuf.async_read_string() |> Some
      (50, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] FileOptions::async_write(self:Self, writer : W) -> Unit raise {
  match self.java_package {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.java_outer_classname {
    Some(v) => {
      writer |> @protobuf.async_write_varint(66UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.java_multiple_files {
    Some(v) => {
      writer |> @protobuf.async_write_varint(80UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.java_generate_equals_and_hash {
    Some(v) => {
      writer |> @protobuf.async_write_varint(160UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.java_string_check_utf8 {
    Some(v) => {
      writer |> @protobuf.async_write_varint(216UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.optimize_for {
    Some(v) => {
      writer |> @protobuf.async_write_varint(72UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.go_package {
    Some(v) => {
      writer |> @protobuf.async_write_varint(90UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.cc_generic_services {
    Some(v) => {
      writer |> @protobuf.async_write_varint(128UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.java_generic_services {
    Some(v) => {
      writer |> @protobuf.async_write_varint(136UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.py_generic_services {
    Some(v) => {
      writer |> @protobuf.async_write_varint(144UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(184UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.cc_enable_arenas {
    Some(v) => {
      writer |> @protobuf.async_write_varint(248UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.objc_class_prefix {
    Some(v) => {
      writer |> @protobuf.async_write_varint(290UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.csharp_namespace {
    Some(v) => {
      writer |> @protobuf.async_write_varint(298UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.swift_prefix {
    Some(v) => {
      writer |> @protobuf.async_write_varint(314UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.php_class_prefix {
    Some(v) => {
      writer |> @protobuf.async_write_varint(322UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.php_namespace {
    Some(v) => {
      writer |> @protobuf.async_write_varint(330UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.php_metadata_namespace {
    Some(v) => {
      writer |> @protobuf.async_write_varint(354UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.ruby_package {
    Some(v) => {
      writer |> @protobuf.async_write_varint(362UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(402UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) struct MessageOptions {
  mut message_set_wire_format : Bool?
  mut no_standard_descriptor_accessor : Bool?
  mut deprecated : Bool?
  mut map_entry : Bool?
  mut deprecated_legacy_json_field_conflicts : Bool?
  mut features : FeatureSet?
  mut uninterpreted_option : Array[UninterpretedOption]
} derive(Eq, Show)
pub impl @protobuf.Sized for MessageOptions with size_of(self) {
  let mut size = 0U
  match self.message_set_wire_format {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.no_standard_descriptor_accessor {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.deprecated {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.map_entry {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.deprecated_legacy_json_field_conflicts {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.features {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for MessageOptions with default() -> MessageOptions {
  MessageOptions::{
    message_set_wire_format : Some(false),
    no_standard_descriptor_accessor : Some(false),
    deprecated : Some(false),
    map_entry : None,
    deprecated_legacy_json_field_conflicts : None,
    features : None,
    uninterpreted_option : [],
  }
}
pub  fn[R: @protobuf.Reader] MessageOptions::read(reader : R) -> MessageOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  MessageOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] MessageOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> MessageOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = MessageOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.message_set_wire_format = reader |> @protobuf.read_bool() |> Some
      (2, _) => msg.no_standard_descriptor_accessor = reader |> @protobuf.read_bool() |> Some
      (3, _) => msg.deprecated = reader |> @protobuf.read_bool() |> Some
      (7, _) => msg.map_entry = reader |> @protobuf.read_bool() |> Some
      (11, _) => msg.deprecated_legacy_json_field_conflicts = reader |> @protobuf.read_bool() |> Some
      (12, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] MessageOptions::write(self:Self, writer : W) -> Unit raise {
  match self.message_set_wire_format {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.no_standard_descriptor_accessor {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.map_entry {
    Some(v) => {
      writer |> @protobuf.write_varint(56UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.deprecated_legacy_json_field_conflicts {
    Some(v) => {
      writer |> @protobuf.write_varint(88UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(98UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for MessageOptions with to_json(self) {
  let json: Map[String, Json] = {}
  match self.message_set_wire_format {
      Some(v) if v != false => json["messageSetWireFormat"] = v.to_json()
      _ => ()
    }
  match self.no_standard_descriptor_accessor {
      Some(v) if v != false => json["noStandardDescriptorAccessor"] = v.to_json()
      _ => ()
    }
  match self.deprecated {
      Some(v) if v != false => json["deprecated"] = v.to_json()
      _ => ()
    }
  match self.map_entry {
      Some(v) => json["mapEntry"] = v.to_json()
      _ => ()
    }
  match self.deprecated_legacy_json_field_conflicts {
      Some(v) => json["deprecatedLegacyJsonFieldConflicts"] = v.to_json()
      _ => ()
    }
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for MessageOptions with from_json(json: Json, path: @json.JsonPath) -> MessageOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for MessageOptions"))
  }
  let message = MessageOptions::default()
  for key, value in obj {
    match (key, value) {
      ("messageSetWireFormat", value) => message.message_set_wire_format = Some(@json.from_json(value, path~))
      ("noStandardDescriptorAccessor", value) => message.no_standard_descriptor_accessor = Some(@json.from_json(value, path~))
      ("deprecated", value) => message.deprecated = Some(@json.from_json(value, path~))
      ("mapEntry", value) => message.map_entry = Some(@json.from_json(value, path~))
      ("deprecatedLegacyJsonFieldConflicts", value) => message.deprecated_legacy_json_field_conflicts = Some(@json.from_json(value, path~))
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] MessageOptions::async_read(reader : R) -> MessageOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  MessageOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] MessageOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> MessageOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = MessageOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.message_set_wire_format = reader |> @protobuf.async_read_bool() |> Some
      (2, _) => msg.no_standard_descriptor_accessor = reader |> @protobuf.async_read_bool() |> Some
      (3, _) => msg.deprecated = reader |> @protobuf.async_read_bool() |> Some
      (7, _) => msg.map_entry = reader |> @protobuf.async_read_bool() |> Some
      (11, _) => msg.deprecated_legacy_json_field_conflicts = reader |> @protobuf.async_read_bool() |> Some
      (12, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] MessageOptions::async_write(self:Self, writer : W) -> Unit raise {
  match self.message_set_wire_format {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.no_standard_descriptor_accessor {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.map_entry {
    Some(v) => {
      writer |> @protobuf.async_write_varint(56UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.deprecated_legacy_json_field_conflicts {
    Some(v) => {
      writer |> @protobuf.async_write_varint(88UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(98UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) enum FieldOptions_CType {
  STRING
  CORD
  STRING_PIECE
} derive(Eq, Show)
pub fn FieldOptions_CType::to_enum(self : FieldOptions_CType) -> @protobuf.Enum {
  match self {
    FieldOptions_CType::STRING => 0
    FieldOptions_CType::CORD => 1
    FieldOptions_CType::STRING_PIECE => 2
  }
}
pub fn FieldOptions_CType::from_enum(i : @protobuf.Enum) -> FieldOptions_CType {
  match i.inner() {
    0 => FieldOptions_CType::STRING
    1 => FieldOptions_CType::CORD
    2 => FieldOptions_CType::STRING_PIECE
    _ => Default::default()
  }
}
pub impl Default for FieldOptions_CType with default() -> FieldOptions_CType {
  FieldOptions_CType::STRING
}
pub impl @protobuf.Sized for FieldOptions_CType with size_of(self : FieldOptions_CType) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FieldOptions_CType with from_json(json: Json, path: @json.JsonPath) -> FieldOptions_CType raise {
  match json {
    String("STRING") => FieldOptions_CType::STRING
    String("CORD") => FieldOptions_CType::CORD
    String("STRING_PIECE") => FieldOptions_CType::STRING_PIECE
    Number(0, ..) => FieldOptions_CType::STRING
    Number(1, ..) => FieldOptions_CType::CORD
    Number(2, ..) => FieldOptions_CType::STRING_PIECE
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FieldOptions_CType with to_json(self : FieldOptions_CType) -> Json {
  match self {
    FieldOptions_CType::STRING => "STRING"
    FieldOptions_CType::CORD => "CORD"
    FieldOptions_CType::STRING_PIECE => "STRING_PIECE"
  }
}
pub(all) enum FieldOptions_JSType {
  JS_NORMAL
  JS_STRING
  JS_NUMBER
} derive(Eq, Show)
pub fn FieldOptions_JSType::to_enum(self : FieldOptions_JSType) -> @protobuf.Enum {
  match self {
    FieldOptions_JSType::JS_NORMAL => 0
    FieldOptions_JSType::JS_STRING => 1
    FieldOptions_JSType::JS_NUMBER => 2
  }
}
pub fn FieldOptions_JSType::from_enum(i : @protobuf.Enum) -> FieldOptions_JSType {
  match i.inner() {
    0 => FieldOptions_JSType::JS_NORMAL
    1 => FieldOptions_JSType::JS_STRING
    2 => FieldOptions_JSType::JS_NUMBER
    _ => Default::default()
  }
}
pub impl Default for FieldOptions_JSType with default() -> FieldOptions_JSType {
  FieldOptions_JSType::JS_NORMAL
}
pub impl @protobuf.Sized for FieldOptions_JSType with size_of(self : FieldOptions_JSType) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FieldOptions_JSType with from_json(json: Json, path: @json.JsonPath) -> FieldOptions_JSType raise {
  match json {
    String("JS_NORMAL") => FieldOptions_JSType::JS_NORMAL
    String("JS_STRING") => FieldOptions_JSType::JS_STRING
    String("JS_NUMBER") => FieldOptions_JSType::JS_NUMBER
    Number(0, ..) => FieldOptions_JSType::JS_NORMAL
    Number(1, ..) => FieldOptions_JSType::JS_STRING
    Number(2, ..) => FieldOptions_JSType::JS_NUMBER
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FieldOptions_JSType with to_json(self : FieldOptions_JSType) -> Json {
  match self {
    FieldOptions_JSType::JS_NORMAL => "JS_NORMAL"
    FieldOptions_JSType::JS_STRING => "JS_STRING"
    FieldOptions_JSType::JS_NUMBER => "JS_NUMBER"
  }
}
pub(all) enum FieldOptions_OptionRetention {
  RETENTION_UNKNOWN
  RETENTION_RUNTIME
  RETENTION_SOURCE
} derive(Eq, Show)
pub fn FieldOptions_OptionRetention::to_enum(self : FieldOptions_OptionRetention) -> @protobuf.Enum {
  match self {
    FieldOptions_OptionRetention::RETENTION_UNKNOWN => 0
    FieldOptions_OptionRetention::RETENTION_RUNTIME => 1
    FieldOptions_OptionRetention::RETENTION_SOURCE => 2
  }
}
pub fn FieldOptions_OptionRetention::from_enum(i : @protobuf.Enum) -> FieldOptions_OptionRetention {
  match i.inner() {
    0 => FieldOptions_OptionRetention::RETENTION_UNKNOWN
    1 => FieldOptions_OptionRetention::RETENTION_RUNTIME
    2 => FieldOptions_OptionRetention::RETENTION_SOURCE
    _ => Default::default()
  }
}
pub impl Default for FieldOptions_OptionRetention with default() -> FieldOptions_OptionRetention {
  FieldOptions_OptionRetention::RETENTION_UNKNOWN
}
pub impl @protobuf.Sized for FieldOptions_OptionRetention with size_of(self : FieldOptions_OptionRetention) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FieldOptions_OptionRetention with from_json(json: Json, path: @json.JsonPath) -> FieldOptions_OptionRetention raise {
  match json {
    String("RETENTION_UNKNOWN") => FieldOptions_OptionRetention::RETENTION_UNKNOWN
    String("RETENTION_RUNTIME") => FieldOptions_OptionRetention::RETENTION_RUNTIME
    String("RETENTION_SOURCE") => FieldOptions_OptionRetention::RETENTION_SOURCE
    Number(0, ..) => FieldOptions_OptionRetention::RETENTION_UNKNOWN
    Number(1, ..) => FieldOptions_OptionRetention::RETENTION_RUNTIME
    Number(2, ..) => FieldOptions_OptionRetention::RETENTION_SOURCE
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FieldOptions_OptionRetention with to_json(self : FieldOptions_OptionRetention) -> Json {
  match self {
    FieldOptions_OptionRetention::RETENTION_UNKNOWN => "RETENTION_UNKNOWN"
    FieldOptions_OptionRetention::RETENTION_RUNTIME => "RETENTION_RUNTIME"
    FieldOptions_OptionRetention::RETENTION_SOURCE => "RETENTION_SOURCE"
  }
}
pub(all) enum FieldOptions_OptionTargetType {
  TARGET_TYPE_UNKNOWN
  TARGET_TYPE_FILE
  TARGET_TYPE_EXTENSION_RANGE
  TARGET_TYPE_MESSAGE
  TARGET_TYPE_FIELD
  TARGET_TYPE_ONEOF
  TARGET_TYPE_ENUM
  TARGET_TYPE_ENUM_ENTRY
  TARGET_TYPE_SERVICE
  TARGET_TYPE_METHOD
} derive(Eq, Show)
pub fn FieldOptions_OptionTargetType::to_enum(self : FieldOptions_OptionTargetType) -> @protobuf.Enum {
  match self {
    FieldOptions_OptionTargetType::TARGET_TYPE_UNKNOWN => 0
    FieldOptions_OptionTargetType::TARGET_TYPE_FILE => 1
    FieldOptions_OptionTargetType::TARGET_TYPE_EXTENSION_RANGE => 2
    FieldOptions_OptionTargetType::TARGET_TYPE_MESSAGE => 3
    FieldOptions_OptionTargetType::TARGET_TYPE_FIELD => 4
    FieldOptions_OptionTargetType::TARGET_TYPE_ONEOF => 5
    FieldOptions_OptionTargetType::TARGET_TYPE_ENUM => 6
    FieldOptions_OptionTargetType::TARGET_TYPE_ENUM_ENTRY => 7
    FieldOptions_OptionTargetType::TARGET_TYPE_SERVICE => 8
    FieldOptions_OptionTargetType::TARGET_TYPE_METHOD => 9
  }
}
pub fn FieldOptions_OptionTargetType::from_enum(i : @protobuf.Enum) -> FieldOptions_OptionTargetType {
  match i.inner() {
    0 => FieldOptions_OptionTargetType::TARGET_TYPE_UNKNOWN
    1 => FieldOptions_OptionTargetType::TARGET_TYPE_FILE
    2 => FieldOptions_OptionTargetType::TARGET_TYPE_EXTENSION_RANGE
    3 => FieldOptions_OptionTargetType::TARGET_TYPE_MESSAGE
    4 => FieldOptions_OptionTargetType::TARGET_TYPE_FIELD
    5 => FieldOptions_OptionTargetType::TARGET_TYPE_ONEOF
    6 => FieldOptions_OptionTargetType::TARGET_TYPE_ENUM
    7 => FieldOptions_OptionTargetType::TARGET_TYPE_ENUM_ENTRY
    8 => FieldOptions_OptionTargetType::TARGET_TYPE_SERVICE
    9 => FieldOptions_OptionTargetType::TARGET_TYPE_METHOD
    _ => Default::default()
  }
}
pub impl Default for FieldOptions_OptionTargetType with default() -> FieldOptions_OptionTargetType {
  FieldOptions_OptionTargetType::TARGET_TYPE_UNKNOWN
}
pub impl @protobuf.Sized for FieldOptions_OptionTargetType with size_of(self : FieldOptions_OptionTargetType) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FieldOptions_OptionTargetType with from_json(json: Json, path: @json.JsonPath) -> FieldOptions_OptionTargetType raise {
  match json {
    String("TARGET_TYPE_UNKNOWN") => FieldOptions_OptionTargetType::TARGET_TYPE_UNKNOWN
    String("TARGET_TYPE_FILE") => FieldOptions_OptionTargetType::TARGET_TYPE_FILE
    String("TARGET_TYPE_EXTENSION_RANGE") => FieldOptions_OptionTargetType::TARGET_TYPE_EXTENSION_RANGE
    String("TARGET_TYPE_MESSAGE") => FieldOptions_OptionTargetType::TARGET_TYPE_MESSAGE
    String("TARGET_TYPE_FIELD") => FieldOptions_OptionTargetType::TARGET_TYPE_FIELD
    String("TARGET_TYPE_ONEOF") => FieldOptions_OptionTargetType::TARGET_TYPE_ONEOF
    String("TARGET_TYPE_ENUM") => FieldOptions_OptionTargetType::TARGET_TYPE_ENUM
    String("TARGET_TYPE_ENUM_ENTRY") => FieldOptions_OptionTargetType::TARGET_TYPE_ENUM_ENTRY
    String("TARGET_TYPE_SERVICE") => FieldOptions_OptionTargetType::TARGET_TYPE_SERVICE
    String("TARGET_TYPE_METHOD") => FieldOptions_OptionTargetType::TARGET_TYPE_METHOD
    Number(0, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_UNKNOWN
    Number(1, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_FILE
    Number(2, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_EXTENSION_RANGE
    Number(3, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_MESSAGE
    Number(4, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_FIELD
    Number(5, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_ONEOF
    Number(6, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_ENUM
    Number(7, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_ENUM_ENTRY
    Number(8, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_SERVICE
    Number(9, ..) => FieldOptions_OptionTargetType::TARGET_TYPE_METHOD
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FieldOptions_OptionTargetType with to_json(self : FieldOptions_OptionTargetType) -> Json {
  match self {
    FieldOptions_OptionTargetType::TARGET_TYPE_UNKNOWN => "TARGET_TYPE_UNKNOWN"
    FieldOptions_OptionTargetType::TARGET_TYPE_FILE => "TARGET_TYPE_FILE"
    FieldOptions_OptionTargetType::TARGET_TYPE_EXTENSION_RANGE => "TARGET_TYPE_EXTENSION_RANGE"
    FieldOptions_OptionTargetType::TARGET_TYPE_MESSAGE => "TARGET_TYPE_MESSAGE"
    FieldOptions_OptionTargetType::TARGET_TYPE_FIELD => "TARGET_TYPE_FIELD"
    FieldOptions_OptionTargetType::TARGET_TYPE_ONEOF => "TARGET_TYPE_ONEOF"
    FieldOptions_OptionTargetType::TARGET_TYPE_ENUM => "TARGET_TYPE_ENUM"
    FieldOptions_OptionTargetType::TARGET_TYPE_ENUM_ENTRY => "TARGET_TYPE_ENUM_ENTRY"
    FieldOptions_OptionTargetType::TARGET_TYPE_SERVICE => "TARGET_TYPE_SERVICE"
    FieldOptions_OptionTargetType::TARGET_TYPE_METHOD => "TARGET_TYPE_METHOD"
  }
}
pub(all) struct FieldOptions_EditionDefault {
  mut edition : Edition?
  mut value : String?
} derive(Eq, Show)
pub impl @protobuf.Sized for FieldOptions_EditionDefault with size_of(self) {
  let mut size = 0U
  match self.edition {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.value {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for FieldOptions_EditionDefault with default() -> FieldOptions_EditionDefault {
  FieldOptions_EditionDefault::{
    edition : None,
    value : None,
  }
}
pub  fn[R: @protobuf.Reader] FieldOptions_EditionDefault::read(reader : R) -> FieldOptions_EditionDefault raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FieldOptions_EditionDefault::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FieldOptions_EditionDefault::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FieldOptions_EditionDefault raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FieldOptions_EditionDefault::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (3, _) => msg.edition = reader |> @protobuf.read_enum() |> Edition::from_enum |> Some
      (2, _) => msg.value = reader |> @protobuf.read_string() |> Some
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
pub  fn[W: @protobuf.Writer] FieldOptions_EditionDefault::write(self:Self, writer : W) -> Unit raise {
  match self.edition {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.value {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
}
pub impl ToJson for FieldOptions_EditionDefault with to_json(self) {
  let json: Map[String, Json] = {}
  match self.edition {
      Some(v) => json["edition"] = v.to_json()
      _ => ()
    }
  match self.value {
      Some(v) => json["value"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for FieldOptions_EditionDefault with from_json(json: Json, path: @json.JsonPath) -> FieldOptions_EditionDefault raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FieldOptions_EditionDefault"))
  }
  let message = FieldOptions_EditionDefault::default()
  for key, value in obj {
    match (key, value) {
      ("edition", value) => message.edition = Some(@json.from_json(value, path~))
      ("value", value) => message.value = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FieldOptions_EditionDefault::async_read(reader : R) -> FieldOptions_EditionDefault raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FieldOptions_EditionDefault::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FieldOptions_EditionDefault::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FieldOptions_EditionDefault raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FieldOptions_EditionDefault::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (3, _) => msg.edition = reader |> @protobuf.async_read_enum() |> Edition::from_enum |> Some
      (2, _) => msg.value = reader |> @protobuf.async_read_string() |> Some
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
pub async fn[W: @protobuf.AsyncWriter] FieldOptions_EditionDefault::async_write(self:Self, writer : W) -> Unit raise {
  match self.edition {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
}
pub(all) struct FieldOptions_FeatureSupport {
  mut edition_introduced : Edition?
  mut edition_deprecated : Edition?
  mut deprecation_warning : String?
  mut edition_removed : Edition?
} derive(Eq, Show)
pub impl @protobuf.Sized for FieldOptions_FeatureSupport with size_of(self) {
  let mut size = 0U
  match self.edition_introduced {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.edition_deprecated {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.deprecation_warning {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.edition_removed {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for FieldOptions_FeatureSupport with default() -> FieldOptions_FeatureSupport {
  FieldOptions_FeatureSupport::{
    edition_introduced : None,
    edition_deprecated : None,
    deprecation_warning : None,
    edition_removed : None,
  }
}
pub  fn[R: @protobuf.Reader] FieldOptions_FeatureSupport::read(reader : R) -> FieldOptions_FeatureSupport raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FieldOptions_FeatureSupport::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FieldOptions_FeatureSupport::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FieldOptions_FeatureSupport raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FieldOptions_FeatureSupport::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.edition_introduced = reader |> @protobuf.read_enum() |> Edition::from_enum |> Some
      (2, _) => msg.edition_deprecated = reader |> @protobuf.read_enum() |> Edition::from_enum |> Some
      (3, _) => msg.deprecation_warning = reader |> @protobuf.read_string() |> Some
      (4, _) => msg.edition_removed = reader |> @protobuf.read_enum() |> Edition::from_enum |> Some
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
pub  fn[W: @protobuf.Writer] FieldOptions_FeatureSupport::write(self:Self, writer : W) -> Unit raise {
  match self.edition_introduced {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.edition_deprecated {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.deprecation_warning {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.edition_removed {
    Some(v) => {
      writer |> @protobuf.write_varint(32UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
}
pub impl ToJson for FieldOptions_FeatureSupport with to_json(self) {
  let json: Map[String, Json] = {}
  match self.edition_introduced {
      Some(v) => json["editionIntroduced"] = v.to_json()
      _ => ()
    }
  match self.edition_deprecated {
      Some(v) => json["editionDeprecated"] = v.to_json()
      _ => ()
    }
  match self.deprecation_warning {
      Some(v) => json["deprecationWarning"] = v.to_json()
      _ => ()
    }
  match self.edition_removed {
      Some(v) => json["editionRemoved"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for FieldOptions_FeatureSupport with from_json(json: Json, path: @json.JsonPath) -> FieldOptions_FeatureSupport raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FieldOptions_FeatureSupport"))
  }
  let message = FieldOptions_FeatureSupport::default()
  for key, value in obj {
    match (key, value) {
      ("editionIntroduced", value) => message.edition_introduced = Some(@json.from_json(value, path~))
      ("editionDeprecated", value) => message.edition_deprecated = Some(@json.from_json(value, path~))
      ("deprecationWarning", value) => message.deprecation_warning = Some(@json.from_json(value, path~))
      ("editionRemoved", value) => message.edition_removed = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FieldOptions_FeatureSupport::async_read(reader : R) -> FieldOptions_FeatureSupport raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FieldOptions_FeatureSupport::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FieldOptions_FeatureSupport::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FieldOptions_FeatureSupport raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FieldOptions_FeatureSupport::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.edition_introduced = reader |> @protobuf.async_read_enum() |> Edition::from_enum |> Some
      (2, _) => msg.edition_deprecated = reader |> @protobuf.async_read_enum() |> Edition::from_enum |> Some
      (3, _) => msg.deprecation_warning = reader |> @protobuf.async_read_string() |> Some
      (4, _) => msg.edition_removed = reader |> @protobuf.async_read_enum() |> Edition::from_enum |> Some
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
pub async fn[W: @protobuf.AsyncWriter] FieldOptions_FeatureSupport::async_write(self:Self, writer : W) -> Unit raise {
  match self.edition_introduced {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.edition_deprecated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.deprecation_warning {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.edition_removed {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
}
pub(all) struct FieldOptions {
  mut ctype : FieldOptions_CType?
  mut packed : Bool?
  mut jstype : FieldOptions_JSType?
  mut lazy_ : Bool?
  mut unverified_lazy : Bool?
  mut deprecated : Bool?
  mut weak : Bool?
  mut debug_redact : Bool?
  mut retention : FieldOptions_OptionRetention?
  mut targets : Array[FieldOptions_OptionTargetType]
  mut edition_defaults : Array[FieldOptions_EditionDefault]
  mut features : FeatureSet?
  mut feature_support : FieldOptions_FeatureSupport?
  mut uninterpreted_option : Array[UninterpretedOption]
} derive(Eq, Show)
pub impl @protobuf.Sized for FieldOptions with size_of(self) {
  let mut size = 0U
  match self.ctype {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.packed {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.jstype {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.lazy_ {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.unverified_lazy {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.deprecated {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.weak {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.debug_redact {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.retention {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  size += self.targets.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.edition_defaults.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.features {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.feature_support {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for FieldOptions with default() -> FieldOptions {
  FieldOptions::{
    ctype : Some(FieldOptions_CType::STRING),
    packed : None,
    jstype : Some(FieldOptions_JSType::JS_NORMAL),
    lazy_ : Some(false),
    unverified_lazy : Some(false),
    deprecated : Some(false),
    weak : Some(false),
    debug_redact : Some(false),
    retention : None,
    targets : [],
    edition_defaults : [],
    features : None,
    feature_support : None,
    uninterpreted_option : [],
  }
}
pub  fn[R: @protobuf.Reader] FieldOptions::read(reader : R) -> FieldOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FieldOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FieldOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FieldOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FieldOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.ctype = reader |> @protobuf.read_enum() |> FieldOptions_CType::from_enum |> Some
      (2, _) => msg.packed = reader |> @protobuf.read_bool() |> Some
      (6, _) => msg.jstype = reader |> @protobuf.read_enum() |> FieldOptions_JSType::from_enum |> Some
      (5, _) => msg.lazy_ = reader |> @protobuf.read_bool() |> Some
      (15, _) => msg.unverified_lazy = reader |> @protobuf.read_bool() |> Some
      (3, _) => msg.deprecated = reader |> @protobuf.read_bool() |> Some
      (10, _) => msg.weak = reader |> @protobuf.read_bool() |> Some
      (16, _) => msg.debug_redact = reader |> @protobuf.read_bool() |> Some
      (17, _) => msg.retention = reader |> @protobuf.read_enum() |> FieldOptions_OptionRetention::from_enum |> Some
      (19, _) => msg.targets.push(reader |> @protobuf.read_enum() |> FieldOptions_OptionTargetType::from_enum)
      (20, _) => msg.edition_defaults.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FieldOptions_EditionDefault::default()
    } else {
      FieldOptions_EditionDefault::read_with_limit(reader, limit=len)
    }
  })
      (21, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (22, _) => msg.feature_support =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FieldOptions_FeatureSupport::default()
    } else {
      FieldOptions_FeatureSupport::read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] FieldOptions::write(self:Self, writer : W) -> Unit raise {
  match self.ctype {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.packed {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.jstype {
    Some(v) => {
      writer |> @protobuf.write_varint(48UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.lazy_ {
    Some(v) => {
      writer |> @protobuf.write_varint(40UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.unverified_lazy {
    Some(v) => {
      writer |> @protobuf.write_varint(120UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.weak {
    Some(v) => {
      writer |> @protobuf.write_varint(80UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.debug_redact {
    Some(v) => {
      writer |> @protobuf.write_varint(128UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.retention {
    Some(v) => {
      writer |> @protobuf.write_varint(136UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  for item in self.targets {
    writer |> @protobuf.write_varint(152UL)
    writer |> @protobuf.write_enum(item.to_enum())

  }
  for item in self.edition_defaults {
    writer |> @protobuf.write_varint(162UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(170UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.feature_support {
    Some(v) => {
      writer |> @protobuf.write_varint(178UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for FieldOptions with to_json(self) {
  let json: Map[String, Json] = {}
  match self.ctype {
      Some(v) if v != FieldOptions_CType::STRING => json["ctype"] = v.to_json()
      _ => ()
    }
  match self.packed {
      Some(v) => json["packed"] = v.to_json()
      _ => ()
    }
  match self.jstype {
      Some(v) if v != FieldOptions_JSType::JS_NORMAL => json["jstype"] = v.to_json()
      _ => ()
    }
  match self.lazy_ {
      Some(v) if v != false => json["lazy"] = v.to_json()
      _ => ()
    }
  match self.unverified_lazy {
      Some(v) if v != false => json["unverifiedLazy"] = v.to_json()
      _ => ()
    }
  match self.deprecated {
      Some(v) if v != false => json["deprecated"] = v.to_json()
      _ => ()
    }
  match self.weak {
      Some(v) if v != false => json["weak"] = v.to_json()
      _ => ()
    }
  match self.debug_redact {
      Some(v) if v != false => json["debugRedact"] = v.to_json()
      _ => ()
    }
  match self.retention {
      Some(v) => json["retention"] = v.to_json()
      _ => ()
    }
  if self.targets != Default::default() {
  json["targets"] = self.targets.to_json()
  }
  if self.edition_defaults != Default::default() {
  json["editionDefaults"] = self.edition_defaults.to_json()
  }
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  match self.feature_support {
      Some(v) => json["featureSupport"] = v.to_json()
      _ => ()
    }
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for FieldOptions with from_json(json: Json, path: @json.JsonPath) -> FieldOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FieldOptions"))
  }
  let message = FieldOptions::default()
  for key, value in obj {
    match (key, value) {
      ("ctype", value) => message.ctype = Some(@json.from_json(value, path~))
      ("packed", value) => message.packed = Some(@json.from_json(value, path~))
      ("jstype", value) => message.jstype = Some(@json.from_json(value, path~))
      ("lazy", value) => message.lazy_ = Some(@json.from_json(value, path~))
      ("unverifiedLazy", value) => message.unverified_lazy = Some(@json.from_json(value, path~))
      ("deprecated", value) => message.deprecated = Some(@json.from_json(value, path~))
      ("weak", value) => message.weak = Some(@json.from_json(value, path~))
      ("debugRedact", value) => message.debug_redact = Some(@json.from_json(value, path~))
      ("retention", value) => message.retention = Some(@json.from_json(value, path~))
      ("targets", Array(value)) => message.targets = value.map(v => 
@json.from_json(v, path~))
      ("editionDefaults", Array(value)) => message.edition_defaults = value.map(v => 
@json.from_json(v, path~))
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("featureSupport", value) => message.feature_support = Some(@json.from_json(value, path~))
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FieldOptions::async_read(reader : R) -> FieldOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FieldOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FieldOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FieldOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FieldOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.ctype = reader |> @protobuf.async_read_enum() |> FieldOptions_CType::from_enum |> Some
      (2, _) => msg.packed = reader |> @protobuf.async_read_bool() |> Some
      (6, _) => msg.jstype = reader |> @protobuf.async_read_enum() |> FieldOptions_JSType::from_enum |> Some
      (5, _) => msg.lazy_ = reader |> @protobuf.async_read_bool() |> Some
      (15, _) => msg.unverified_lazy = reader |> @protobuf.async_read_bool() |> Some
      (3, _) => msg.deprecated = reader |> @protobuf.async_read_bool() |> Some
      (10, _) => msg.weak = reader |> @protobuf.async_read_bool() |> Some
      (16, _) => msg.debug_redact = reader |> @protobuf.async_read_bool() |> Some
      (17, _) => msg.retention = reader |> @protobuf.async_read_enum() |> FieldOptions_OptionRetention::from_enum |> Some
      (19, _) => msg.targets.push(reader |> @protobuf.async_read_enum() |> FieldOptions_OptionTargetType::from_enum)
      (20, _) => msg.edition_defaults.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FieldOptions_EditionDefault::default()
    } else {
      FieldOptions_EditionDefault::async_read_with_limit(reader, limit=len)
    }
  })
      (21, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (22, _) => msg.feature_support =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FieldOptions_FeatureSupport::default()
    } else {
      FieldOptions_FeatureSupport::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] FieldOptions::async_write(self:Self, writer : W) -> Unit raise {
  match self.ctype {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.packed {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.jstype {
    Some(v) => {
      writer |> @protobuf.async_write_varint(48UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.lazy_ {
    Some(v) => {
      writer |> @protobuf.async_write_varint(40UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.unverified_lazy {
    Some(v) => {
      writer |> @protobuf.async_write_varint(120UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.weak {
    Some(v) => {
      writer |> @protobuf.async_write_varint(80UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.debug_redact {
    Some(v) => {
      writer |> @protobuf.async_write_varint(128UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.retention {
    Some(v) => {
      writer |> @protobuf.async_write_varint(136UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  for item in self.targets {
    writer |> @protobuf.async_write_varint(152UL)
    writer |> @protobuf.async_write_enum(item.to_enum())

  }
  for item in self.edition_defaults {
    writer |> @protobuf.async_write_varint(162UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(170UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.feature_support {
    Some(v) => {
      writer |> @protobuf.async_write_varint(178UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) struct OneofOptions {
  mut features : FeatureSet?
  mut uninterpreted_option : Array[UninterpretedOption]
} derive(Eq, Show)
pub impl @protobuf.Sized for OneofOptions with size_of(self) {
  let mut size = 0U
  match self.features {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for OneofOptions with default() -> OneofOptions {
  OneofOptions::{
    features : None,
    uninterpreted_option : [],
  }
}
pub  fn[R: @protobuf.Reader] OneofOptions::read(reader : R) -> OneofOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  OneofOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] OneofOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> OneofOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = OneofOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] OneofOptions::write(self:Self, writer : W) -> Unit raise {
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for OneofOptions with to_json(self) {
  let json: Map[String, Json] = {}
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for OneofOptions with from_json(json: Json, path: @json.JsonPath) -> OneofOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for OneofOptions"))
  }
  let message = OneofOptions::default()
  for key, value in obj {
    match (key, value) {
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] OneofOptions::async_read(reader : R) -> OneofOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  OneofOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] OneofOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> OneofOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = OneofOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] OneofOptions::async_write(self:Self, writer : W) -> Unit raise {
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) struct EnumOptions {
  mut allow_alias : Bool?
  mut deprecated : Bool?
  mut deprecated_legacy_json_field_conflicts : Bool?
  mut features : FeatureSet?
  mut uninterpreted_option : Array[UninterpretedOption]
} derive(Eq, Show)
pub impl @protobuf.Sized for EnumOptions with size_of(self) {
  let mut size = 0U
  match self.allow_alias {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.deprecated {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.deprecated_legacy_json_field_conflicts {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.features {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for EnumOptions with default() -> EnumOptions {
  EnumOptions::{
    allow_alias : None,
    deprecated : Some(false),
    deprecated_legacy_json_field_conflicts : None,
    features : None,
    uninterpreted_option : [],
  }
}
pub  fn[R: @protobuf.Reader] EnumOptions::read(reader : R) -> EnumOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] EnumOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (2, _) => msg.allow_alias = reader |> @protobuf.read_bool() |> Some
      (3, _) => msg.deprecated = reader |> @protobuf.read_bool() |> Some
      (6, _) => msg.deprecated_legacy_json_field_conflicts = reader |> @protobuf.read_bool() |> Some
      (7, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] EnumOptions::write(self:Self, writer : W) -> Unit raise {
  match self.allow_alias {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.deprecated_legacy_json_field_conflicts {
    Some(v) => {
      writer |> @protobuf.write_varint(48UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(58UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for EnumOptions with to_json(self) {
  let json: Map[String, Json] = {}
  match self.allow_alias {
      Some(v) => json["allowAlias"] = v.to_json()
      _ => ()
    }
  match self.deprecated {
      Some(v) if v != false => json["deprecated"] = v.to_json()
      _ => ()
    }
  match self.deprecated_legacy_json_field_conflicts {
      Some(v) => json["deprecatedLegacyJsonFieldConflicts"] = v.to_json()
      _ => ()
    }
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for EnumOptions with from_json(json: Json, path: @json.JsonPath) -> EnumOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for EnumOptions"))
  }
  let message = EnumOptions::default()
  for key, value in obj {
    match (key, value) {
      ("allowAlias", value) => message.allow_alias = Some(@json.from_json(value, path~))
      ("deprecated", value) => message.deprecated = Some(@json.from_json(value, path~))
      ("deprecatedLegacyJsonFieldConflicts", value) => message.deprecated_legacy_json_field_conflicts = Some(@json.from_json(value, path~))
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] EnumOptions::async_read(reader : R) -> EnumOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] EnumOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (2, _) => msg.allow_alias = reader |> @protobuf.async_read_bool() |> Some
      (3, _) => msg.deprecated = reader |> @protobuf.async_read_bool() |> Some
      (6, _) => msg.deprecated_legacy_json_field_conflicts = reader |> @protobuf.async_read_bool() |> Some
      (7, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] EnumOptions::async_write(self:Self, writer : W) -> Unit raise {
  match self.allow_alias {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.deprecated_legacy_json_field_conflicts {
    Some(v) => {
      writer |> @protobuf.async_write_varint(48UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(58UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) struct EnumValueOptions {
  mut deprecated : Bool?
  mut features : FeatureSet?
  mut debug_redact : Bool?
  mut feature_support : FieldOptions_FeatureSupport?
  mut uninterpreted_option : Array[UninterpretedOption]
} derive(Eq, Show)
pub impl @protobuf.Sized for EnumValueOptions with size_of(self) {
  let mut size = 0U
  match self.deprecated {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.features {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.debug_redact {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.feature_support {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for EnumValueOptions with default() -> EnumValueOptions {
  EnumValueOptions::{
    deprecated : Some(false),
    features : None,
    debug_redact : Some(false),
    feature_support : None,
    uninterpreted_option : [],
  }
}
pub  fn[R: @protobuf.Reader] EnumValueOptions::read(reader : R) -> EnumValueOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumValueOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] EnumValueOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumValueOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumValueOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.deprecated = reader |> @protobuf.read_bool() |> Some
      (2, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.debug_redact = reader |> @protobuf.read_bool() |> Some
      (4, _) => msg.feature_support =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FieldOptions_FeatureSupport::default()
    } else {
      FieldOptions_FeatureSupport::read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] EnumValueOptions::write(self:Self, writer : W) -> Unit raise {
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.debug_redact {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.feature_support {
    Some(v) => {
      writer |> @protobuf.write_varint(34UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for EnumValueOptions with to_json(self) {
  let json: Map[String, Json] = {}
  match self.deprecated {
      Some(v) if v != false => json["deprecated"] = v.to_json()
      _ => ()
    }
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  match self.debug_redact {
      Some(v) if v != false => json["debugRedact"] = v.to_json()
      _ => ()
    }
  match self.feature_support {
      Some(v) => json["featureSupport"] = v.to_json()
      _ => ()
    }
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for EnumValueOptions with from_json(json: Json, path: @json.JsonPath) -> EnumValueOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for EnumValueOptions"))
  }
  let message = EnumValueOptions::default()
  for key, value in obj {
    match (key, value) {
      ("deprecated", value) => message.deprecated = Some(@json.from_json(value, path~))
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("debugRedact", value) => message.debug_redact = Some(@json.from_json(value, path~))
      ("featureSupport", value) => message.feature_support = Some(@json.from_json(value, path~))
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] EnumValueOptions::async_read(reader : R) -> EnumValueOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  EnumValueOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] EnumValueOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> EnumValueOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = EnumValueOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.deprecated = reader |> @protobuf.async_read_bool() |> Some
      (2, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.debug_redact = reader |> @protobuf.async_read_bool() |> Some
      (4, _) => msg.feature_support =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FieldOptions_FeatureSupport::default()
    } else {
      FieldOptions_FeatureSupport::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] EnumValueOptions::async_write(self:Self, writer : W) -> Unit raise {
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.debug_redact {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.feature_support {
    Some(v) => {
      writer |> @protobuf.async_write_varint(34UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) struct ServiceOptions {
  mut features : FeatureSet?
  mut deprecated : Bool?
  mut uninterpreted_option : Array[UninterpretedOption]
} derive(Eq, Show)
pub impl @protobuf.Sized for ServiceOptions with size_of(self) {
  let mut size = 0U
  match self.features {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.deprecated {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for ServiceOptions with default() -> ServiceOptions {
  ServiceOptions::{
    features : None,
    deprecated : Some(false),
    uninterpreted_option : [],
  }
}
pub  fn[R: @protobuf.Reader] ServiceOptions::read(reader : R) -> ServiceOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ServiceOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] ServiceOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ServiceOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ServiceOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (34, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (33, _) => msg.deprecated = reader |> @protobuf.read_bool() |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] ServiceOptions::write(self:Self, writer : W) -> Unit raise {
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(274UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.write_varint(264UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for ServiceOptions with to_json(self) {
  let json: Map[String, Json] = {}
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  match self.deprecated {
      Some(v) if v != false => json["deprecated"] = v.to_json()
      _ => ()
    }
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for ServiceOptions with from_json(json: Json, path: @json.JsonPath) -> ServiceOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ServiceOptions"))
  }
  let message = ServiceOptions::default()
  for key, value in obj {
    match (key, value) {
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("deprecated", value) => message.deprecated = Some(@json.from_json(value, path~))
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] ServiceOptions::async_read(reader : R) -> ServiceOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ServiceOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] ServiceOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ServiceOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ServiceOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (34, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (33, _) => msg.deprecated = reader |> @protobuf.async_read_bool() |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] ServiceOptions::async_write(self:Self, writer : W) -> Unit raise {
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(274UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(264UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) enum MethodOptions_IdempotencyLevel {
  IDEMPOTENCY_UNKNOWN
  NO_SIDE_EFFECTS
  IDEMPOTENT
} derive(Eq, Show)
pub fn MethodOptions_IdempotencyLevel::to_enum(self : MethodOptions_IdempotencyLevel) -> @protobuf.Enum {
  match self {
    MethodOptions_IdempotencyLevel::IDEMPOTENCY_UNKNOWN => 0
    MethodOptions_IdempotencyLevel::NO_SIDE_EFFECTS => 1
    MethodOptions_IdempotencyLevel::IDEMPOTENT => 2
  }
}
pub fn MethodOptions_IdempotencyLevel::from_enum(i : @protobuf.Enum) -> MethodOptions_IdempotencyLevel {
  match i.inner() {
    0 => MethodOptions_IdempotencyLevel::IDEMPOTENCY_UNKNOWN
    1 => MethodOptions_IdempotencyLevel::NO_SIDE_EFFECTS
    2 => MethodOptions_IdempotencyLevel::IDEMPOTENT
    _ => Default::default()
  }
}
pub impl Default for MethodOptions_IdempotencyLevel with default() -> MethodOptions_IdempotencyLevel {
  MethodOptions_IdempotencyLevel::IDEMPOTENCY_UNKNOWN
}
pub impl @protobuf.Sized for MethodOptions_IdempotencyLevel with size_of(self : MethodOptions_IdempotencyLevel) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for MethodOptions_IdempotencyLevel with from_json(json: Json, path: @json.JsonPath) -> MethodOptions_IdempotencyLevel raise {
  match json {
    String("IDEMPOTENCY_UNKNOWN") => MethodOptions_IdempotencyLevel::IDEMPOTENCY_UNKNOWN
    String("NO_SIDE_EFFECTS") => MethodOptions_IdempotencyLevel::NO_SIDE_EFFECTS
    String("IDEMPOTENT") => MethodOptions_IdempotencyLevel::IDEMPOTENT
    Number(0, ..) => MethodOptions_IdempotencyLevel::IDEMPOTENCY_UNKNOWN
    Number(1, ..) => MethodOptions_IdempotencyLevel::NO_SIDE_EFFECTS
    Number(2, ..) => MethodOptions_IdempotencyLevel::IDEMPOTENT
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for MethodOptions_IdempotencyLevel with to_json(self : MethodOptions_IdempotencyLevel) -> Json {
  match self {
    MethodOptions_IdempotencyLevel::IDEMPOTENCY_UNKNOWN => "IDEMPOTENCY_UNKNOWN"
    MethodOptions_IdempotencyLevel::NO_SIDE_EFFECTS => "NO_SIDE_EFFECTS"
    MethodOptions_IdempotencyLevel::IDEMPOTENT => "IDEMPOTENT"
  }
}
pub(all) struct MethodOptions {
  mut deprecated : Bool?
  mut idempotency_level : MethodOptions_IdempotencyLevel?
  mut features : FeatureSet?
  mut uninterpreted_option : Array[UninterpretedOption]
} derive(Eq, Show)
pub impl @protobuf.Sized for MethodOptions with size_of(self) {
  let mut size = 0U
  match self.deprecated {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.idempotency_level {
    Some(v) => size += 2U + @protobuf.size_of(v)
    None => ()
  }
  match self.features {
    Some(v) => size += 2U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.uninterpreted_option.iter().map(@protobuf.size_of).map(s => 2U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for MethodOptions with default() -> MethodOptions {
  MethodOptions::{
    deprecated : Some(false),
    idempotency_level : Some(MethodOptions_IdempotencyLevel::IDEMPOTENCY_UNKNOWN),
    features : None,
    uninterpreted_option : [],
  }
}
pub  fn[R: @protobuf.Reader] MethodOptions::read(reader : R) -> MethodOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  MethodOptions::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] MethodOptions::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> MethodOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = MethodOptions::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (33, _) => msg.deprecated = reader |> @protobuf.read_bool() |> Some
      (34, _) => msg.idempotency_level = reader |> @protobuf.read_enum() |> MethodOptions_IdempotencyLevel::from_enum |> Some
      (35, _) => msg.features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] MethodOptions::write(self:Self, writer : W) -> Unit raise {
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.write_varint(264UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
  match self.idempotency_level {
    Some(v) => {
      writer |> @protobuf.write_varint(272UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.write_varint(282UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.write_varint(7994UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for MethodOptions with to_json(self) {
  let json: Map[String, Json] = {}
  match self.deprecated {
      Some(v) if v != false => json["deprecated"] = v.to_json()
      _ => ()
    }
  match self.idempotency_level {
      Some(v) if v != MethodOptions_IdempotencyLevel::IDEMPOTENCY_UNKNOWN => json["idempotencyLevel"] = v.to_json()
      _ => ()
    }
  match self.features {
      Some(v) => json["features"] = v.to_json()
      _ => ()
    }
  if self.uninterpreted_option != Default::default() {
  json["uninterpretedOption"] = self.uninterpreted_option.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for MethodOptions with from_json(json: Json, path: @json.JsonPath) -> MethodOptions raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for MethodOptions"))
  }
  let message = MethodOptions::default()
  for key, value in obj {
    match (key, value) {
      ("deprecated", value) => message.deprecated = Some(@json.from_json(value, path~))
      ("idempotencyLevel", value) => message.idempotency_level = Some(@json.from_json(value, path~))
      ("features", value) => message.features = Some(@json.from_json(value, path~))
      ("uninterpretedOption", Array(value)) => message.uninterpreted_option = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] MethodOptions::async_read(reader : R) -> MethodOptions raise {
  let reader = @protobuf.LimitedReader::new(reader)
  MethodOptions::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] MethodOptions::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> MethodOptions raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = MethodOptions::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (33, _) => msg.deprecated = reader |> @protobuf.async_read_bool() |> Some
      (34, _) => msg.idempotency_level = reader |> @protobuf.async_read_enum() |> MethodOptions_IdempotencyLevel::from_enum |> Some
      (35, _) => msg.features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (999, _) => msg.uninterpreted_option.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption::default()
    } else {
      UninterpretedOption::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] MethodOptions::async_write(self:Self, writer : W) -> Unit raise {
  match self.deprecated {
    Some(v) => {
      writer |> @protobuf.async_write_varint(264UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
  match self.idempotency_level {
    Some(v) => {
      writer |> @protobuf.async_write_varint(272UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(282UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.uninterpreted_option {
    writer |> @protobuf.async_write_varint(7994UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) struct UninterpretedOption_NamePart {
  mut name_part : String
  mut is_extension : Bool
} derive(Eq, Show)
pub impl @protobuf.Sized for UninterpretedOption_NamePart with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.name_part); @protobuf.size_of(size) + size }
  size += 1U + @protobuf.size_of(self.is_extension)
  size
}
pub impl Default for UninterpretedOption_NamePart with default() -> UninterpretedOption_NamePart {
  UninterpretedOption_NamePart::{
    name_part : String::default(),
    is_extension : Bool::default(),
  }
}
pub  fn[R: @protobuf.Reader] UninterpretedOption_NamePart::read(reader : R) -> UninterpretedOption_NamePart raise {
  let reader = @protobuf.LimitedReader::new(reader)
  UninterpretedOption_NamePart::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] UninterpretedOption_NamePart::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> UninterpretedOption_NamePart raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = UninterpretedOption_NamePart::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name_part = reader |> @protobuf.read_string()
      (2, _) => msg.is_extension = reader |> @protobuf.read_bool()
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
pub  fn[W: @protobuf.Writer] UninterpretedOption_NamePart::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.name_part)
  writer |> @protobuf.write_varint(16UL);
  writer |> @protobuf.write_bool(self.is_extension)
}
pub impl ToJson for UninterpretedOption_NamePart with to_json(self) {
  let json: Map[String, Json] = {}
  if self.name_part != Default::default() {
  json["namePart"] = self.name_part.to_json()
  }
  if self.is_extension != Default::default() {
  json["isExtension"] = self.is_extension.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for UninterpretedOption_NamePart with from_json(json: Json, path: @json.JsonPath) -> UninterpretedOption_NamePart raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for UninterpretedOption_NamePart"))
  }
  let message = UninterpretedOption_NamePart::default()
  for key, value in obj {
    match (key, value) {
      ("namePart", value) => message.name_part = @json.from_json(value, path~)
      ("isExtension", value) => message.is_extension = @json.from_json(value, path~)
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] UninterpretedOption_NamePart::async_read(reader : R) -> UninterpretedOption_NamePart raise {
  let reader = @protobuf.LimitedReader::new(reader)
  UninterpretedOption_NamePart::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] UninterpretedOption_NamePart::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> UninterpretedOption_NamePart raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = UninterpretedOption_NamePart::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name_part = reader |> @protobuf.async_read_string()
      (2, _) => msg.is_extension = reader |> @protobuf.async_read_bool()
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
pub async fn[W: @protobuf.AsyncWriter] UninterpretedOption_NamePart::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.name_part)
  writer |> @protobuf.async_write_varint(16UL);
  writer |> @protobuf.async_write_bool(self.is_extension)
}
pub(all) struct UninterpretedOption {
  mut name : Array[UninterpretedOption_NamePart]
  mut identifier_value : String?
  mut positive_int_value : UInt64?
  mut negative_int_value : Int64?
  mut double_value : Double?
  mut string_value : Bytes?
  mut aggregate_value : String?
} derive(Eq, Show)
pub impl @protobuf.Sized for UninterpretedOption with size_of(self) {
  let mut size = 0U
  size += self.name.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.identifier_value {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.positive_int_value {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.negative_int_value {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.double_value {
    Some(v) => size += 1U + 8U
    None => ()
  }
  match self.string_value {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.aggregate_value {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for UninterpretedOption with default() -> UninterpretedOption {
  UninterpretedOption::{
    name : [],
    identifier_value : None,
    positive_int_value : None,
    negative_int_value : None,
    double_value : None,
    string_value : None,
    aggregate_value : None,
  }
}
pub  fn[R: @protobuf.Reader] UninterpretedOption::read(reader : R) -> UninterpretedOption raise {
  let reader = @protobuf.LimitedReader::new(reader)
  UninterpretedOption::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] UninterpretedOption::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> UninterpretedOption raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = UninterpretedOption::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (2, _) => msg.name.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      UninterpretedOption_NamePart::default()
    } else {
      UninterpretedOption_NamePart::read_with_limit(reader, limit=len)
    }
  })
      (3, _) => msg.identifier_value = reader |> @protobuf.read_string() |> Some
      (4, _) => msg.positive_int_value = reader |> @protobuf.read_uint64() |> Some
      (5, _) => msg.negative_int_value = reader |> @protobuf.read_int64() |> Some
      (6, _) => msg.double_value = reader |> @protobuf.read_double() |> Some
      (7, _) => msg.string_value = reader |> @protobuf.read_bytes() |> Some
      (8, _) => msg.aggregate_value = reader |> @protobuf.read_string() |> Some
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
pub  fn[W: @protobuf.Writer] UninterpretedOption::write(self:Self, writer : W) -> Unit raise {
  for item in self.name {
    writer |> @protobuf.write_varint(18UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.identifier_value {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.positive_int_value {
    Some(v) => {
      writer |> @protobuf.write_varint(32UL);
      writer |> @protobuf.write_uint64(v)

    }
    None => ()
  }
  match self.negative_int_value {
    Some(v) => {
      writer |> @protobuf.write_varint(40UL);
      writer |> @protobuf.write_int64(v)

    }
    None => ()
  }
  match self.double_value {
    Some(v) => {
      writer |> @protobuf.write_varint(49UL);
      writer |> @protobuf.write_double(v)

    }
    None => ()
  }
  match self.string_value {
    Some(v) => {
      writer |> @protobuf.write_varint(58UL);
      writer |> @protobuf.write_bytes(v)

    }
    None => ()
  }
  match self.aggregate_value {
    Some(v) => {
      writer |> @protobuf.write_varint(66UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
}
pub impl ToJson for UninterpretedOption with to_json(self) {
  let json: Map[String, Json] = {}
  if self.name != Default::default() {
  json["name"] = self.name.to_json()
  }
  match self.identifier_value {
      Some(v) => json["identifierValue"] = v.to_json()
      _ => ()
    }
  match self.positive_int_value {
      Some(v) => json["positiveIntValue"] = v.to_json()
      _ => ()
    }
  match self.negative_int_value {
      Some(v) => json["negativeIntValue"] = v.to_json()
      _ => ()
    }
  match self.double_value {
      Some(v) => json["doubleValue"] = v.to_json()
      _ => ()
    }
  match self.string_value {
      Some(v) => json["stringValue"] = @protobuf.base64_encode(v).to_json()
      _ => ()
    }
  match self.aggregate_value {
      Some(v) => json["aggregateValue"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for UninterpretedOption with from_json(json: Json, path: @json.JsonPath) -> UninterpretedOption raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for UninterpretedOption"))
  }
  let message = UninterpretedOption::default()
  for key, value in obj {
    match (key, value) {
      ("name", Array(value)) => message.name = value.map(v => 
@json.from_json(v, path~))
      ("identifierValue", value) => message.identifier_value = Some(@json.from_json(value, path~))
      ("positiveIntValue", value) => message.positive_int_value = Some(@json.from_json(value, path~))
      ("negativeIntValue", value) => message.negative_int_value = Some(@json.from_json(value, path~))
      ("doubleValue", value) => message.double_value = Some(@json.from_json(value, path~))
      ("stringValue", String(value)) => message.string_value = Some(@protobuf.base64_decode(value))
      ("aggregateValue", value) => message.aggregate_value = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] UninterpretedOption::async_read(reader : R) -> UninterpretedOption raise {
  let reader = @protobuf.LimitedReader::new(reader)
  UninterpretedOption::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] UninterpretedOption::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> UninterpretedOption raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = UninterpretedOption::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (2, _) => msg.name.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      UninterpretedOption_NamePart::default()
    } else {
      UninterpretedOption_NamePart::async_read_with_limit(reader, limit=len)
    }
  })
      (3, _) => msg.identifier_value = reader |> @protobuf.async_read_string() |> Some
      (4, _) => msg.positive_int_value = reader |> @protobuf.async_read_uint64() |> Some
      (5, _) => msg.negative_int_value = reader |> @protobuf.async_read_int64() |> Some
      (6, _) => msg.double_value = reader |> @protobuf.async_read_double() |> Some
      (7, _) => msg.string_value = reader |> @protobuf.async_read_bytes() |> Some
      (8, _) => msg.aggregate_value = reader |> @protobuf.async_read_string() |> Some
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
pub async fn[W: @protobuf.AsyncWriter] UninterpretedOption::async_write(self:Self, writer : W) -> Unit raise {
  for item in self.name {
    writer |> @protobuf.async_write_varint(18UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.identifier_value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.positive_int_value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL);
      writer |> @protobuf.async_write_uint64(v)

    }
    None => ()
  }
  match self.negative_int_value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(40UL);
      writer |> @protobuf.async_write_int64(v)

    }
    None => ()
  }
  match self.double_value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(49UL);
      writer |> @protobuf.async_write_double(v)

    }
    None => ()
  }
  match self.string_value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(58UL);
      writer |> @protobuf.async_write_bytes(v)

    }
    None => ()
  }
  match self.aggregate_value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(66UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
}
pub(all) enum FeatureSet_FieldPresence {
  FIELD_PRESENCE_UNKNOWN
  EXPLICIT
  IMPLICIT
  LEGACY_REQUIRED
} derive(Eq, Show)
pub fn FeatureSet_FieldPresence::to_enum(self : FeatureSet_FieldPresence) -> @protobuf.Enum {
  match self {
    FeatureSet_FieldPresence::FIELD_PRESENCE_UNKNOWN => 0
    FeatureSet_FieldPresence::EXPLICIT => 1
    FeatureSet_FieldPresence::IMPLICIT => 2
    FeatureSet_FieldPresence::LEGACY_REQUIRED => 3
  }
}
pub fn FeatureSet_FieldPresence::from_enum(i : @protobuf.Enum) -> FeatureSet_FieldPresence {
  match i.inner() {
    0 => FeatureSet_FieldPresence::FIELD_PRESENCE_UNKNOWN
    1 => FeatureSet_FieldPresence::EXPLICIT
    2 => FeatureSet_FieldPresence::IMPLICIT
    3 => FeatureSet_FieldPresence::LEGACY_REQUIRED
    _ => Default::default()
  }
}
pub impl Default for FeatureSet_FieldPresence with default() -> FeatureSet_FieldPresence {
  FeatureSet_FieldPresence::FIELD_PRESENCE_UNKNOWN
}
pub impl @protobuf.Sized for FeatureSet_FieldPresence with size_of(self : FeatureSet_FieldPresence) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FeatureSet_FieldPresence with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_FieldPresence raise {
  match json {
    String("FIELD_PRESENCE_UNKNOWN") => FeatureSet_FieldPresence::FIELD_PRESENCE_UNKNOWN
    String("EXPLICIT") => FeatureSet_FieldPresence::EXPLICIT
    String("IMPLICIT") => FeatureSet_FieldPresence::IMPLICIT
    String("LEGACY_REQUIRED") => FeatureSet_FieldPresence::LEGACY_REQUIRED
    Number(0, ..) => FeatureSet_FieldPresence::FIELD_PRESENCE_UNKNOWN
    Number(1, ..) => FeatureSet_FieldPresence::EXPLICIT
    Number(2, ..) => FeatureSet_FieldPresence::IMPLICIT
    Number(3, ..) => FeatureSet_FieldPresence::LEGACY_REQUIRED
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FeatureSet_FieldPresence with to_json(self : FeatureSet_FieldPresence) -> Json {
  match self {
    FeatureSet_FieldPresence::FIELD_PRESENCE_UNKNOWN => "FIELD_PRESENCE_UNKNOWN"
    FeatureSet_FieldPresence::EXPLICIT => "EXPLICIT"
    FeatureSet_FieldPresence::IMPLICIT => "IMPLICIT"
    FeatureSet_FieldPresence::LEGACY_REQUIRED => "LEGACY_REQUIRED"
  }
}
pub(all) enum FeatureSet_EnumType {
  ENUM_TYPE_UNKNOWN
  OPEN
  CLOSED
} derive(Eq, Show)
pub fn FeatureSet_EnumType::to_enum(self : FeatureSet_EnumType) -> @protobuf.Enum {
  match self {
    FeatureSet_EnumType::ENUM_TYPE_UNKNOWN => 0
    FeatureSet_EnumType::OPEN => 1
    FeatureSet_EnumType::CLOSED => 2
  }
}
pub fn FeatureSet_EnumType::from_enum(i : @protobuf.Enum) -> FeatureSet_EnumType {
  match i.inner() {
    0 => FeatureSet_EnumType::ENUM_TYPE_UNKNOWN
    1 => FeatureSet_EnumType::OPEN
    2 => FeatureSet_EnumType::CLOSED
    _ => Default::default()
  }
}
pub impl Default for FeatureSet_EnumType with default() -> FeatureSet_EnumType {
  FeatureSet_EnumType::ENUM_TYPE_UNKNOWN
}
pub impl @protobuf.Sized for FeatureSet_EnumType with size_of(self : FeatureSet_EnumType) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FeatureSet_EnumType with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_EnumType raise {
  match json {
    String("ENUM_TYPE_UNKNOWN") => FeatureSet_EnumType::ENUM_TYPE_UNKNOWN
    String("OPEN") => FeatureSet_EnumType::OPEN
    String("CLOSED") => FeatureSet_EnumType::CLOSED
    Number(0, ..) => FeatureSet_EnumType::ENUM_TYPE_UNKNOWN
    Number(1, ..) => FeatureSet_EnumType::OPEN
    Number(2, ..) => FeatureSet_EnumType::CLOSED
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FeatureSet_EnumType with to_json(self : FeatureSet_EnumType) -> Json {
  match self {
    FeatureSet_EnumType::ENUM_TYPE_UNKNOWN => "ENUM_TYPE_UNKNOWN"
    FeatureSet_EnumType::OPEN => "OPEN"
    FeatureSet_EnumType::CLOSED => "CLOSED"
  }
}
pub(all) enum FeatureSet_RepeatedFieldEncoding {
  REPEATED_FIELD_ENCODING_UNKNOWN
  PACKED
  EXPANDED
} derive(Eq, Show)
pub fn FeatureSet_RepeatedFieldEncoding::to_enum(self : FeatureSet_RepeatedFieldEncoding) -> @protobuf.Enum {
  match self {
    FeatureSet_RepeatedFieldEncoding::REPEATED_FIELD_ENCODING_UNKNOWN => 0
    FeatureSet_RepeatedFieldEncoding::PACKED => 1
    FeatureSet_RepeatedFieldEncoding::EXPANDED => 2
  }
}
pub fn FeatureSet_RepeatedFieldEncoding::from_enum(i : @protobuf.Enum) -> FeatureSet_RepeatedFieldEncoding {
  match i.inner() {
    0 => FeatureSet_RepeatedFieldEncoding::REPEATED_FIELD_ENCODING_UNKNOWN
    1 => FeatureSet_RepeatedFieldEncoding::PACKED
    2 => FeatureSet_RepeatedFieldEncoding::EXPANDED
    _ => Default::default()
  }
}
pub impl Default for FeatureSet_RepeatedFieldEncoding with default() -> FeatureSet_RepeatedFieldEncoding {
  FeatureSet_RepeatedFieldEncoding::REPEATED_FIELD_ENCODING_UNKNOWN
}
pub impl @protobuf.Sized for FeatureSet_RepeatedFieldEncoding with size_of(self : FeatureSet_RepeatedFieldEncoding) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FeatureSet_RepeatedFieldEncoding with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_RepeatedFieldEncoding raise {
  match json {
    String("REPEATED_FIELD_ENCODING_UNKNOWN") => FeatureSet_RepeatedFieldEncoding::REPEATED_FIELD_ENCODING_UNKNOWN
    String("PACKED") => FeatureSet_RepeatedFieldEncoding::PACKED
    String("EXPANDED") => FeatureSet_RepeatedFieldEncoding::EXPANDED
    Number(0, ..) => FeatureSet_RepeatedFieldEncoding::REPEATED_FIELD_ENCODING_UNKNOWN
    Number(1, ..) => FeatureSet_RepeatedFieldEncoding::PACKED
    Number(2, ..) => FeatureSet_RepeatedFieldEncoding::EXPANDED
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FeatureSet_RepeatedFieldEncoding with to_json(self : FeatureSet_RepeatedFieldEncoding) -> Json {
  match self {
    FeatureSet_RepeatedFieldEncoding::REPEATED_FIELD_ENCODING_UNKNOWN => "REPEATED_FIELD_ENCODING_UNKNOWN"
    FeatureSet_RepeatedFieldEncoding::PACKED => "PACKED"
    FeatureSet_RepeatedFieldEncoding::EXPANDED => "EXPANDED"
  }
}
pub(all) enum FeatureSet_Utf8Validation {
  UTF8_VALIDATION_UNKNOWN
  VERIFY
  NONE
} derive(Eq, Show)
pub fn FeatureSet_Utf8Validation::to_enum(self : FeatureSet_Utf8Validation) -> @protobuf.Enum {
  match self {
    FeatureSet_Utf8Validation::UTF8_VALIDATION_UNKNOWN => 0
    FeatureSet_Utf8Validation::VERIFY => 2
    FeatureSet_Utf8Validation::NONE => 3
  }
}
pub fn FeatureSet_Utf8Validation::from_enum(i : @protobuf.Enum) -> FeatureSet_Utf8Validation {
  match i.inner() {
    0 => FeatureSet_Utf8Validation::UTF8_VALIDATION_UNKNOWN
    2 => FeatureSet_Utf8Validation::VERIFY
    3 => FeatureSet_Utf8Validation::NONE
    _ => Default::default()
  }
}
pub impl Default for FeatureSet_Utf8Validation with default() -> FeatureSet_Utf8Validation {
  FeatureSet_Utf8Validation::UTF8_VALIDATION_UNKNOWN
}
pub impl @protobuf.Sized for FeatureSet_Utf8Validation with size_of(self : FeatureSet_Utf8Validation) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FeatureSet_Utf8Validation with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_Utf8Validation raise {
  match json {
    String("UTF8_VALIDATION_UNKNOWN") => FeatureSet_Utf8Validation::UTF8_VALIDATION_UNKNOWN
    String("VERIFY") => FeatureSet_Utf8Validation::VERIFY
    String("NONE") => FeatureSet_Utf8Validation::NONE
    Number(0, ..) => FeatureSet_Utf8Validation::UTF8_VALIDATION_UNKNOWN
    Number(2, ..) => FeatureSet_Utf8Validation::VERIFY
    Number(3, ..) => FeatureSet_Utf8Validation::NONE
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FeatureSet_Utf8Validation with to_json(self : FeatureSet_Utf8Validation) -> Json {
  match self {
    FeatureSet_Utf8Validation::UTF8_VALIDATION_UNKNOWN => "UTF8_VALIDATION_UNKNOWN"
    FeatureSet_Utf8Validation::VERIFY => "VERIFY"
    FeatureSet_Utf8Validation::NONE => "NONE"
  }
}
pub(all) enum FeatureSet_MessageEncoding {
  MESSAGE_ENCODING_UNKNOWN
  LENGTH_PREFIXED
  DELIMITED
} derive(Eq, Show)
pub fn FeatureSet_MessageEncoding::to_enum(self : FeatureSet_MessageEncoding) -> @protobuf.Enum {
  match self {
    FeatureSet_MessageEncoding::MESSAGE_ENCODING_UNKNOWN => 0
    FeatureSet_MessageEncoding::LENGTH_PREFIXED => 1
    FeatureSet_MessageEncoding::DELIMITED => 2
  }
}
pub fn FeatureSet_MessageEncoding::from_enum(i : @protobuf.Enum) -> FeatureSet_MessageEncoding {
  match i.inner() {
    0 => FeatureSet_MessageEncoding::MESSAGE_ENCODING_UNKNOWN
    1 => FeatureSet_MessageEncoding::LENGTH_PREFIXED
    2 => FeatureSet_MessageEncoding::DELIMITED
    _ => Default::default()
  }
}
pub impl Default for FeatureSet_MessageEncoding with default() -> FeatureSet_MessageEncoding {
  FeatureSet_MessageEncoding::MESSAGE_ENCODING_UNKNOWN
}
pub impl @protobuf.Sized for FeatureSet_MessageEncoding with size_of(self : FeatureSet_MessageEncoding) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FeatureSet_MessageEncoding with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_MessageEncoding raise {
  match json {
    String("MESSAGE_ENCODING_UNKNOWN") => FeatureSet_MessageEncoding::MESSAGE_ENCODING_UNKNOWN
    String("LENGTH_PREFIXED") => FeatureSet_MessageEncoding::LENGTH_PREFIXED
    String("DELIMITED") => FeatureSet_MessageEncoding::DELIMITED
    Number(0, ..) => FeatureSet_MessageEncoding::MESSAGE_ENCODING_UNKNOWN
    Number(1, ..) => FeatureSet_MessageEncoding::LENGTH_PREFIXED
    Number(2, ..) => FeatureSet_MessageEncoding::DELIMITED
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FeatureSet_MessageEncoding with to_json(self : FeatureSet_MessageEncoding) -> Json {
  match self {
    FeatureSet_MessageEncoding::MESSAGE_ENCODING_UNKNOWN => "MESSAGE_ENCODING_UNKNOWN"
    FeatureSet_MessageEncoding::LENGTH_PREFIXED => "LENGTH_PREFIXED"
    FeatureSet_MessageEncoding::DELIMITED => "DELIMITED"
  }
}
pub(all) enum FeatureSet_JsonFormat {
  JSON_FORMAT_UNKNOWN
  ALLOW
  LEGACY_BEST_EFFORT
} derive(Eq, Show)
pub fn FeatureSet_JsonFormat::to_enum(self : FeatureSet_JsonFormat) -> @protobuf.Enum {
  match self {
    FeatureSet_JsonFormat::JSON_FORMAT_UNKNOWN => 0
    FeatureSet_JsonFormat::ALLOW => 1
    FeatureSet_JsonFormat::LEGACY_BEST_EFFORT => 2
  }
}
pub fn FeatureSet_JsonFormat::from_enum(i : @protobuf.Enum) -> FeatureSet_JsonFormat {
  match i.inner() {
    0 => FeatureSet_JsonFormat::JSON_FORMAT_UNKNOWN
    1 => FeatureSet_JsonFormat::ALLOW
    2 => FeatureSet_JsonFormat::LEGACY_BEST_EFFORT
    _ => Default::default()
  }
}
pub impl Default for FeatureSet_JsonFormat with default() -> FeatureSet_JsonFormat {
  FeatureSet_JsonFormat::JSON_FORMAT_UNKNOWN
}
pub impl @protobuf.Sized for FeatureSet_JsonFormat with size_of(self : FeatureSet_JsonFormat) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FeatureSet_JsonFormat with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_JsonFormat raise {
  match json {
    String("JSON_FORMAT_UNKNOWN") => FeatureSet_JsonFormat::JSON_FORMAT_UNKNOWN
    String("ALLOW") => FeatureSet_JsonFormat::ALLOW
    String("LEGACY_BEST_EFFORT") => FeatureSet_JsonFormat::LEGACY_BEST_EFFORT
    Number(0, ..) => FeatureSet_JsonFormat::JSON_FORMAT_UNKNOWN
    Number(1, ..) => FeatureSet_JsonFormat::ALLOW
    Number(2, ..) => FeatureSet_JsonFormat::LEGACY_BEST_EFFORT
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FeatureSet_JsonFormat with to_json(self : FeatureSet_JsonFormat) -> Json {
  match self {
    FeatureSet_JsonFormat::JSON_FORMAT_UNKNOWN => "JSON_FORMAT_UNKNOWN"
    FeatureSet_JsonFormat::ALLOW => "ALLOW"
    FeatureSet_JsonFormat::LEGACY_BEST_EFFORT => "LEGACY_BEST_EFFORT"
  }
}
pub(all) enum FeatureSet_EnforceNamingStyle {
  ENFORCE_NAMING_STYLE_UNKNOWN
  STYLE2024
  STYLE_LEGACY
} derive(Eq, Show)
pub fn FeatureSet_EnforceNamingStyle::to_enum(self : FeatureSet_EnforceNamingStyle) -> @protobuf.Enum {
  match self {
    FeatureSet_EnforceNamingStyle::ENFORCE_NAMING_STYLE_UNKNOWN => 0
    FeatureSet_EnforceNamingStyle::STYLE2024 => 1
    FeatureSet_EnforceNamingStyle::STYLE_LEGACY => 2
  }
}
pub fn FeatureSet_EnforceNamingStyle::from_enum(i : @protobuf.Enum) -> FeatureSet_EnforceNamingStyle {
  match i.inner() {
    0 => FeatureSet_EnforceNamingStyle::ENFORCE_NAMING_STYLE_UNKNOWN
    1 => FeatureSet_EnforceNamingStyle::STYLE2024
    2 => FeatureSet_EnforceNamingStyle::STYLE_LEGACY
    _ => Default::default()
  }
}
pub impl Default for FeatureSet_EnforceNamingStyle with default() -> FeatureSet_EnforceNamingStyle {
  FeatureSet_EnforceNamingStyle::ENFORCE_NAMING_STYLE_UNKNOWN
}
pub impl @protobuf.Sized for FeatureSet_EnforceNamingStyle with size_of(self : FeatureSet_EnforceNamingStyle) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FeatureSet_EnforceNamingStyle with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_EnforceNamingStyle raise {
  match json {
    String("ENFORCE_NAMING_STYLE_UNKNOWN") => FeatureSet_EnforceNamingStyle::ENFORCE_NAMING_STYLE_UNKNOWN
    String("STYLE2024") => FeatureSet_EnforceNamingStyle::STYLE2024
    String("STYLE_LEGACY") => FeatureSet_EnforceNamingStyle::STYLE_LEGACY
    Number(0, ..) => FeatureSet_EnforceNamingStyle::ENFORCE_NAMING_STYLE_UNKNOWN
    Number(1, ..) => FeatureSet_EnforceNamingStyle::STYLE2024
    Number(2, ..) => FeatureSet_EnforceNamingStyle::STYLE_LEGACY
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FeatureSet_EnforceNamingStyle with to_json(self : FeatureSet_EnforceNamingStyle) -> Json {
  match self {
    FeatureSet_EnforceNamingStyle::ENFORCE_NAMING_STYLE_UNKNOWN => "ENFORCE_NAMING_STYLE_UNKNOWN"
    FeatureSet_EnforceNamingStyle::STYLE2024 => "STYLE2024"
    FeatureSet_EnforceNamingStyle::STYLE_LEGACY => "STYLE_LEGACY"
  }
}
pub(all) enum FeatureSet_VisibilityFeature_DefaultSymbolVisibility {
  DEFAULT_SYMBOL_VISIBILITY_UNKNOWN
  EXPORT_ALL
  EXPORT_TOP_LEVEL
  LOCAL_ALL
  STRICT
} derive(Eq, Show)
pub fn FeatureSet_VisibilityFeature_DefaultSymbolVisibility::to_enum(self : FeatureSet_VisibilityFeature_DefaultSymbolVisibility) -> @protobuf.Enum {
  match self {
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::DEFAULT_SYMBOL_VISIBILITY_UNKNOWN => 0
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_ALL => 1
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_TOP_LEVEL => 2
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::LOCAL_ALL => 3
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::STRICT => 4
  }
}
pub fn FeatureSet_VisibilityFeature_DefaultSymbolVisibility::from_enum(i : @protobuf.Enum) -> FeatureSet_VisibilityFeature_DefaultSymbolVisibility {
  match i.inner() {
    0 => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::DEFAULT_SYMBOL_VISIBILITY_UNKNOWN
    1 => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_ALL
    2 => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_TOP_LEVEL
    3 => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::LOCAL_ALL
    4 => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::STRICT
    _ => Default::default()
  }
}
pub impl Default for FeatureSet_VisibilityFeature_DefaultSymbolVisibility with default() -> FeatureSet_VisibilityFeature_DefaultSymbolVisibility {
  FeatureSet_VisibilityFeature_DefaultSymbolVisibility::DEFAULT_SYMBOL_VISIBILITY_UNKNOWN
}
pub impl @protobuf.Sized for FeatureSet_VisibilityFeature_DefaultSymbolVisibility with size_of(self : FeatureSet_VisibilityFeature_DefaultSymbolVisibility) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for FeatureSet_VisibilityFeature_DefaultSymbolVisibility with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_VisibilityFeature_DefaultSymbolVisibility raise {
  match json {
    String("DEFAULT_SYMBOL_VISIBILITY_UNKNOWN") => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::DEFAULT_SYMBOL_VISIBILITY_UNKNOWN
    String("EXPORT_ALL") => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_ALL
    String("EXPORT_TOP_LEVEL") => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_TOP_LEVEL
    String("LOCAL_ALL") => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::LOCAL_ALL
    String("STRICT") => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::STRICT
    Number(0, ..) => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::DEFAULT_SYMBOL_VISIBILITY_UNKNOWN
    Number(1, ..) => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_ALL
    Number(2, ..) => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_TOP_LEVEL
    Number(3, ..) => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::LOCAL_ALL
    Number(4, ..) => FeatureSet_VisibilityFeature_DefaultSymbolVisibility::STRICT
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for FeatureSet_VisibilityFeature_DefaultSymbolVisibility with to_json(self : FeatureSet_VisibilityFeature_DefaultSymbolVisibility) -> Json {
  match self {
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::DEFAULT_SYMBOL_VISIBILITY_UNKNOWN => "DEFAULT_SYMBOL_VISIBILITY_UNKNOWN"
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_ALL => "EXPORT_ALL"
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::EXPORT_TOP_LEVEL => "EXPORT_TOP_LEVEL"
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::LOCAL_ALL => "LOCAL_ALL"
    FeatureSet_VisibilityFeature_DefaultSymbolVisibility::STRICT => "STRICT"
  }
}
pub(all) struct FeatureSet_VisibilityFeature {
} derive(Eq, Show)
pub impl @protobuf.Sized for FeatureSet_VisibilityFeature with size_of(_) {
  0
}
pub impl Default for FeatureSet_VisibilityFeature with default() -> FeatureSet_VisibilityFeature {
  FeatureSet_VisibilityFeature::{
  }
}
pub  fn[R] FeatureSet_VisibilityFeature::read(reader : R) -> FeatureSet_VisibilityFeature noraise {
  let reader = @protobuf.LimitedReader::new(reader)
  FeatureSet_VisibilityFeature::read_with_limit(reader)
}
pub  fn[R] FeatureSet_VisibilityFeature::read_with_limit(_ : @protobuf.LimitedReader[R], _limit ?: Int) -> FeatureSet_VisibilityFeature noraise {
  FeatureSet_VisibilityFeature::default()
}
pub  fn[W: @protobuf.Writer] FeatureSet_VisibilityFeature::write(_: Self, _ : W) -> Unit noraise {
}
pub impl ToJson for FeatureSet_VisibilityFeature with to_json(_) {
  {}
}
pub impl @json.FromJson for FeatureSet_VisibilityFeature with from_json(json: Json, path: @json.JsonPath) -> FeatureSet_VisibilityFeature noraise {
  FeatureSet_VisibilityFeature::default()
}
pub async fn[R] FeatureSet_VisibilityFeature::async_read(reader : R) -> FeatureSet_VisibilityFeature noraise {
  let reader = @protobuf.LimitedReader::new(reader)
  FeatureSet_VisibilityFeature::async_read_with_limit(reader)
}
pub async fn[R] FeatureSet_VisibilityFeature::async_read_with_limit(_ : @protobuf.LimitedReader[R], _limit ?: Int) -> FeatureSet_VisibilityFeature noraise {
  FeatureSet_VisibilityFeature::default()
}
pub async fn[W: @protobuf.AsyncWriter] FeatureSet_VisibilityFeature::async_write(_: Self, _ : W) -> Unit noraise {
}
pub(all) struct FeatureSet {
  mut field_presence : FeatureSet_FieldPresence?
  mut enum_type : FeatureSet_EnumType?
  mut repeated_field_encoding : FeatureSet_RepeatedFieldEncoding?
  mut utf8_validation : FeatureSet_Utf8Validation?
  mut message_encoding : FeatureSet_MessageEncoding?
  mut json_format : FeatureSet_JsonFormat?
  mut enforce_naming_style : FeatureSet_EnforceNamingStyle?
  mut default_symbol_visibility : FeatureSet_VisibilityFeature_DefaultSymbolVisibility?
} derive(Eq, Show)
pub impl @protobuf.Sized for FeatureSet with size_of(self) {
  let mut size = 0U
  match self.field_presence {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.enum_type {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.repeated_field_encoding {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.utf8_validation {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.message_encoding {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.json_format {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.enforce_naming_style {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.default_symbol_visibility {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for FeatureSet with default() -> FeatureSet {
  FeatureSet::{
    field_presence : None,
    enum_type : None,
    repeated_field_encoding : None,
    utf8_validation : None,
    message_encoding : None,
    json_format : None,
    enforce_naming_style : None,
    default_symbol_visibility : None,
  }
}
pub  fn[R: @protobuf.Reader] FeatureSet::read(reader : R) -> FeatureSet raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FeatureSet::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FeatureSet::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FeatureSet raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FeatureSet::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.field_presence = reader |> @protobuf.read_enum() |> FeatureSet_FieldPresence::from_enum |> Some
      (2, _) => msg.enum_type = reader |> @protobuf.read_enum() |> FeatureSet_EnumType::from_enum |> Some
      (3, _) => msg.repeated_field_encoding = reader |> @protobuf.read_enum() |> FeatureSet_RepeatedFieldEncoding::from_enum |> Some
      (4, _) => msg.utf8_validation = reader |> @protobuf.read_enum() |> FeatureSet_Utf8Validation::from_enum |> Some
      (5, _) => msg.message_encoding = reader |> @protobuf.read_enum() |> FeatureSet_MessageEncoding::from_enum |> Some
      (6, _) => msg.json_format = reader |> @protobuf.read_enum() |> FeatureSet_JsonFormat::from_enum |> Some
      (7, _) => msg.enforce_naming_style = reader |> @protobuf.read_enum() |> FeatureSet_EnforceNamingStyle::from_enum |> Some
      (8, _) => msg.default_symbol_visibility = reader |> @protobuf.read_enum() |> FeatureSet_VisibilityFeature_DefaultSymbolVisibility::from_enum |> Some
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
pub  fn[W: @protobuf.Writer] FeatureSet::write(self:Self, writer : W) -> Unit raise {
  match self.field_presence {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.enum_type {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.repeated_field_encoding {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.utf8_validation {
    Some(v) => {
      writer |> @protobuf.write_varint(32UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.message_encoding {
    Some(v) => {
      writer |> @protobuf.write_varint(40UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.json_format {
    Some(v) => {
      writer |> @protobuf.write_varint(48UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.enforce_naming_style {
    Some(v) => {
      writer |> @protobuf.write_varint(56UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.default_symbol_visibility {
    Some(v) => {
      writer |> @protobuf.write_varint(64UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
}
pub impl ToJson for FeatureSet with to_json(self) {
  let json: Map[String, Json] = {}
  match self.field_presence {
      Some(v) => json["fieldPresence"] = v.to_json()
      _ => ()
    }
  match self.enum_type {
      Some(v) => json["enumType"] = v.to_json()
      _ => ()
    }
  match self.repeated_field_encoding {
      Some(v) => json["repeatedFieldEncoding"] = v.to_json()
      _ => ()
    }
  match self.utf8_validation {
      Some(v) => json["utf8Validation"] = v.to_json()
      _ => ()
    }
  match self.message_encoding {
      Some(v) => json["messageEncoding"] = v.to_json()
      _ => ()
    }
  match self.json_format {
      Some(v) => json["jsonFormat"] = v.to_json()
      _ => ()
    }
  match self.enforce_naming_style {
      Some(v) => json["enforceNamingStyle"] = v.to_json()
      _ => ()
    }
  match self.default_symbol_visibility {
      Some(v) => json["defaultSymbolVisibility"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for FeatureSet with from_json(json: Json, path: @json.JsonPath) -> FeatureSet raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FeatureSet"))
  }
  let message = FeatureSet::default()
  for key, value in obj {
    match (key, value) {
      ("fieldPresence", value) => message.field_presence = Some(@json.from_json(value, path~))
      ("enumType", value) => message.enum_type = Some(@json.from_json(value, path~))
      ("repeatedFieldEncoding", value) => message.repeated_field_encoding = Some(@json.from_json(value, path~))
      ("utf8Validation", value) => message.utf8_validation = Some(@json.from_json(value, path~))
      ("messageEncoding", value) => message.message_encoding = Some(@json.from_json(value, path~))
      ("jsonFormat", value) => message.json_format = Some(@json.from_json(value, path~))
      ("enforceNamingStyle", value) => message.enforce_naming_style = Some(@json.from_json(value, path~))
      ("defaultSymbolVisibility", value) => message.default_symbol_visibility = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FeatureSet::async_read(reader : R) -> FeatureSet raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FeatureSet::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FeatureSet::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FeatureSet raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FeatureSet::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.field_presence = reader |> @protobuf.async_read_enum() |> FeatureSet_FieldPresence::from_enum |> Some
      (2, _) => msg.enum_type = reader |> @protobuf.async_read_enum() |> FeatureSet_EnumType::from_enum |> Some
      (3, _) => msg.repeated_field_encoding = reader |> @protobuf.async_read_enum() |> FeatureSet_RepeatedFieldEncoding::from_enum |> Some
      (4, _) => msg.utf8_validation = reader |> @protobuf.async_read_enum() |> FeatureSet_Utf8Validation::from_enum |> Some
      (5, _) => msg.message_encoding = reader |> @protobuf.async_read_enum() |> FeatureSet_MessageEncoding::from_enum |> Some
      (6, _) => msg.json_format = reader |> @protobuf.async_read_enum() |> FeatureSet_JsonFormat::from_enum |> Some
      (7, _) => msg.enforce_naming_style = reader |> @protobuf.async_read_enum() |> FeatureSet_EnforceNamingStyle::from_enum |> Some
      (8, _) => msg.default_symbol_visibility = reader |> @protobuf.async_read_enum() |> FeatureSet_VisibilityFeature_DefaultSymbolVisibility::from_enum |> Some
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
pub async fn[W: @protobuf.AsyncWriter] FeatureSet::async_write(self:Self, writer : W) -> Unit raise {
  match self.field_presence {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.enum_type {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.repeated_field_encoding {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.utf8_validation {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.message_encoding {
    Some(v) => {
      writer |> @protobuf.async_write_varint(40UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.json_format {
    Some(v) => {
      writer |> @protobuf.async_write_varint(48UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.enforce_naming_style {
    Some(v) => {
      writer |> @protobuf.async_write_varint(56UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.default_symbol_visibility {
    Some(v) => {
      writer |> @protobuf.async_write_varint(64UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
}
pub(all) struct FeatureSetDefaults_FeatureSetEditionDefault {
  mut edition : Edition?
  mut overridable_features : FeatureSet?
  mut fixed_features : FeatureSet?
} derive(Eq, Show)
pub impl @protobuf.Sized for FeatureSetDefaults_FeatureSetEditionDefault with size_of(self) {
  let mut size = 0U
  match self.edition {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.overridable_features {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.fixed_features {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for FeatureSetDefaults_FeatureSetEditionDefault with default() -> FeatureSetDefaults_FeatureSetEditionDefault {
  FeatureSetDefaults_FeatureSetEditionDefault::{
    edition : None,
    overridable_features : None,
    fixed_features : None,
  }
}
pub  fn[R: @protobuf.Reader] FeatureSetDefaults_FeatureSetEditionDefault::read(reader : R) -> FeatureSetDefaults_FeatureSetEditionDefault raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FeatureSetDefaults_FeatureSetEditionDefault::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FeatureSetDefaults_FeatureSetEditionDefault::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FeatureSetDefaults_FeatureSetEditionDefault raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FeatureSetDefaults_FeatureSetEditionDefault::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (3, _) => msg.edition = reader |> @protobuf.read_enum() |> Edition::from_enum |> Some
      (4, _) => msg.overridable_features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
    }
  } |> Some
      (5, _) => msg.fixed_features =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::read_with_limit(reader, limit=len)
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
pub  fn[W: @protobuf.Writer] FeatureSetDefaults_FeatureSetEditionDefault::write(self:Self, writer : W) -> Unit raise {
  match self.edition {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.overridable_features {
    Some(v) => {
      writer |> @protobuf.write_varint(34UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.fixed_features {
    Some(v) => {
      writer |> @protobuf.write_varint(42UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
}
pub impl ToJson for FeatureSetDefaults_FeatureSetEditionDefault with to_json(self) {
  let json: Map[String, Json] = {}
  match self.edition {
      Some(v) => json["edition"] = v.to_json()
      _ => ()
    }
  match self.overridable_features {
      Some(v) => json["overridableFeatures"] = v.to_json()
      _ => ()
    }
  match self.fixed_features {
      Some(v) => json["fixedFeatures"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for FeatureSetDefaults_FeatureSetEditionDefault with from_json(json: Json, path: @json.JsonPath) -> FeatureSetDefaults_FeatureSetEditionDefault raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FeatureSetDefaults_FeatureSetEditionDefault"))
  }
  let message = FeatureSetDefaults_FeatureSetEditionDefault::default()
  for key, value in obj {
    match (key, value) {
      ("edition", value) => message.edition = Some(@json.from_json(value, path~))
      ("overridableFeatures", value) => message.overridable_features = Some(@json.from_json(value, path~))
      ("fixedFeatures", value) => message.fixed_features = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FeatureSetDefaults_FeatureSetEditionDefault::async_read(reader : R) -> FeatureSetDefaults_FeatureSetEditionDefault raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FeatureSetDefaults_FeatureSetEditionDefault::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FeatureSetDefaults_FeatureSetEditionDefault::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FeatureSetDefaults_FeatureSetEditionDefault raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FeatureSetDefaults_FeatureSetEditionDefault::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (3, _) => msg.edition = reader |> @protobuf.async_read_enum() |> Edition::from_enum |> Some
      (4, _) => msg.overridable_features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (5, _) => msg.fixed_features =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSet::default()
    } else {
      FeatureSet::async_read_with_limit(reader, limit=len)
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
pub async fn[W: @protobuf.AsyncWriter] FeatureSetDefaults_FeatureSetEditionDefault::async_write(self:Self, writer : W) -> Unit raise {
  match self.edition {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.overridable_features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(34UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.fixed_features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(42UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
}
pub(all) struct FeatureSetDefaults {
  mut defaults : Array[FeatureSetDefaults_FeatureSetEditionDefault]
  mut minimum_edition : Edition?
  mut maximum_edition : Edition?
} derive(Eq, Show)
pub impl @protobuf.Sized for FeatureSetDefaults with size_of(self) {
  let mut size = 0U
  size += self.defaults.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.minimum_edition {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.maximum_edition {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for FeatureSetDefaults with default() -> FeatureSetDefaults {
  FeatureSetDefaults::{
    defaults : [],
    minimum_edition : None,
    maximum_edition : None,
  }
}
pub  fn[R: @protobuf.Reader] FeatureSetDefaults::read(reader : R) -> FeatureSetDefaults raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FeatureSetDefaults::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] FeatureSetDefaults::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FeatureSetDefaults raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FeatureSetDefaults::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.defaults.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      FeatureSetDefaults_FeatureSetEditionDefault::default()
    } else {
      FeatureSetDefaults_FeatureSetEditionDefault::read_with_limit(reader, limit=len)
    }
  })
      (4, _) => msg.minimum_edition = reader |> @protobuf.read_enum() |> Edition::from_enum |> Some
      (5, _) => msg.maximum_edition = reader |> @protobuf.read_enum() |> Edition::from_enum |> Some
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
pub  fn[W: @protobuf.Writer] FeatureSetDefaults::write(self:Self, writer : W) -> Unit raise {
  for item in self.defaults {
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.minimum_edition {
    Some(v) => {
      writer |> @protobuf.write_varint(32UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
  match self.maximum_edition {
    Some(v) => {
      writer |> @protobuf.write_varint(40UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
}
pub impl ToJson for FeatureSetDefaults with to_json(self) {
  let json: Map[String, Json] = {}
  if self.defaults != Default::default() {
  json["defaults"] = self.defaults.to_json()
  }
  match self.minimum_edition {
      Some(v) => json["minimumEdition"] = v.to_json()
      _ => ()
    }
  match self.maximum_edition {
      Some(v) => json["maximumEdition"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for FeatureSetDefaults with from_json(json: Json, path: @json.JsonPath) -> FeatureSetDefaults raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for FeatureSetDefaults"))
  }
  let message = FeatureSetDefaults::default()
  for key, value in obj {
    match (key, value) {
      ("defaults", Array(value)) => message.defaults = value.map(v => 
@json.from_json(v, path~))
      ("minimumEdition", value) => message.minimum_edition = Some(@json.from_json(value, path~))
      ("maximumEdition", value) => message.maximum_edition = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] FeatureSetDefaults::async_read(reader : R) -> FeatureSetDefaults raise {
  let reader = @protobuf.LimitedReader::new(reader)
  FeatureSetDefaults::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] FeatureSetDefaults::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> FeatureSetDefaults raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = FeatureSetDefaults::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.defaults.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      FeatureSetDefaults_FeatureSetEditionDefault::default()
    } else {
      FeatureSetDefaults_FeatureSetEditionDefault::async_read_with_limit(reader, limit=len)
    }
  })
      (4, _) => msg.minimum_edition = reader |> @protobuf.async_read_enum() |> Edition::from_enum |> Some
      (5, _) => msg.maximum_edition = reader |> @protobuf.async_read_enum() |> Edition::from_enum |> Some
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
pub async fn[W: @protobuf.AsyncWriter] FeatureSetDefaults::async_write(self:Self, writer : W) -> Unit raise {
  for item in self.defaults {
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.minimum_edition {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
  match self.maximum_edition {
    Some(v) => {
      writer |> @protobuf.async_write_varint(40UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
}
pub(all) struct SourceCodeInfo_Location {
  mut path : Array[Int]
  mut span : Array[Int]
  mut leading_comments : String?
  mut trailing_comments : String?
  mut leading_detached_comments : Array[String]
} derive(Eq, Show)
pub impl @protobuf.Sized for SourceCodeInfo_Location with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = self.path.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add); @protobuf.size_of(size) + size }
  size += 1U + { let size = self.span.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add); @protobuf.size_of(size) + size }
  match self.leading_comments {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.trailing_comments {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.leading_detached_comments.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for SourceCodeInfo_Location with default() -> SourceCodeInfo_Location {
  SourceCodeInfo_Location::{
    path : [],
    span : [],
    leading_comments : None,
    trailing_comments : None,
    leading_detached_comments : [],
  }
}
pub  fn[R: @protobuf.Reader] SourceCodeInfo_Location::read(reader : R) -> SourceCodeInfo_Location raise {
  let reader = @protobuf.LimitedReader::new(reader)
  SourceCodeInfo_Location::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] SourceCodeInfo_Location::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> SourceCodeInfo_Location raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = SourceCodeInfo_Location::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => { msg.path.push_iter((reader |> @protobuf.read_packed(@protobuf.read_int32, None)).iter()) }
      (2, _) => { msg.span.push_iter((reader |> @protobuf.read_packed(@protobuf.read_int32, None)).iter()) }
      (3, _) => msg.leading_comments = reader |> @protobuf.read_string() |> Some
      (4, _) => msg.trailing_comments = reader |> @protobuf.read_string() |> Some
      (6, _) => msg.leading_detached_comments.push(reader |> @protobuf.read_string())
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
pub  fn[W: @protobuf.Writer] SourceCodeInfo_Location::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL)
  let size = self.path.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)
  writer |> @protobuf.write_uint32(size)
  for item in self.path {
      writer |> @protobuf.write_int32(item)

  }
  writer |> @protobuf.write_varint(18UL)
  let size = self.span.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)
  writer |> @protobuf.write_uint32(size)
  for item in self.span {
      writer |> @protobuf.write_int32(item)

  }
  match self.leading_comments {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.trailing_comments {
    Some(v) => {
      writer |> @protobuf.write_varint(34UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  for item in self.leading_detached_comments {
    writer |> @protobuf.write_varint(50UL)
    writer |> @protobuf.write_string(item)

  }
}
pub impl ToJson for SourceCodeInfo_Location with to_json(self) {
  let json: Map[String, Json] = {}
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  if self.span != Default::default() {
  json["span"] = self.span.to_json()
  }
  match self.leading_comments {
      Some(v) => json["leadingComments"] = v.to_json()
      _ => ()
    }
  match self.trailing_comments {
      Some(v) => json["trailingComments"] = v.to_json()
      _ => ()
    }
  if self.leading_detached_comments != Default::default() {
  json["leadingDetachedComments"] = self.leading_detached_comments.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for SourceCodeInfo_Location with from_json(json: Json, path: @json.JsonPath) -> SourceCodeInfo_Location raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for SourceCodeInfo_Location"))
  }
  let message = SourceCodeInfo_Location::default()
  for key, value in obj {
    match (key, value) {
      ("path", Array(value)) => message.path = value.map(v => 
@json.from_json(v, path~))
      ("span", Array(value)) => message.span = value.map(v => 
@json.from_json(v, path~))
      ("leadingComments", value) => message.leading_comments = Some(@json.from_json(value, path~))
      ("trailingComments", value) => message.trailing_comments = Some(@json.from_json(value, path~))
      ("leadingDetachedComments", Array(value)) => message.leading_detached_comments = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] SourceCodeInfo_Location::async_read(reader : R) -> SourceCodeInfo_Location raise {
  let reader = @protobuf.LimitedReader::new(reader)
  SourceCodeInfo_Location::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] SourceCodeInfo_Location::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> SourceCodeInfo_Location raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = SourceCodeInfo_Location::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => { msg.path.push_iter((reader |> @protobuf.async_read_packed(@protobuf.async_read_int32, None)).iter()) }
      (2, _) => { msg.span.push_iter((reader |> @protobuf.async_read_packed(@protobuf.async_read_int32, None)).iter()) }
      (3, _) => msg.leading_comments = reader |> @protobuf.async_read_string() |> Some
      (4, _) => msg.trailing_comments = reader |> @protobuf.async_read_string() |> Some
      (6, _) => msg.leading_detached_comments.push(reader |> @protobuf.async_read_string())
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
pub async fn[W: @protobuf.AsyncWriter] SourceCodeInfo_Location::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL)
  let size = self.path.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)
  writer |> @protobuf.async_write_uint32(size)
  for item in self.path {
      writer |> @protobuf.async_write_int32(item)

  }
  writer |> @protobuf.async_write_varint(18UL)
  let size = self.span.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)
  writer |> @protobuf.async_write_uint32(size)
  for item in self.span {
      writer |> @protobuf.async_write_int32(item)

  }
  match self.leading_comments {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.trailing_comments {
    Some(v) => {
      writer |> @protobuf.async_write_varint(34UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  for item in self.leading_detached_comments {
    writer |> @protobuf.async_write_varint(50UL)
    writer |> @protobuf.async_write_string(item)

  }
}
pub(all) struct SourceCodeInfo {
  mut location : Array[SourceCodeInfo_Location]
} derive(Eq, Show)
pub impl @protobuf.Sized for SourceCodeInfo with size_of(self) {
  let mut size = 0U
  size += self.location.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for SourceCodeInfo with default() -> SourceCodeInfo {
  SourceCodeInfo::{
    location : [],
  }
}
pub  fn[R: @protobuf.Reader] SourceCodeInfo::read(reader : R) -> SourceCodeInfo raise {
  let reader = @protobuf.LimitedReader::new(reader)
  SourceCodeInfo::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] SourceCodeInfo::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> SourceCodeInfo raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = SourceCodeInfo::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.location.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      SourceCodeInfo_Location::default()
    } else {
      SourceCodeInfo_Location::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] SourceCodeInfo::write(self:Self, writer : W) -> Unit raise {
  for item in self.location {
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for SourceCodeInfo with to_json(self) {
  let json: Map[String, Json] = {}
  if self.location != Default::default() {
  json["location"] = self.location.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for SourceCodeInfo with from_json(json: Json, path: @json.JsonPath) -> SourceCodeInfo raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for SourceCodeInfo"))
  }
  let message = SourceCodeInfo::default()
  for key, value in obj {
    match (key, value) {
      ("location", Array(value)) => message.location = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] SourceCodeInfo::async_read(reader : R) -> SourceCodeInfo raise {
  let reader = @protobuf.LimitedReader::new(reader)
  SourceCodeInfo::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] SourceCodeInfo::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> SourceCodeInfo raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = SourceCodeInfo::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.location.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      SourceCodeInfo_Location::default()
    } else {
      SourceCodeInfo_Location::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] SourceCodeInfo::async_write(self:Self, writer : W) -> Unit raise {
  for item in self.location {
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
pub(all) enum GeneratedCodeInfo_Annotation_Semantic {
  NONE
  SET
  ALIAS
} derive(Eq, Show)
pub fn GeneratedCodeInfo_Annotation_Semantic::to_enum(self : GeneratedCodeInfo_Annotation_Semantic) -> @protobuf.Enum {
  match self {
    GeneratedCodeInfo_Annotation_Semantic::NONE => 0
    GeneratedCodeInfo_Annotation_Semantic::SET => 1
    GeneratedCodeInfo_Annotation_Semantic::ALIAS => 2
  }
}
pub fn GeneratedCodeInfo_Annotation_Semantic::from_enum(i : @protobuf.Enum) -> GeneratedCodeInfo_Annotation_Semantic {
  match i.inner() {
    0 => GeneratedCodeInfo_Annotation_Semantic::NONE
    1 => GeneratedCodeInfo_Annotation_Semantic::SET
    2 => GeneratedCodeInfo_Annotation_Semantic::ALIAS
    _ => Default::default()
  }
}
pub impl Default for GeneratedCodeInfo_Annotation_Semantic with default() -> GeneratedCodeInfo_Annotation_Semantic {
  GeneratedCodeInfo_Annotation_Semantic::NONE
}
pub impl @protobuf.Sized for GeneratedCodeInfo_Annotation_Semantic with size_of(self : GeneratedCodeInfo_Annotation_Semantic) {
  @protobuf.Sized::size_of(self.to_enum())
}
pub impl @json.FromJson for GeneratedCodeInfo_Annotation_Semantic with from_json(json: Json, path: @json.JsonPath) -> GeneratedCodeInfo_Annotation_Semantic raise {
  match json {
    String("NONE") => GeneratedCodeInfo_Annotation_Semantic::NONE
    String("SET") => GeneratedCodeInfo_Annotation_Semantic::SET
    String("ALIAS") => GeneratedCodeInfo_Annotation_Semantic::ALIAS
    Number(0, ..) => GeneratedCodeInfo_Annotation_Semantic::NONE
    Number(1, ..) => GeneratedCodeInfo_Annotation_Semantic::SET
    Number(2, ..) => GeneratedCodeInfo_Annotation_Semantic::ALIAS
    _ =>  raise @json.JsonDecodeError((path, "Expected a number or string for enum"))
  }
}
pub impl ToJson for GeneratedCodeInfo_Annotation_Semantic with to_json(self : GeneratedCodeInfo_Annotation_Semantic) -> Json {
  match self {
    GeneratedCodeInfo_Annotation_Semantic::NONE => "NONE"
    GeneratedCodeInfo_Annotation_Semantic::SET => "SET"
    GeneratedCodeInfo_Annotation_Semantic::ALIAS => "ALIAS"
  }
}
pub(all) struct GeneratedCodeInfo_Annotation {
  mut path : Array[Int]
  mut source_file : String?
  mut begin : Int?
  mut end : Int?
  mut semantic : GeneratedCodeInfo_Annotation_Semantic?
} derive(Eq, Show)
pub impl @protobuf.Sized for GeneratedCodeInfo_Annotation with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = self.path.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add); @protobuf.size_of(size) + size }
  match self.source_file {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.begin {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.end {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.semantic {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for GeneratedCodeInfo_Annotation with default() -> GeneratedCodeInfo_Annotation {
  GeneratedCodeInfo_Annotation::{
    path : [],
    source_file : None,
    begin : None,
    end : None,
    semantic : None,
  }
}
pub  fn[R: @protobuf.Reader] GeneratedCodeInfo_Annotation::read(reader : R) -> GeneratedCodeInfo_Annotation raise {
  let reader = @protobuf.LimitedReader::new(reader)
  GeneratedCodeInfo_Annotation::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] GeneratedCodeInfo_Annotation::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> GeneratedCodeInfo_Annotation raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = GeneratedCodeInfo_Annotation::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => { msg.path.push_iter((reader |> @protobuf.read_packed(@protobuf.read_int32, None)).iter()) }
      (2, _) => msg.source_file = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.begin = reader |> @protobuf.read_int32() |> Some
      (4, _) => msg.end = reader |> @protobuf.read_int32() |> Some
      (5, _) => msg.semantic = reader |> @protobuf.read_enum() |> GeneratedCodeInfo_Annotation_Semantic::from_enum |> Some
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
pub  fn[W: @protobuf.Writer] GeneratedCodeInfo_Annotation::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL)
  let size = self.path.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)
  writer |> @protobuf.write_uint32(size)
  for item in self.path {
      writer |> @protobuf.write_int32(item)

  }
  match self.source_file {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.begin {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.end {
    Some(v) => {
      writer |> @protobuf.write_varint(32UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.semantic {
    Some(v) => {
      writer |> @protobuf.write_varint(40UL);
      writer |> @protobuf.write_enum(v.to_enum())

    }
    None => ()
  }
}
pub impl ToJson for GeneratedCodeInfo_Annotation with to_json(self) {
  let json: Map[String, Json] = {}
  if self.path != Default::default() {
  json["path"] = self.path.to_json()
  }
  match self.source_file {
      Some(v) => json["sourceFile"] = v.to_json()
      _ => ()
    }
  match self.begin {
      Some(v) => json["begin"] = v.to_json()
      _ => ()
    }
  match self.end {
      Some(v) => json["end"] = v.to_json()
      _ => ()
    }
  match self.semantic {
      Some(v) => json["semantic"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for GeneratedCodeInfo_Annotation with from_json(json: Json, path: @json.JsonPath) -> GeneratedCodeInfo_Annotation raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for GeneratedCodeInfo_Annotation"))
  }
  let message = GeneratedCodeInfo_Annotation::default()
  for key, value in obj {
    match (key, value) {
      ("path", Array(value)) => message.path = value.map(v => 
@json.from_json(v, path~))
      ("sourceFile", value) => message.source_file = Some(@json.from_json(value, path~))
      ("begin", value) => message.begin = Some(@json.from_json(value, path~))
      ("end", value) => message.end = Some(@json.from_json(value, path~))
      ("semantic", value) => message.semantic = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] GeneratedCodeInfo_Annotation::async_read(reader : R) -> GeneratedCodeInfo_Annotation raise {
  let reader = @protobuf.LimitedReader::new(reader)
  GeneratedCodeInfo_Annotation::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] GeneratedCodeInfo_Annotation::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> GeneratedCodeInfo_Annotation raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = GeneratedCodeInfo_Annotation::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => { msg.path.push_iter((reader |> @protobuf.async_read_packed(@protobuf.async_read_int32, None)).iter()) }
      (2, _) => msg.source_file = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.begin = reader |> @protobuf.async_read_int32() |> Some
      (4, _) => msg.end = reader |> @protobuf.async_read_int32() |> Some
      (5, _) => msg.semantic = reader |> @protobuf.async_read_enum() |> GeneratedCodeInfo_Annotation_Semantic::from_enum |> Some
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
pub async fn[W: @protobuf.AsyncWriter] GeneratedCodeInfo_Annotation::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL)
  let size = self.path.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)
  writer |> @protobuf.async_write_uint32(size)
  for item in self.path {
      writer |> @protobuf.async_write_int32(item)

  }
  match self.source_file {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.begin {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.end {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.semantic {
    Some(v) => {
      writer |> @protobuf.async_write_varint(40UL);
      writer |> @protobuf.async_write_enum(v.to_enum())

    }
    None => ()
  }
}
pub(all) struct GeneratedCodeInfo {
  mut annotation : Array[GeneratedCodeInfo_Annotation]
} derive(Eq, Show)
pub impl @protobuf.Sized for GeneratedCodeInfo with size_of(self) {
  let mut size = 0U
  size += self.annotation.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for GeneratedCodeInfo with default() -> GeneratedCodeInfo {
  GeneratedCodeInfo::{
    annotation : [],
  }
}
pub  fn[R: @protobuf.Reader] GeneratedCodeInfo::read(reader : R) -> GeneratedCodeInfo raise {
  let reader = @protobuf.LimitedReader::new(reader)
  GeneratedCodeInfo::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] GeneratedCodeInfo::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> GeneratedCodeInfo raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = GeneratedCodeInfo::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.annotation.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      GeneratedCodeInfo_Annotation::default()
    } else {
      GeneratedCodeInfo_Annotation::read_with_limit(reader, limit=len)
    }
  })
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
pub  fn[W: @protobuf.Writer] GeneratedCodeInfo::write(self:Self, writer : W) -> Unit raise {
  for item in self.annotation {
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
}
pub impl ToJson for GeneratedCodeInfo with to_json(self) {
  let json: Map[String, Json] = {}
  if self.annotation != Default::default() {
  json["annotation"] = self.annotation.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for GeneratedCodeInfo with from_json(json: Json, path: @json.JsonPath) -> GeneratedCodeInfo raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for GeneratedCodeInfo"))
  }
  let message = GeneratedCodeInfo::default()
  for key, value in obj {
    match (key, value) {
      ("annotation", Array(value)) => message.annotation = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub async fn[R: @protobuf.AsyncReader] GeneratedCodeInfo::async_read(reader : R) -> GeneratedCodeInfo raise {
  let reader = @protobuf.LimitedReader::new(reader)
  GeneratedCodeInfo::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] GeneratedCodeInfo::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> GeneratedCodeInfo raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = GeneratedCodeInfo::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.annotation.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      GeneratedCodeInfo_Annotation::default()
    } else {
      GeneratedCodeInfo_Annotation::async_read_with_limit(reader, limit=len)
    }
  })
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
pub async fn[W: @protobuf.AsyncWriter] GeneratedCodeInfo::async_write(self:Self, writer : W) -> Unit raise {
  for item in self.annotation {
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
