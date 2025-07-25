///|
pub(all) struct Version {
  mut major : Int?
  mut minor : Int?
  mut patch : Int?
  mut suffix : String?
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for Version with size_of(self) {
  let mut size = 0U
  match self.major {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.minor {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.patch {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.suffix {
    Some(v) =>
      size += 1U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  size
}

///|
pub impl Default for Version with default() -> Version {
  Version::{ major: None, minor: None, patch: None, suffix: None }
}

///|
pub fn[R : @protobuf.Reader] Version::read(reader : R) -> Version raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Version::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] Version::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> Version raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = Version::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.major = reader |> @protobuf.read_int32() |> Some
        (2, _) => msg.minor = reader |> @protobuf.read_int32() |> Some
        (3, _) => msg.patch = reader |> @protobuf.read_int32() |> Some
        (4, _) => msg.suffix = reader |> @protobuf.read_string() |> Some
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
pub fn[W : @protobuf.Writer] Version::write(
  self : Self,
  writer : W,
) -> Unit raise {
  match self.major {
    Some(v) => {
      writer |> @protobuf.write_varint(8UL)
      writer |> @protobuf.write_int32(v)
    }
    None => ()
  }
  match self.minor {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL)
      writer |> @protobuf.write_int32(v)
    }
    None => ()
  }
  match self.patch {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL)
      writer |> @protobuf.write_int32(v)
    }
    None => ()
  }
  match self.suffix {
    Some(v) => {
      writer |> @protobuf.write_varint(34UL)
      writer |> @protobuf.write_string(v)
    }
    None => ()
  }
}

///|
pub impl ToJson for Version with to_json(self) {
  let json : Map[String, Json] = {}
  match self.major {
    Some(v) => json["major"] = v.to_json()
    _ => ()
  }
  match self.minor {
    Some(v) => json["minor"] = v.to_json()
    _ => ()
  }
  match self.patch {
    Some(v) => json["patch"] = v.to_json()
    _ => ()
  }
  match self.suffix {
    Some(v) => json["suffix"] = v.to_json()
    _ => ()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for Version with from_json(
  json : Json,
  path : @json.JsonPath,
) -> Version raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Version"))
  }
  let message = Version::default()
  for key, value in obj {
    match (key, value) {
      ("major", value) => message.major = Some(@json.from_json(value, path~))
      ("minor", value) => message.minor = Some(@json.from_json(value, path~))
      ("patch", value) => message.patch = Some(@json.from_json(value, path~))
      ("suffix", value) => message.suffix = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] Version::async_read(
  reader : R,
) -> Version raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Version::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] Version::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> Version raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = Version::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) => msg.major = reader |> @protobuf.async_read_int32() |> Some
        (2, _) => msg.minor = reader |> @protobuf.async_read_int32() |> Some
        (3, _) => msg.patch = reader |> @protobuf.async_read_int32() |> Some
        (4, _) => msg.suffix = reader |> @protobuf.async_read_string() |> Some
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
pub async fn[W : @protobuf.AsyncWriter] Version::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  match self.major {
    Some(v) => {
      writer |> @protobuf.async_write_varint(8UL)
      writer |> @protobuf.async_write_int32(v)
    }
    None => ()
  }
  match self.minor {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL)
      writer |> @protobuf.async_write_int32(v)
    }
    None => ()
  }
  match self.patch {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL)
      writer |> @protobuf.async_write_int32(v)
    }
    None => ()
  }
  match self.suffix {
    Some(v) => {
      writer |> @protobuf.async_write_varint(34UL)
      writer |> @protobuf.async_write_string(v)
    }
    None => ()
  }
}

///|
pub(all) struct CodeGeneratorRequest {
  mut file_to_generate : Array[String]
  mut parameter : String?
  mut proto_file : Array[@protobuf1.FileDescriptorProto]
  mut source_file_descriptors : Array[@protobuf1.FileDescriptorProto]
  mut compiler_version : Version?
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for CodeGeneratorRequest with size_of(self) {
  let mut size = 0U
  size += self.file_to_generate
    .iter()
    .map(@protobuf.size_of)
    .map(s => 1U + @protobuf.size_of(s) + s)
    .fold(init=0U, UInt::op_add)
  match self.parameter {
    Some(v) =>
      size += 1U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  size += self.proto_file
    .iter()
    .map(@protobuf.size_of)
    .map(s => 1U + @protobuf.size_of(s) + s)
    .fold(init=0U, UInt::op_add)
  size += self.source_file_descriptors
    .iter()
    .map(@protobuf.size_of)
    .map(s => 2U + @protobuf.size_of(s) + s)
    .fold(init=0U, UInt::op_add)
  match self.compiler_version {
    Some(v) =>
      size += 1U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  size
}

///|
pub impl Default for CodeGeneratorRequest with default() -> CodeGeneratorRequest {
  CodeGeneratorRequest::{
    file_to_generate: [],
    parameter: None,
    proto_file: [],
    source_file_descriptors: [],
    compiler_version: None,
  }
}

///|
pub fn[R : @protobuf.Reader] CodeGeneratorRequest::read(
  reader : R,
) -> CodeGeneratorRequest raise {
  let reader = @protobuf.LimitedReader::new(reader)
  CodeGeneratorRequest::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] CodeGeneratorRequest::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> CodeGeneratorRequest raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = CodeGeneratorRequest::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.file_to_generate.push(reader |> @protobuf.read_string())
        (2, _) => msg.parameter = reader |> @protobuf.read_string() |> Some
        (15, _) =>
          msg.proto_file.push(
            {
              let len = reader |> @protobuf.read_int32()
              if len == 0 {
                @protobuf1.FileDescriptorProto::default()
              } else {
                @protobuf1.FileDescriptorProto::read_with_limit(
                  reader,
                  limit=len,
                )
              }
            },
          )
        (17, _) =>
          msg.source_file_descriptors.push(
            {
              let len = reader |> @protobuf.read_int32()
              if len == 0 {
                @protobuf1.FileDescriptorProto::default()
              } else {
                @protobuf1.FileDescriptorProto::read_with_limit(
                  reader,
                  limit=len,
                )
              }
            },
          )
        (3, _) =>
          msg.compiler_version = {
              let len = reader |> @protobuf.read_int32()
              if len == 0 {
                Version::default()
              } else {
                Version::read_with_limit(reader, limit=len)
              }
            }
            |> Some
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
pub fn[W : @protobuf.Writer] CodeGeneratorRequest::write(
  self : Self,
  writer : W,
) -> Unit raise {
  for item in self.file_to_generate {
    writer |> @protobuf.write_varint(10UL)
    writer |> @protobuf.write_string(item)
  }
  match self.parameter {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL)
      writer |> @protobuf.write_string(v)
    }
    None => ()
  }
  for item in self.proto_file {
    writer |> @protobuf.write_varint(122UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item))
    item.write(writer)
  }
  for item in self.source_file_descriptors {
    writer |> @protobuf.write_varint(138UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item))
    item.write(writer)
  }
  match self.compiler_version {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL)
      writer |> @protobuf.write_uint32(@protobuf.size_of(v))
      v.write(writer)
    }
    None => ()
  }
}

///|
pub impl ToJson for CodeGeneratorRequest with to_json(self) {
  let json : Map[String, Json] = {}
  if self.file_to_generate != Default::default() {
    json["fileToGenerate"] = self.file_to_generate.to_json()
  }
  match self.parameter {
    Some(v) => json["parameter"] = v.to_json()
    _ => ()
  }
  if self.proto_file != Default::default() {
    json["protoFile"] = self.proto_file.to_json()
  }
  if self.source_file_descriptors != Default::default() {
    json["sourceFileDescriptors"] = self.source_file_descriptors.to_json()
  }
  match self.compiler_version {
    Some(v) => json["compilerVersion"] = v.to_json()
    _ => ()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for CodeGeneratorRequest with from_json(
  json : Json,
  path : @json.JsonPath,
) -> CodeGeneratorRequest raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError(
      (path, "Expected an object for CodeGeneratorRequest"),
    )
  }
  let message = CodeGeneratorRequest::default()
  for key, value in obj {
    match (key, value) {
      ("fileToGenerate", Array(value)) =>
        message.file_to_generate = value.map(v => @json.from_json(v, path~))
      ("parameter", value) =>
        message.parameter = Some(@json.from_json(value, path~))
      ("protoFile", Array(value)) =>
        message.proto_file = value.map(v => @json.from_json(v, path~))
      ("sourceFileDescriptors", Array(value)) =>
        message.source_file_descriptors = value.map(v => @json.from_json(
          v,
          path~,
        ))
      ("compilerVersion", value) =>
        message.compiler_version = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] CodeGeneratorRequest::async_read(
  reader : R,
) -> CodeGeneratorRequest raise {
  let reader = @protobuf.LimitedReader::new(reader)
  CodeGeneratorRequest::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] CodeGeneratorRequest::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> CodeGeneratorRequest raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = CodeGeneratorRequest::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) =>
          msg.file_to_generate.push(reader |> @protobuf.async_read_string())
        (2, _) =>
          msg.parameter = reader |> @protobuf.async_read_string() |> Some
        (15, _) =>
          msg.proto_file.push(
            {
              let len = reader |> @protobuf.async_read_int32()
              if len == 0 {
                @protobuf1.FileDescriptorProto::default()
              } else {
                @protobuf1.FileDescriptorProto::async_read_with_limit(
                  reader,
                  limit=len,
                )
              }
            },
          )
        (17, _) =>
          msg.source_file_descriptors.push(
            {
              let len = reader |> @protobuf.async_read_int32()
              if len == 0 {
                @protobuf1.FileDescriptorProto::default()
              } else {
                @protobuf1.FileDescriptorProto::async_read_with_limit(
                  reader,
                  limit=len,
                )
              }
            },
          )
        (3, _) =>
          msg.compiler_version = {
              let len = reader |> @protobuf.async_read_int32()
              if len == 0 {
                Version::default()
              } else {
                Version::async_read_with_limit(reader, limit=len)
              }
            }
            |> Some
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
pub async fn[W : @protobuf.AsyncWriter] CodeGeneratorRequest::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  for item in self.file_to_generate {
    writer |> @protobuf.async_write_varint(10UL)
    writer |> @protobuf.async_write_string(item)
  }
  match self.parameter {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL)
      writer |> @protobuf.async_write_string(v)
    }
    None => ()
  }
  for item in self.proto_file {
    writer |> @protobuf.async_write_varint(122UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item))
    item.async_write(writer)
  }
  for item in self.source_file_descriptors {
    writer |> @protobuf.async_write_varint(138UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item))
    item.async_write(writer)
  }
  match self.compiler_version {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL)
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v))
      v.async_write(writer)
    }
    None => ()
  }
}

///|
pub(all) enum CodeGeneratorResponse_Feature {
  FEATURE_NONE
  FEATURE_PROTO3_OPTIONAL
  FEATURE_SUPPORTS_EDITIONS
} derive(Eq, Show)

///|
pub fn CodeGeneratorResponse_Feature::to_enum(
  self : CodeGeneratorResponse_Feature,
) -> @protobuf.Enum {
  match self {
    CodeGeneratorResponse_Feature::FEATURE_NONE => 0
    CodeGeneratorResponse_Feature::FEATURE_PROTO3_OPTIONAL => 1
    CodeGeneratorResponse_Feature::FEATURE_SUPPORTS_EDITIONS => 2
  }
}

///|
pub fn CodeGeneratorResponse_Feature::from_enum(
  i : @protobuf.Enum,
) -> CodeGeneratorResponse_Feature {
  match i.inner() {
    0 => CodeGeneratorResponse_Feature::FEATURE_NONE
    1 => CodeGeneratorResponse_Feature::FEATURE_PROTO3_OPTIONAL
    2 => CodeGeneratorResponse_Feature::FEATURE_SUPPORTS_EDITIONS
    _ => Default::default()
  }
}

///|
pub impl Default for CodeGeneratorResponse_Feature with default() -> CodeGeneratorResponse_Feature {
  CodeGeneratorResponse_Feature::FEATURE_NONE
}

///|
pub impl @protobuf.Sized for CodeGeneratorResponse_Feature with size_of(
  self : CodeGeneratorResponse_Feature,
) {
  @protobuf.Sized::size_of(self.to_enum())
}

///|
pub impl @json.FromJson for CodeGeneratorResponse_Feature with from_json(
  json : Json,
  path : @json.JsonPath,
) -> CodeGeneratorResponse_Feature raise {
  match json {
    String("FEATURE_NONE") => CodeGeneratorResponse_Feature::FEATURE_NONE
    String("FEATURE_PROTO3_OPTIONAL") =>
      CodeGeneratorResponse_Feature::FEATURE_PROTO3_OPTIONAL
    String("FEATURE_SUPPORTS_EDITIONS") =>
      CodeGeneratorResponse_Feature::FEATURE_SUPPORTS_EDITIONS
    Number(0, ..) => CodeGeneratorResponse_Feature::FEATURE_NONE
    Number(1, ..) => CodeGeneratorResponse_Feature::FEATURE_PROTO3_OPTIONAL
    Number(2, ..) => CodeGeneratorResponse_Feature::FEATURE_SUPPORTS_EDITIONS
    _ =>
      raise @json.JsonDecodeError(
        (path, "Expected a number or string for enum"),
      )
  }
}

///|
pub impl ToJson for CodeGeneratorResponse_Feature with to_json(
  self : CodeGeneratorResponse_Feature,
) -> Json {
  match self {
    CodeGeneratorResponse_Feature::FEATURE_NONE => "FEATURE_NONE"
    CodeGeneratorResponse_Feature::FEATURE_PROTO3_OPTIONAL =>
      "FEATURE_PROTO3_OPTIONAL"
    CodeGeneratorResponse_Feature::FEATURE_SUPPORTS_EDITIONS =>
      "FEATURE_SUPPORTS_EDITIONS"
  }
}

///|
pub(all) struct CodeGeneratorResponse_File {
  mut name : String?
  mut insertion_point : String?
  mut content : String?
  mut generated_code_info : @protobuf1.GeneratedCodeInfo?
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for CodeGeneratorResponse_File with size_of(self) {
  let mut size = 0U
  match self.name {
    Some(v) =>
      size += 1U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  match self.insertion_point {
    Some(v) =>
      size += 1U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  match self.content {
    Some(v) =>
      size += 1U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  match self.generated_code_info {
    Some(v) =>
      size += 2U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  size
}

///|
pub impl Default for CodeGeneratorResponse_File with default() -> CodeGeneratorResponse_File {
  CodeGeneratorResponse_File::{
    name: None,
    insertion_point: None,
    content: None,
    generated_code_info: None,
  }
}

///|
pub fn[R : @protobuf.Reader] CodeGeneratorResponse_File::read(
  reader : R,
) -> CodeGeneratorResponse_File raise {
  let reader = @protobuf.LimitedReader::new(reader)
  CodeGeneratorResponse_File::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] CodeGeneratorResponse_File::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> CodeGeneratorResponse_File raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = CodeGeneratorResponse_File::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.name = reader |> @protobuf.read_string() |> Some
        (2, _) =>
          msg.insertion_point = reader |> @protobuf.read_string() |> Some
        (15, _) => msg.content = reader |> @protobuf.read_string() |> Some
        (16, _) =>
          msg.generated_code_info = {
              let len = reader |> @protobuf.read_int32()
              if len == 0 {
                @protobuf1.GeneratedCodeInfo::default()
              } else {
                @protobuf1.GeneratedCodeInfo::read_with_limit(reader, limit=len)
              }
            }
            |> Some
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
pub fn[W : @protobuf.Writer] CodeGeneratorResponse_File::write(
  self : Self,
  writer : W,
) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL)
      writer |> @protobuf.write_string(v)
    }
    None => ()
  }
  match self.insertion_point {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL)
      writer |> @protobuf.write_string(v)
    }
    None => ()
  }
  match self.content {
    Some(v) => {
      writer |> @protobuf.write_varint(122UL)
      writer |> @protobuf.write_string(v)
    }
    None => ()
  }
  match self.generated_code_info {
    Some(v) => {
      writer |> @protobuf.write_varint(130UL)
      writer |> @protobuf.write_uint32(@protobuf.size_of(v))
      v.write(writer)
    }
    None => ()
  }
}

///|
pub impl ToJson for CodeGeneratorResponse_File with to_json(self) {
  let json : Map[String, Json] = {}
  match self.name {
    Some(v) => json["name"] = v.to_json()
    _ => ()
  }
  match self.insertion_point {
    Some(v) => json["insertionPoint"] = v.to_json()
    _ => ()
  }
  match self.content {
    Some(v) => json["content"] = v.to_json()
    _ => ()
  }
  match self.generated_code_info {
    Some(v) => json["generatedCodeInfo"] = v.to_json()
    _ => ()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for CodeGeneratorResponse_File with from_json(
  json : Json,
  path : @json.JsonPath,
) -> CodeGeneratorResponse_File raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError(
      (path, "Expected an object for CodeGeneratorResponse_File"),
    )
  }
  let message = CodeGeneratorResponse_File::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = Some(@json.from_json(value, path~))
      ("insertionPoint", value) =>
        message.insertion_point = Some(@json.from_json(value, path~))
      ("content", value) =>
        message.content = Some(@json.from_json(value, path~))
      ("generatedCodeInfo", value) =>
        message.generated_code_info = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] CodeGeneratorResponse_File::async_read(
  reader : R,
) -> CodeGeneratorResponse_File raise {
  let reader = @protobuf.LimitedReader::new(reader)
  CodeGeneratorResponse_File::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] CodeGeneratorResponse_File::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> CodeGeneratorResponse_File raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = CodeGeneratorResponse_File::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) => msg.name = reader |> @protobuf.async_read_string() |> Some
        (2, _) =>
          msg.insertion_point = reader |> @protobuf.async_read_string() |> Some
        (15, _) => msg.content = reader |> @protobuf.async_read_string() |> Some
        (16, _) =>
          msg.generated_code_info = {
              let len = reader |> @protobuf.async_read_int32()
              if len == 0 {
                @protobuf1.GeneratedCodeInfo::default()
              } else {
                @protobuf1.GeneratedCodeInfo::async_read_with_limit(
                  reader,
                  limit=len,
                )
              }
            }
            |> Some
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
pub async fn[W : @protobuf.AsyncWriter] CodeGeneratorResponse_File::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  match self.name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL)
      writer |> @protobuf.async_write_string(v)
    }
    None => ()
  }
  match self.insertion_point {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL)
      writer |> @protobuf.async_write_string(v)
    }
    None => ()
  }
  match self.content {
    Some(v) => {
      writer |> @protobuf.async_write_varint(122UL)
      writer |> @protobuf.async_write_string(v)
    }
    None => ()
  }
  match self.generated_code_info {
    Some(v) => {
      writer |> @protobuf.async_write_varint(130UL)
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v))
      v.async_write(writer)
    }
    None => ()
  }
}

///|
pub(all) struct CodeGeneratorResponse {
  mut error : String?
  mut supported_features : UInt64?
  mut minimum_edition : Int?
  mut maximum_edition : Int?
  mut file : Array[CodeGeneratorResponse_File]
} derive(Eq, Show)

///|
pub impl @protobuf.Sized for CodeGeneratorResponse with size_of(self) {
  let mut size = 0U
  match self.error {
    Some(v) =>
      size += 1U +
        {
          let size = @protobuf.size_of(v)
          @protobuf.size_of(size) + size
        }
    None => ()
  }
  match self.supported_features {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.minimum_edition {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.maximum_edition {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size += self.file
    .iter()
    .map(@protobuf.size_of)
    .map(s => 1U + @protobuf.size_of(s) + s)
    .fold(init=0U, UInt::op_add)
  size
}

///|
pub impl Default for CodeGeneratorResponse with default() -> CodeGeneratorResponse {
  CodeGeneratorResponse::{
    error: None,
    supported_features: None,
    minimum_edition: None,
    maximum_edition: None,
    file: [],
  }
}

///|
pub fn[R : @protobuf.Reader] CodeGeneratorResponse::read(
  reader : R,
) -> CodeGeneratorResponse raise {
  let reader = @protobuf.LimitedReader::new(reader)
  CodeGeneratorResponse::read_with_limit(reader)
}

///|
pub fn[R : @protobuf.Reader] CodeGeneratorResponse::read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> CodeGeneratorResponse raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = CodeGeneratorResponse::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
        (1, _) => msg.error = reader |> @protobuf.read_string() |> Some
        (2, _) =>
          msg.supported_features = reader |> @protobuf.read_uint64() |> Some
        (3, _) => msg.minimum_edition = reader |> @protobuf.read_int32() |> Some
        (4, _) => msg.maximum_edition = reader |> @protobuf.read_int32() |> Some
        (15, _) =>
          msg.file.push(
            {
              let len = reader |> @protobuf.read_int32()
              if len == 0 {
                CodeGeneratorResponse_File::default()
              } else {
                CodeGeneratorResponse_File::read_with_limit(reader, limit=len)
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
pub fn[W : @protobuf.Writer] CodeGeneratorResponse::write(
  self : Self,
  writer : W,
) -> Unit raise {
  match self.error {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL)
      writer |> @protobuf.write_string(v)
    }
    None => ()
  }
  match self.supported_features {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL)
      writer |> @protobuf.write_uint64(v)
    }
    None => ()
  }
  match self.minimum_edition {
    Some(v) => {
      writer |> @protobuf.write_varint(24UL)
      writer |> @protobuf.write_int32(v)
    }
    None => ()
  }
  match self.maximum_edition {
    Some(v) => {
      writer |> @protobuf.write_varint(32UL)
      writer |> @protobuf.write_int32(v)
    }
    None => ()
  }
  for item in self.file {
    writer |> @protobuf.write_varint(122UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item))
    item.write(writer)
  }
}

///|
pub impl ToJson for CodeGeneratorResponse with to_json(self) {
  let json : Map[String, Json] = {}
  match self.error {
    Some(v) => json["error"] = v.to_json()
    _ => ()
  }
  match self.supported_features {
    Some(v) => json["supportedFeatures"] = v.to_json()
    _ => ()
  }
  match self.minimum_edition {
    Some(v) => json["minimumEdition"] = v.to_json()
    _ => ()
  }
  match self.maximum_edition {
    Some(v) => json["maximumEdition"] = v.to_json()
    _ => ()
  }
  if self.file != Default::default() {
    json["file"] = self.file.to_json()
  }
  Json::object(json)
}

///|
pub impl @json.FromJson for CodeGeneratorResponse with from_json(
  json : Json,
  path : @json.JsonPath,
) -> CodeGeneratorResponse raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError(
      (path, "Expected an object for CodeGeneratorResponse"),
    )
  }
  let message = CodeGeneratorResponse::default()
  for key, value in obj {
    match (key, value) {
      ("error", value) => message.error = Some(@json.from_json(value, path~))
      ("supportedFeatures", value) =>
        message.supported_features = Some(@json.from_json(value, path~))
      ("minimumEdition", value) =>
        message.minimum_edition = Some(@json.from_json(value, path~))
      ("maximumEdition", value) =>
        message.maximum_edition = Some(@json.from_json(value, path~))
      ("file", Array(value)) =>
        message.file = value.map(v => @json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}

///|
pub async fn[R : @protobuf.AsyncReader] CodeGeneratorResponse::async_read(
  reader : R,
) -> CodeGeneratorResponse raise {
  let reader = @protobuf.LimitedReader::new(reader)
  CodeGeneratorResponse::async_read_with_limit(reader)
}

///|
pub async fn[R : @protobuf.AsyncReader] CodeGeneratorResponse::async_read_with_limit(
  reader : @protobuf.LimitedReader[R],
  limit? : Int,
) -> CodeGeneratorResponse raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit {
      raise @protobuf.EndOfStream
    }
    Some(l - limit)
  } else {
    None
  }
  reader.limit = limit
  let msg = CodeGeneratorResponse::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
        (1, _) => msg.error = reader |> @protobuf.async_read_string() |> Some
        (2, _) =>
          msg.supported_features = reader
            |> @protobuf.async_read_uint64()
            |> Some
        (3, _) =>
          msg.minimum_edition = reader |> @protobuf.async_read_int32() |> Some
        (4, _) =>
          msg.maximum_edition = reader |> @protobuf.async_read_int32() |> Some
        (15, _) =>
          msg.file.push(
            {
              let len = reader |> @protobuf.async_read_int32()
              if len == 0 {
                CodeGeneratorResponse_File::default()
              } else {
                CodeGeneratorResponse_File::async_read_with_limit(
                  reader,
                  limit=len,
                )
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
pub async fn[W : @protobuf.AsyncWriter] CodeGeneratorResponse::async_write(
  self : Self,
  writer : W,
) -> Unit raise {
  match self.error {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL)
      writer |> @protobuf.async_write_string(v)
    }
    None => ()
  }
  match self.supported_features {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL)
      writer |> @protobuf.async_write_uint64(v)
    }
    None => ()
  }
  match self.minimum_edition {
    Some(v) => {
      writer |> @protobuf.async_write_varint(24UL)
      writer |> @protobuf.async_write_int32(v)
    }
    None => ()
  }
  match self.maximum_edition {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL)
      writer |> @protobuf.async_write_int32(v)
    }
    None => ()
  }
  for item in self.file {
    writer |> @protobuf.async_write_varint(122UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item))
    item.async_write(writer)
  }
}
