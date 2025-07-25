///|
fn CodeGenerator::gen_package(
  self : CodeGenerator,
  package_ : Package,
) -> Unit raise {
  self.gen_file(package_)
  let package_name = package_.package_name.replace_all(old=".", new="/")
  let filename = "\{self.project_name}/src/\{package_name}/moon.pkg.json"
  let import_list : Array[Json] = []
  for dep in package_.dependency {
    let import_alias = self.qualified_name(dep.import_path)
    let import_path = dep.import_path.package_name.replace_all(old=".", new="/")
    import_list.push({
      "path": "\{self.username()}/\{self.project_name}/\{import_path}",
      "alias": import_alias,
    })
  }
  let content : Json = {
    "import": ["moonbit-community/protobuf", ..import_list],
  }
  let file = File::new(filename, content=content.stringify(indent=2))
  self.push_file(file)
}

///|
fn CodeGenerator::gen_module(self : CodeGenerator) -> Unit {
  let filename = "\{self.project_name}/moon.mod.json"
  let content : Json = {
    "name": "\{self.username()}/\{self.project_name}",
    "version": "0.1.0",
    "readme": "",
    "repository": "",
    "license": "",
    "keywords": [],
    "description": "",
    "source": "src",
    "deps": { "moonbit-community/protobuf": "0.1.0" },
  }
  let file = File::new(filename, content=content.stringify(indent=2))
  self.push_file(file)
}

///|
fn CodeGenerator::gen_file(self : CodeGenerator, file : Package) -> Unit raise {
  let package_name = file.package_name.replace_all(old=".", new="/")
  let filename = "\{self.project_name}/src/\{package_name}/top.mbt"
  let content = StringBuilder::new()
  for enum_ in file.enums {
    self.gen_enum(enum_, content)
  }
  self.gen_messages(file.message_type, content)
  let file = File::from_builder(filename, content~)
  self.push_file(file)
}

///|
fn CodeGenerator::gen_enum(
  self : CodeGenerator,
  enum_ : Enum,
  file : StringBuilder,
) -> Unit {
  let derives = ["Eq", "Show"]
  let derives_str = derives.join(", ")
  let enum_name = enum_.import_path.path() |> to_camel_case
  file.write_string("pub(all) enum \{enum_name} {\n")
  for value in enum_.value {
    let value_name = to_camel_case(value.name.unwrap())
    file.write_string("  \{value_name}\n")
  }
  file.write_string("} derive(\{derives_str})\n")

  // To enum
  file.write_string(
    "pub fn \{enum_name}::to_enum(self : \{enum_name}) -> @protobuf.Enum {\n",
  )
  file.write_string("  match self {\n")
  for value in enum_.value {
    let value_name = to_camel_case(value.name.unwrap())
    file.write_string(
      "    \{enum_name}::\{value_name} => \{value.number.unwrap()}\n",
    )
  }
  file.write_string("  }\n")
  file.write_string("}\n")

  // From enum
  file.write_string(
    "pub fn \{enum_name}::from_enum(i : @protobuf.Enum) -> \{enum_name} {\n",
  )
  file.write_string("  match i.inner() {\n")
  for value in enum_.value {
    let value_name = to_camel_case(value.name.unwrap())
    file.write_string(
      "    \{value.number.unwrap()} => \{enum_name}::\{value_name}\n",
    )
  }
  file.write_string("    _ => Default::default()\n")
  file.write_string("  }\n")
  file.write_string("}\n")

  // Default
  if enum_.value.length() > 0 {
    let first_value_name = to_camel_case(enum_.value[0].name.unwrap())
    file.write_string(
      "pub impl Default for \{enum_name} with default() -> \{enum_name} {\n",
    )
    file.write_string("  \{enum_name}::\{first_value_name}\n")
    file.write_string("}\n")
  }

  // Sized
  file.write_string(
    "pub impl @protobuf.Sized for \{enum_name} with size_of(self : \{enum_name}) {\n",
  )
  file.write_string("  @protobuf.Sized::size_of(self.to_enum())\n")
  file.write_string("}\n")

  // From JSON
  if self.support_json() {
    file.write_string(
      "pub impl @json.FromJson for \{enum_name} with from_json(json: Json, path: @json.JsonPath) -> \{enum_name} raise {\n",
    )
    file.write_string("  match json {\n")
    for value in enum_.value {
      let value_name = to_camel_case(value.name.unwrap())
      file.write_string(
        "    String(\"\{value_name}\") => \{enum_name}::\{value_name}\n",
      )
    }
    for value in enum_.value {
      let value_name = to_camel_case(value.name.unwrap())
      file.write_string(
        "    Number(\{value.number.unwrap()}, ..) => \{enum_name}::\{value_name}\n",
      )
    }
    file.write_string(
      "    _ =>  raise @json.JsonDecodeError((path, \"Expected a number or string for enum\"))\n",
    )
    file.write_string("  }\n")
    file.write_string("}\n")

    // To JSON
    file.write_string(
      "pub impl ToJson for \{enum_name} with to_json(self : \{enum_name}) -> Json {\n",
    )
    file.write_string("  match self {\n")
    for value in enum_.value {
      let value_name = to_camel_case(value.name.unwrap())
      file.write_string(
        "    \{enum_name}::\{value_name} => \"\{value_name}\"\n",
      )
    }
    file.write_string("  }\n")
    file.write_string("}\n")
  }

  // End
}

///|
fn CodeGenerator::get_moonbit_type(
  self : CodeGenerator,
  field : Field,
  parent_path? : ImportPath,
) -> String raise {
  guard field.type_ is Some(typ) else { raise UnsupportedType("Group") }
  return match typ {
    FieldType::TYPE_DOUBLE => "Double"
    FieldType::TYPE_FLOAT => "Float"
    FieldType::TYPE_INT64 => "Int64"
    FieldType::TYPE_UINT64 => "UInt64"
    FieldType::TYPE_INT32 => "Int"
    FieldType::TYPE_FIXED64 => "UInt64"
    FieldType::TYPE_FIXED32 => "UInt"
    FieldType::TYPE_BOOL => "Bool"
    FieldType::TYPE_STRING => "String"
    FieldType::TYPE_GROUP => raise UnsupportedType("Group")
    FieldType::TYPE_MESSAGE => {
      let message_name = field.type_name.unwrap()
      if self.find_message(message_name) is Some(message) {
        let message_path = message.import_path
        if parent_path is Some(path) &&
          path.package_name != message_path.package_name {
          return "@\{self.qualified_name(message_path)}.\{message_path.path() |> to_camel_case}"
        }
        return message_path.path() |> to_camel_case
      }
      raise UnsupportedType("Message \{message_name} not found")
    }
    FieldType::TYPE_BYTES => "Bytes"
    FieldType::TYPE_UINT32 => "UInt"
    FieldType::TYPE_ENUM => {
      let enum_name = field.type_name.unwrap()
      if self.find_enum(enum_name) is Some(enum_) {
        let path = enum_.import_path
        if parent_path is Some(path) && path.package_name != path.package_name {
          return "@\{self.qualified_name(path)}.\{path.path() |> to_camel_case}"
        }
        return path.path() |> to_camel_case
      }
      raise UnsupportedType("Enum \{enum_name} not found")
    }
    FieldType::TYPE_SFIXED32 => "Int"
    FieldType::TYPE_SFIXED64 => "Int64"
    FieldType::TYPE_SINT32 => "Int"
    FieldType::TYPE_SINT64 => "Int64"
  }
}

///|
fn CodeGenerator::gen_messages(
  self : CodeGenerator,
  messages : Array[Message],
  content : StringBuilder,
) -> Unit raise {
  for message in messages {
    for enum_ in message.enums {
      self.gen_enum(enum_, content)
    }
    self.gen_messages(message.messages, content)
    self.gen_message(message, content)
  }
}

///|
fn CodeGenerator::gen_message(
  self : CodeGenerator,
  message : Message,
  file : StringBuilder,
) -> Unit raise {
  let message_name = message.import_path.path() |> to_camel_case
  let message_path = message.import_path
  file.write_string("pub(all) struct \{message_name} {\n")
  for field in message.fields {
    let field_type = self.get_moonbit_type(field, parent_path=message_path)
    let field_name = field.import_path.name() |> pascal_to_snake
    if field.is_optional() {
      file.write_string("  mut \{field_name} : \{field_type}?\n")
    } else if field.map_key_value() is Some(map_entry) {
      let key_type = self.get_moonbit_type(
        map_entry.fields[0],
        parent_path=message_path,
      )
      let value_type = self.get_moonbit_type(
        map_entry.fields[1],
        parent_path=message_path,
      )
      file.write_string(
        "  mut \{field_name} : Map[\{key_type}, \{value_type}]\n",
      )
    } else if field.is_list() {
      file.write_string("  mut \{field_name} : Array[\{field_type}]\n")
    } else if field.is_message() {
      file.write_string("  mut \{field_name} :  \{field_type} \n")
    } else if field.is_enum() {
      file.write_string("  mut \{field_name} :  \{field_type} \n")
    } else {
      file.write_string("  mut \{field_name} : \{field_type}\n")
    }
  }
  for oneof in message.oneofs {
    let oneof_name = self.get_oneof_enum_name(message, oneof.name)
    let field_name = oneof.name |> pascal_to_snake
    file.write_string("  mut \{field_name} : \{oneof_name}\n")
  }
  file.write_string("} derive(Eq, Show)\n")
  for oneof in message.oneofs {
    self.gen_oneof_enum(message, oneof, file)
  }
  self.gen_message_size(message, file)
  self.gen_message_default(message, file)
  self.gen_message_reader(message, file)
  self.gen_message_writer(message, file)
  if self.support_json() {
    self.gen_message_json(message, file)
  }
  if self.support_async() {
    self.gen_message_reader(message, file, async_="async")
    self.gen_message_writer(message, file, async_="async")
  }
}

///|
fn CodeGenerator::gen_message_default(
  self : CodeGenerator,
  message : Message,
  content : StringBuilder,
) -> Unit raise {
  let message_name = message.import_path.path() |> to_camel_case
  content.write_string(
    "pub impl Default for \{message_name} with default() -> \{message_name} {\n",
  )
  content.write_string("  \{message_name}::{\n")
  for field in message.fields {
    let field_type = self.get_moonbit_type(
      field,
      parent_path=message.import_path,
    )
    let field_name = field.import_path.name() |> pascal_to_snake
    if field.default_value() is Some(default_value) {
      let mut field_default_value = default_value
      if field.type_ is Some(TYPE_STRING) {
        field_default_value = "\"\{field_default_value}\""
      } else if field.is_enum() {
        field_default_value = "\{field_type}::\{default_value}"
      }
      if field.is_optional() {
        field_default_value = "Some(\{field_default_value})"
      }
      content.write_string("    \{field_name} : \{field_default_value},\n")
    } else if field.is_optional() {
      content.write_string("    \{field_name} : None,\n")
    } else if field.map_key_value() is Some(_) {
      content.write_string("    \{field_name} : {},\n")
    } else if field.is_list() {
      content.write_string("    \{field_name} : [],\n")
    } else {
      content.write_string("    \{field_name} : \{field_type}::default(),\n")
    }
  }
  for oneof in message.oneofs {
    let oneof_name = self.get_oneof_enum_name(message, oneof.name)
    content.write_string("    \{oneof.name} : \{oneof_name}::NotSet,\n")
  }
  content.write_string(
    (
      #|  }
      #|}
      #|
    ),
  )
}

///|
fn CodeGenerator::gen_message_json(
  self : CodeGenerator,
  message : Message,
  content : StringBuilder,
) -> Unit raise {
  let message_name = message.import_path.path() |> to_camel_case
  if message.fields.is_empty() {
    content.write_string(
      (
        $|pub impl ToJson for \{message_name} with to_json(_) {
        #|  {}
        #|}
        $|pub impl @json.FromJson for \{message_name} with from_json(json: Json, path: @json.JsonPath) -> \{message_name} noraise {
        $|  \{message_name}::default()
        #|}
        #|
      ),
    )
    return
  }

  // To JSON
  content.write_string(
    (
      $|pub impl ToJson for \{message_name} with to_json(self) {
      $|  let json: Map[String, Json] = {}
      #|
    ),
  )
  for field in message.fields {
    let field_name = "self.\{field.import_path.name() |> pascal_to_snake}"
    let json_name = field.json_name.unwrap_or(field.name)
    let field_type = self.get_moonbit_type(
      field,
      parent_path=message.import_path,
    )
    let has_default_value = field.default_value() is Some(_)
    let default_value = if field.default_value() is Some(default_value) {
      if field.type_ is Some(TYPE_STRING) {
        "\"\{default_value}\""
      } else if field.is_enum() {
        "\{field_type}::\{default_value}"
      } else {
        "\{default_value}"
      }
    } else {
      "Default::default()"
    }
    if field.is_optional() {
      content.write_string("  match \{field_name} {\n")
      let optional_match = if has_default_value {
        "Some(v) if v != \{default_value}"
      } else {
        "Some(v)"
      }
      if field.type_ is Some(TYPE_BYTES) {
        content.write_string(
          "      \{optional_match} => json[\"\{json_name}\"] = @protobuf.base64_encode(v).to_json()\n",
        )
      } else {
        content.write_string(
          "      \{optional_match} => json[\"\{json_name}\"] = v.to_json()\n",
        )
      }
      content.write_string(
        (
          #|      _ => ()
          #|    }
          #|
        ),
      )
    } else {
      content.write_string("  if \{field_name} != \{default_value} {\n")
      match field.type_ {
        Some(TYPE_BYTES) =>
          content.write_string(
            "  json[\"\{json_name}\"] = @protobuf.base64_encode(\{field_name}).to_json()\n",
          )
        _ =>
          content.write_string(
            "  json[\"\{json_name}\"] = \{field_name}.to_json()\n",
          )
      }
      content.write_string("  }\n")
    }
  }
  // From JSON
  content.write_string(
    (
      $|  Json::object(json)
      $|}
      $|pub impl @json.FromJson for \{message_name} with from_json(json: Json, path: @json.JsonPath) -> \{message_name} raise {
      $|  guard json is Object(obj) else {
      $|    raise @json.JsonDecodeError((path, "Expected an object for \{message_name}"))
      $|  }
      $|  let message = \{message_name}::default()
      $|  for key, value in obj {
      $|    match (key, value) {
      $|
    ),
  )
  for field in message.fields {
    let field_name = field.import_path.name() |> pascal_to_snake
    let json_name = field.json_name.unwrap()
    if field.is_optional() {
      match field.type_ {
        Some(TYPE_BYTES) =>
          content.write_string(
            "      (\"\{json_name}\", String(value)) => message.\{field_name} = Some(@protobuf.base64_decode(value))\n",
          )
        Some(TYPE_FLOAT) =>
          content.write_string(
            "      (\"\{json_name}\", Number(value, ..)) => message.\{field_name} = Some(value.to_float())\n",
          )
        _ =>
          content.write_string(
            "      (\"\{json_name}\", value) => message.\{field_name} = Some(@json.from_json(value, path~))\n",
          )
      }
    } else if field.map_key_value() is Some(_) {
      content.write_string(
        "      (\"\{json_name}\", _) => message.\{field_name} = @json.from_json(value, path~)\n",
      )
    } else if field.is_list() {
      content.write_string(
        "      (\"\{json_name}\", Array(value)) => message.\{field_name} = value.map(v => \n",
      )
      if field.type_ is Some(TYPE_FLOAT) {
        content.write_string("v.as_number().unwrap().to_float())\n")
      } else {
        content.write_string("@json.from_json(v, path~))\n")
      }
    } else {
      match field.type_ {
        Some(TYPE_FLOAT) =>
          content.write_string(
            "      (\"\{json_name}\", Number(value, ..)) => message.\{field_name} = value.to_float()\n",
          )
        Some(TYPE_BYTES) =>
          content.write_string(
            "      (\"\{json_name}\", String(value)) => message.\{field_name} = @protobuf.base64_decode(value)\n",
          )
        _ =>
          content.write_string(
            "      (\"\{json_name}\", value) => message.\{field_name} = @json.from_json(value, path~)\n",
          )
      }
    }
  }
  content.write_string(
    (
      #|      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
      #|    }
      #|  }
      #|  message
      $|}
      #|
    ),
  )
}

///|
fn CodeGenerator::gen_message_size(
  _ : CodeGenerator,
  message : Message,
  content : StringBuilder,
) -> Unit raise {
  let message_name = message.import_path.path() |> to_camel_case
  if message.fields.is_empty() {
    content.write_string(
      (
        $|pub impl @protobuf.Sized for \{message_name} with size_of(_) {
        #|  0
        #|}
        #|
      ),
    )
    return
  }
  content.write_string(
    (
      $|pub impl @protobuf.Sized for \{message_name} with size_of(self) {
      $|  let mut size = 0U
      $|
    ),
  )
  for field in message.fields {
    let field_name = pascal_to_snake(field.json_name.unwrap())
    let field_number = field.number.unwrap()
    if field.is_pack() {
      if field.type_ is Some(typ) {
        let delta_size = match typ {
          FieldType::TYPE_FIXED32
          | FieldType::TYPE_SFIXED32
          | FieldType::TYPE_FLOAT => {
            let tag_size = size_tag(field_number)
            let fixed_size = sizeFixed32()
            "\{tag_size}U + { let size = self.\{field_name}.length().reinterpret_as_uint() * \{fixed_size}; @protobuf.size_of(size) + size}"
          }
          FieldType::TYPE_FIXED64
          | FieldType::TYPE_SFIXED64
          | FieldType::TYPE_DOUBLE => {
            let tag_size = size_tag(field_number)
            let fixed_size = sizeFixed64()
            "\{tag_size}U + { let size = self.\{field_name}.length().reinterpret_as_uint() * \{fixed_size}; @protobuf.size_of(size) + size}"
          }
          FieldType::TYPE_INT32
          | FieldType::TYPE_INT64
          | FieldType::TYPE_SINT32
          | FieldType::TYPE_SINT64
          | FieldType::TYPE_UINT32
          | FieldType::TYPE_UINT64
          | FieldType::TYPE_BOOL
          | FieldType::TYPE_ENUM => {
            let tag_size = size_tag(field_number)
            "\{tag_size}U + { let size = self.\{field_name}.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add); @protobuf.size_of(size) + size }"
          }
          _ => raise UnsupportedType("packed field type: \{typ}")
        }
        content.write_string("  size += \{delta_size}\n")
      }
    } else if field.map_key_value() is Some(map_entry) {
      let key_field = map_entry.fields[0]
      let value_field = map_entry.fields[1]
      let tag_size = size_tag(field_number)
      let key_size = match key_field.type_.unwrap() {
        FieldType::TYPE_STRING
        | FieldType::TYPE_BYTES
        | FieldType::TYPE_MESSAGE => {
          let key_tag_size = size_tag(0)
          "\{key_tag_size}U + { let size = @protobuf.size_of(k); @protobuf.size_of(size) + size }"
        }
        FieldType::TYPE_FIXED32
        | FieldType::TYPE_SFIXED32
        | FieldType::TYPE_FLOAT => {
          let key_tag_size = size_tag(0)
          let fixed_size = sizeFixed32()
          "\{key_tag_size}U + \{fixed_size}U"
        }
        FieldType::TYPE_FIXED64
        | FieldType::TYPE_SFIXED64
        | FieldType::TYPE_DOUBLE => {
          let key_tag_size = size_tag(0)
          let fixed_size = sizeFixed64()
          "\{key_tag_size}U + \{fixed_size}U"
        }
        _ => {
          let key_tag_size = size_tag(0)
          "\{key_tag_size}U + @protobuf.size_of(k)"
        }
      }

      // Calculate value size
      let value_size = match value_field.type_.unwrap() {
        FieldType::TYPE_STRING
        | FieldType::TYPE_BYTES
        | FieldType::TYPE_MESSAGE => {
          let value_tag_size = size_tag(1)
          "\{value_tag_size}U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }"
        }
        FieldType::TYPE_FIXED32
        | FieldType::TYPE_SFIXED32
        | FieldType::TYPE_FLOAT => {
          let value_tag_size = size_tag(1)
          let fixed_size = sizeFixed32()
          "\{value_tag_size}U + \{fixed_size}U"
        }
        FieldType::TYPE_FIXED64
        | FieldType::TYPE_SFIXED64
        | FieldType::TYPE_DOUBLE => {
          let value_tag_size = size_tag(1)
          let fixed_size = sizeFixed64()
          "\{value_tag_size}U + \{fixed_size}U"
        }
        _ => {
          let value_tag_size = size_tag(1)
          "\{value_tag_size}U + @protobuf.size_of(v)"
        }
      }
      content.write_string(
        (
          $|  size += self.\{field_name}.iter().map(fn(key_value) {
          #|    let (k, v) = key_value
          $|    let key_size = \{key_size}
          $|    let value_size = \{value_size}
          $|    \{tag_size}U + @protobuf.size_of(key_size + value_size) + key_size + value_size 
          #|  }).fold(init=0U, UInt::op_add)
          #|
        ),
      )
    } else if field.is_list() {
      let tag_size = size_tag(field_number)
      content.write_string(
        "  size += self.\{field_name}.iter().map(@protobuf.size_of).map(s => \{tag_size}U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)\n",
      )
    } else if field.is_optional() {
      guard field.type_ is Some(typ)
      let delta_size = match typ {
        FieldType::TYPE_STRING
        | FieldType::TYPE_BYTES
        | FieldType::TYPE_MESSAGE => {
          let tag_size = size_tag(field_number)
          "\{tag_size}U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }"
        }
        FieldType::TYPE_FIXED32
        | FieldType::TYPE_SFIXED32
        | FieldType::TYPE_FLOAT => {
          let tag_size = size_tag(field_number)
          let fixed_size = sizeFixed32()
          "\{tag_size}U + \{fixed_size}U"
        }
        FieldType::TYPE_FIXED64
        | FieldType::TYPE_SFIXED64
        | FieldType::TYPE_DOUBLE => {
          let tag_size = size_tag(field_number)
          let fixed_size = sizeFixed64()
          "\{tag_size}U + \{fixed_size}U"
        }
        _ => {
          let tag_size = size_tag(field_number)
          "\{tag_size}U + @protobuf.size_of(v)"
        }
      }
      content.write_string(
        (
          $|  match self.\{field_name} {
          $|    Some(v) => size += \{delta_size}
          #|    None => ()
          #|  }
          #|
        ),
      )
    } else if field.type_ is Some(typ) {
      let delta_size = match typ {
        FieldType::TYPE_STRING
        | FieldType::TYPE_BYTES
        | FieldType::TYPE_MESSAGE => {
          let tag_size = size_tag(field_number)
          "\{tag_size}U + { let size = @protobuf.size_of(self.\{field_name}); @protobuf.size_of(size) + size }"
        }
        FieldType::TYPE_FIXED32
        | FieldType::TYPE_SFIXED32
        | FieldType::TYPE_FLOAT => {
          let tag_size = size_tag(field_number)
          let fixed_size = sizeFixed32()
          "\{tag_size}U + \{fixed_size}U"
        }
        FieldType::TYPE_FIXED64
        | FieldType::TYPE_SFIXED64
        | FieldType::TYPE_DOUBLE => {
          let tag_size = size_tag(field_number)
          let fixed_size = sizeFixed64()
          "\{tag_size}U + \{fixed_size}U"
        }
        _ => {
          let tag_size = size_tag(field_number)
          "\{tag_size}U + @protobuf.size_of(self.\{field_name})"
        }
      }
      content.write_string("  size += \{delta_size}\n")
    }
  }
  for oneof in message.oneofs {
    let field_name = oneof.name |> pascal_to_snake
    content.write_string("  match self.\{field_name} {\n")
    for field in oneof.field {
      let field_name = field.import_path.name() |> to_camel_case
      let field_number = field.number.unwrap()
      let delta_size = if field.type_ is Some(typ) {
        match typ {
          FieldType::TYPE_STRING
          | FieldType::TYPE_BYTES
          | FieldType::TYPE_MESSAGE => {
            let tag_size = size_tag(field_number)
            "\{tag_size}U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }"
          }
          FieldType::TYPE_FIXED32
          | FieldType::TYPE_SFIXED32
          | FieldType::TYPE_FLOAT => {
            let tag_size = size_tag(field_number)
            let fixed_size = sizeFixed32()
            "\{tag_size}U + \{fixed_size}U"
          }
          FieldType::TYPE_FIXED64
          | FieldType::TYPE_SFIXED64
          | FieldType::TYPE_DOUBLE => {
            let tag_size = size_tag(field_number)
            let fixed_size = sizeFixed64()
            "\{tag_size}U + \{fixed_size}U"
          }
          _ => {
            let tag_size = size_tag(field_number)
            "\{tag_size}U + @protobuf.size_of(v)"
          }
        }
      } else {
        "0"
      }
      content.write_string(
        (
          $|    \{field_name}(v) => { size += \{delta_size} }
          $|
        ),
      )
    }
    content.write_string(
      (
        #|    NotSet => ()
        #|  }
        #|
      ),
    )
  }
  content.write_string(
    (
      #|  size
      #|}
      #|
    ),
  )
}

///|
fn CodeGenerator::get_oneof_enum_name(
  _ : CodeGenerator,
  message : Message,
  oneof_name : String,
) -> String {
  let message_name = message.import_path.path() |> to_camel_case
  return "\{message_name}_\{to_camel_case(oneof_name)}"
}

///|
fn gen_oneof_enum(
  self : CodeGenerator,
  message : Message,
  oneof : OneOf,
  content : StringBuilder,
) -> Unit raise {
  let enum_name = self.get_oneof_enum_name(message, oneof.name)
  content.write_string("pub(all) enum \{enum_name} {\n")
  for field in oneof.field {
    let field_type = self.get_moonbit_type(
      field,
      parent_path=message.import_path,
    )
    let field_name = field.import_path.name() |> to_camel_case
    content.write_string("  \{field_name}(\{field_type})\n")
  }
  content.write_string(
    (
      #|  NotSet
      #|} derive(Eq, Show)
      $|pub impl Default for \{enum_name} with default() -> \{enum_name} {
      #|  NotSet
      #|}
      #|
    ),
  )
  if self.support_json() {
    // From Json
    content.write_string(
      "pub impl @json.FromJson for \{enum_name} with from_json(json: Json, path: @json.JsonPath) -> \{enum_name} raise {\n",
    )
    for field in oneof.field {
      let field_name = field.import_path.name() |> to_camel_case
      content.write_string(
        (
          $|  if (try? \{enum_name}::\{field_name}(json |> @json.from_json(path~))) is Ok(value) {
          #|    return value
          $|  }
          $|
        ),
      )
    }
    content.write_string(
      (
        $|\{enum_name}::NotSet
        $|}
        $|pub impl ToJson for \{enum_name} with to_json(self : \{enum_name}) -> Json {
        $|  match self {
        // To Json
        $|
      ),
    )
    for field in oneof.field {
      let field_name = field.import_path.name() |> to_camel_case
      content.write_string(
        "    \{enum_name}::\{field_name}(v) => v.to_json()\n",
      )
    }
    content.write_string(
      (
        $|    \{enum_name}::NotSet => Json::null()
        $|  }
        $|}
        $|
      ),
    )
  }
}

///|
fn gen_message_reader(
  self : CodeGenerator,
  message : Message,
  content : StringBuilder,
  async_~ : String = "",
) -> Unit raise {
  let message_name = message.import_path.path() |> to_camel_case
  let async_snake = async_ |> pascal_to_snake
  if message.fields.is_empty() {
    content.write_string(
      (
        $|pub \{async_} fn[R] \{message_name}::\{async_snake}read(reader : R) -> \{message_name} noraise {
        #|  let reader = @protobuf.LimitedReader::new(reader)
        $|  \{message_name}::\{async_snake}read_with_limit(reader)
        #|}
        $|pub \{async_} fn[R] \{message_name}::\{async_snake}read_with_limit(_ : @protobuf.LimitedReader[R], _limit ?: Int) -> \{message_name} noraise {
        $|  \{message_name}::default()
        #|}
        #|
      ),
    )
    return
  }
  content.write_string(
    (
      $|pub \{async_} fn[R: @protobuf.\{async_ |> title}Reader] \{message_name}::\{async_snake}read(reader : R) -> \{message_name} raise {
      #|  let reader = @protobuf.LimitedReader::new(reader)
      $|  \{message_name}::\{async_snake}read_with_limit(reader)
      #|}
      $|pub \{async_} fn[R: @protobuf.\{async_ |> title}Reader] \{message_name}::\{async_snake}read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> \{message_name} raise {
      #|  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
      #|    if l < limit { raise @protobuf.EndOfStream }
      #|    Some(l - limit)
      #|  } else { None }
      #|  reader.limit = limit
      $|  let msg = \{message_name}::default()
      #|
    ),
  )
  content.write_string(
    (
      #|  try {
      #|    for {
      $|      match (reader |> @protobuf.\{async_ |> pascal_to_snake}read_tag()) {\n
    ),
  )
  for field in message.fields {
    if field.is_list() {
      self.gen_repeated_field_read(field, message.import_path, content, async_~)
    } else {
      self.gen_field_read(field, message.import_path, content, async_~)
    }
  }
  for oneof in message.oneofs {
    let oneof_name = self.get_oneof_enum_name(message, oneof.name)
    let oneof_field_name = oneof.name |> pascal_to_snake
    for field in oneof.field {
      let field_name = field.import_path.name() |> to_camel_case
      let field_number = field.number.unwrap()
      let type_name = self.get_moonbit_type(
        field,
        parent_path=message.import_path,
      )
      content.write_string(
        "        (\{field_number}, _) => msg.\{oneof_field_name} = \{gen_kind_read(field.type_.unwrap(), type_name, async_=async_)} |> \{oneof_name}::\{field_name}\n",
      )
    }
  }
  content.write_string(
    (
      $|       (_, wire) => reader |> @protobuf.\{async_ |> pascal_to_snake}read_unknown(wire)
      #|      }
      #|    }
      #|  } catch {
      #|    @protobuf.EndOfStream => ()
      #|    err => raise err
      #|  }
      #|  reader.limit = new_limit
      #|  msg
      #|}
      #|
    ),
  )
}

///|
fn gen_repeated_field_read(
  self : CodeGenerator,
  field : Field,
  parent_path : ImportPath,
  content : StringBuilder,
  async_~ : String = "",
) -> Unit raise {
  let kind = field.type_.unwrap()
  let async_snake = async_ |> pascal_to_snake
  let field_number = field.number.unwrap()
  let field_name = field.import_path.name() |> pascal_to_snake
  let mut name = ""
  if field.is_enum() || field.is_message() {
    name = self.get_moonbit_type(field, parent_path~)
  }
  if field.is_pack() {
    match kind {
      FieldType::TYPE_BOOL
      | FieldType::TYPE_INT32
      | FieldType::TYPE_INT64
      | FieldType::TYPE_UINT32
      | FieldType::TYPE_UINT64
      | FieldType::TYPE_SINT32
      | FieldType::TYPE_SINT64 =>
        content.write_string(
          "      (\{field_number}, _) => { msg.\{field_name}.push_iter((reader |> @protobuf.\{async_snake}read_packed(\{kind_read_func(kind, async_=async_)}, None)).iter()) }\n",
        )

      // I64
      FieldType::TYPE_SFIXED64
      | FieldType::TYPE_FIXED64
      | FieldType::TYPE_DOUBLE =>
        content.write_string(
          "      (\{field_number}, _) => { msg.\{field_name}.push_iter((reader |> @protobuf.\{async_snake}read_packed(\{kind_read_func(kind, async_=async_)}, Some(8))).iter()) }\n",
        )

      // I32
      FieldType::TYPE_SFIXED32
      | FieldType::TYPE_FIXED32
      | FieldType::TYPE_FLOAT =>
        content.write_string(
          "      (\{field_number}, _) => { msg.\{field_name}.push_iter((reader |> @protobuf.\{async_snake}read_packed(\{kind_read_func(kind, async_=async_)}, Some(4))).iter()) }\n",
        )
      _ => raise UnexpectedType("Packed field type: \{kind}")
    }
  } else if field.map_key_value() is Some(_) {
    content.write_string(
      "      (\{field_number}, _) => { let {key, value} = \{gen_kind_read(kind, name, async_=async_)}; msg.\{field_name}[key] = value }\n",
    )
  } else {
    content.write_string(
      "      (\{field_number}, _) => msg.\{field_name}.push(\{gen_kind_read(kind, name, async_=async_)})\n",
    )
  }
}

///|
fn gen_field_read(
  self : CodeGenerator,
  field : Field,
  parent_path : ImportPath,
  content : StringBuilder,
  async_~ : String = "",
) -> Unit raise {
  let field_name = field.import_path.name() |> pascal_to_snake
  let field_number = field.number.unwrap()
  let kind = field.type_.unwrap()
  let optional_constructor = if field.is_optional() { " |> Some" } else { "" }
  let type_name = if field.is_enum() || field.is_message() {
    self.get_moonbit_type(field, parent_path~)
  } else {
    ""
  }
  content.write_string(
    "      (\{field_number}, _) => msg.\{field_name} = \{gen_kind_read(kind, type_name, async_=async_)}\{optional_constructor}\n",
  )
}

///|
fn kind_read_func(kind : FieldType, async_~ : String = "") -> String raise {
  let async_ = async_ |> pascal_to_snake
  match kind {
    FieldType::TYPE_BOOL => "@protobuf.\{async_}read_bool"
    FieldType::TYPE_INT32 => "@protobuf.\{async_}read_int32"
    FieldType::TYPE_INT64 => "@protobuf.\{async_}read_int64"
    FieldType::TYPE_SINT32 => "@protobuf.\{async_}read_sint32"
    FieldType::TYPE_SINT64 => "@protobuf.\{async_}read_sint64"
    FieldType::TYPE_UINT32 => "@protobuf.\{async_}read_uint32"
    FieldType::TYPE_UINT64 => "@protobuf.\{async_}read_uint64"
    FieldType::TYPE_FIXED32 => "@protobuf.\{async_}read_fixed32"
    FieldType::TYPE_FIXED64 => "@protobuf.\{async_}read_fixed64"
    FieldType::TYPE_SFIXED32 => "@protobuf.\{async_}read_sfixed32"
    FieldType::TYPE_SFIXED64 => "@protobuf.\{async_}read_sfixed64"
    FieldType::TYPE_FLOAT => "@protobuf.\{async_}read_float"
    FieldType::TYPE_DOUBLE => "@protobuf.\{async_}read_double"
    FieldType::TYPE_STRING => "@protobuf.\{async_}read_string"
    FieldType::TYPE_BYTES => "@protobuf.\{async_}read_bytes"
    FieldType::TYPE_ENUM => raise UnsupportedType("Enum type: \{kind}")
    FieldType::TYPE_MESSAGE => raise UnexpectedType("Message type: \{kind}")
    FieldType::TYPE_GROUP => raise UnsupportedType("Group")
  }
}

///|
fn gen_kind_read(
  field_type : FieldType,
  type_name : String,
  async_~ : String = "",
) -> String raise {
  let async_ = async_ |> pascal_to_snake
  match field_type {
    FieldType::TYPE_BOOL
    | FieldType::TYPE_INT32
    | FieldType::TYPE_INT64
    | FieldType::TYPE_UINT32
    | FieldType::TYPE_UINT64
    | FieldType::TYPE_FIXED32
    | FieldType::TYPE_FIXED64
    | FieldType::TYPE_SFIXED32
    | FieldType::TYPE_SFIXED64
    | FieldType::TYPE_FLOAT
    | FieldType::TYPE_DOUBLE
    | FieldType::TYPE_STRING
    | FieldType::TYPE_BYTES =>
      "reader |> \{kind_read_func(field_type, async_~)}()"
    FieldType::TYPE_SINT32 | FieldType::TYPE_SINT64 =>
      "(reader |> \{kind_read_func(field_type, async_~)}()).inner()"
    FieldType::TYPE_ENUM =>
      "reader |> @protobuf.\{async_}read_enum() |> \{type_name}::from_enum"
    FieldType::TYPE_MESSAGE =>
      (
        #|  {
        $|    let len = reader |> @protobuf.\{async_}read_int32()
        #|    if len == 0 {
        $|      \{type_name}::default()
        #|    } else {
        $|      \{type_name}::\{async_}read_with_limit(reader, limit=len)
        $|    }
        #|  }
      )
    FieldType::TYPE_GROUP => raise UnsupportedType("Group")
  }
}

///|
fn gen_message_writer(
  self : CodeGenerator,
  message : Message,
  content : StringBuilder,
  async_~ : String = "",
) -> Unit raise {
  let message_name = message.import_path.path() |> to_camel_case
  let async_snake = async_ |> pascal_to_snake
  if message.fields.is_empty() {
    content.write_string(
      (
        $|pub \{async_} fn[W: @protobuf.\{async_ |> title}Writer] \{message_name}::\{async_snake}write(_: Self, _ : W) -> Unit noraise {
        $|}
        $|
      ),
    )
    return
  }
  content.write_string(
    "pub \{async_} fn[W: @protobuf.\{async_ |> title}Writer] \{message_name}::\{async_snake}write(self:Self, writer : W) -> Unit raise {\n",
  )
  for field in message.fields {
    let field_name = field.import_path.name() |> pascal_to_snake
    let field_number = field.number.unwrap()
    if field.is_pack() {
      let tag_val = tag(field.type_.unwrap(), field_number, true)
      content.write_string(
        "  writer |> @protobuf.\{async_snake}write_varint(\{tag_val}UL)\n",
      )
      match field.type_.unwrap() {
        FieldType::TYPE_FIXED32
        | FieldType::TYPE_SFIXED32
        | FieldType::TYPE_FLOAT => {
          let fixed_size = sizeFixed32()
          content.write_string(
            "  let size = self.\{field_name}.length().reinterpret_as_uint() * \{fixed_size}\n",
          )
        }
        FieldType::TYPE_FIXED64
        | FieldType::TYPE_SFIXED64
        | FieldType::TYPE_DOUBLE => {
          let fixed_size = sizeFixed64()
          content.write_string(
            "  let size = self.\{field_name}.length().reinterpret_as_uint() * \{fixed_size}\n",
          )
        }
        FieldType::TYPE_INT32
        | FieldType::TYPE_INT64
        | FieldType::TYPE_SINT32
        | FieldType::TYPE_SINT64
        | FieldType::TYPE_UINT32
        | FieldType::TYPE_UINT64
        | FieldType::TYPE_BOOL
        | FieldType::TYPE_ENUM =>
          content.write_string(
            "  let size = self.\{field_name}.iter().map(@protobuf.size_of).fold(init=0U, UInt::op_add)\n",
          )
        _ => raise UnexpectedType("packed field type: \{field.type_}")
      }
      let field_write_type = self.gen_kind_write(
        field,
        "item",
        async_=async_snake,
      )
      content.write_string(
        (
          $|  writer |> @protobuf.\{async_snake}write_uint32(size)
          $|  for item in self.\{field_name} {
          $|      \{field_write_type}
          $|  }
          $|
        ),
      )
    } else if field.map_key_value() is Some(map_entry) {
      let key_field = map_entry.fields[0]
      let value_field = map_entry.fields[1]
      let tag_val = tag(field.type_.unwrap(), field_number, false)
      content.write_string(
        (
          $|  let keys = self.\{field_name}.keys().collect()
          #|  for i in 0..<keys.length() {
          #|    let k = keys[i]
          $|    let v = self.\{field_name}.get(k).unwrap()
          $|    writer |> @protobuf.\{async_snake}write_varint(\{tag_val}UL)
          $|
        ),
      )
      match key_field.type_.unwrap() {
        FieldType::TYPE_STRING
        | FieldType::TYPE_BYTES
        | FieldType::TYPE_MESSAGE => {
          let key_tag_size = size_tag(0)
          content.write_string(
            "    let key_size = \{key_tag_size}U + { let size = @protobuf.size_of(k); @protobuf.size_of(size) + size }\n",
          )
        }
        FieldType::TYPE_FIXED32
        | FieldType::TYPE_SFIXED32
        | FieldType::TYPE_FLOAT => {
          let key_tag_size = size_tag(0)
          let fixed_size = sizeFixed32()
          content.write_string(
            "    let key_size = \{key_tag_size}U + \{fixed_size}U\n",
          )
        }
        FieldType::TYPE_FIXED64
        | FieldType::TYPE_SFIXED64
        | FieldType::TYPE_DOUBLE => {
          let key_tag_size = size_tag(0)
          let fixed_size = sizeFixed64()
          content.write_string(
            "    let key_size = \{key_tag_size}U + \{fixed_size}U\n",
          )
        }
        _ => {
          let key_tag_size = size_tag(0)
          content.write_string(
            "    let key_size = \{key_tag_size}U + @protobuf.size_of(k)\n",
          )
        }
      }
      match value_field.type_.unwrap() {
        FieldType::TYPE_STRING
        | FieldType::TYPE_BYTES
        | FieldType::TYPE_MESSAGE => {
          let value_tag_size = size_tag(1)
          content.write_string(
            "    let value_size = \{value_tag_size}U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }\n",
          )
        }
        FieldType::TYPE_FIXED32
        | FieldType::TYPE_SFIXED32
        | FieldType::TYPE_FLOAT => {
          let value_tag_size = size_tag(1)
          let fixed_size = sizeFixed32()
          content.write_string(
            "    let value_size = \{value_tag_size}U + \{fixed_size}U\n",
          )
        }
        FieldType::TYPE_FIXED64
        | FieldType::TYPE_SFIXED64
        | FieldType::TYPE_DOUBLE => {
          let value_tag_size = size_tag(1)
          let fixed_size = sizeFixed64()
          content.write_string(
            "    let value_size = \{value_tag_size}U + \{fixed_size}U\n",
          )
        }
        _ => {
          let value_tag_size = size_tag(1)
          content.write_string(
            "    let value_size = \{value_tag_size}U + @protobuf.size_of(v)\n",
          )
        }
      }
      let key_tag_val = tag(key_field.type_.unwrap(), 1, false)
      let value_tag_val = tag(value_field.type_.unwrap(), 2, false)
      let field_write_type_k = self.gen_kind_write(
        key_field,
        "k",
        async_=async_snake,
      )
      let field_write_type_v = self.gen_kind_write(
        value_field,
        "v",
        async_=async_snake,
      )
      content.write_string(
        (
          $|    writer |> @protobuf.\{async_snake}write_uint32(key_size + value_size)
          $|    writer |> @protobuf.\{async_snake}write_varint(\{key_tag_val}UL)
          $|    \{field_write_type_k}
          $|    writer |> @protobuf.\{async_snake}write_varint(\{value_tag_val}UL);
          $|    \{field_write_type_v}
          $|  }
          $| 
        ),
      )
    } else if field.is_list() {
      let tag_val = tag(field.type_.unwrap(), field_number, false)
      let field_write_type = self.gen_kind_write(
        field,
        "item",
        async_=async_snake,
      )
      content.write_string(
        (
          $|  for item in self.\{field_name} {
          $|    writer |> @protobuf.\{async_snake}write_varint(\{tag_val}UL)
          $|    \{field_write_type}
          $|  }
          $|
        ),
      )
    } else if field.is_optional() {
      let field_write_type = self.gen_kind_write(field, "v", async_=async_snake)
      let tag_val = tag(field.type_.unwrap(), field_number, false)
      content.write_string(
        (
          $|  match self.\{field_name} {
          $|    Some(v) => {
          $|      writer |> @protobuf.\{async_snake}write_varint(\{tag_val}UL);
          $|      \{field_write_type}
          $|    }
          $|    None => ()
          $|  }
          $|
        ),
      )
    } else {
      let field_write_type = self.gen_kind_write(
        field,
        "self.\{field_name}",
        async_=async_snake,
      )
      let tag_val = tag(field.type_.unwrap(), field_number, false)
      content.write_string(
        (
          $|  writer |> @protobuf.\{async_snake}write_varint(\{tag_val}UL);
          $|  \{field_write_type}
        ),
      )
    }
  }
  for oneof in message.oneofs {
    let oneof_name = self.get_oneof_enum_name(message, oneof.name)
    let oneof_field_name = oneof.name |> pascal_to_snake
    content.write_string("  match self.\{oneof_field_name} {\n")
    for field in oneof.field {
      let field_name = field.import_path.name() |> to_camel_case
      let field_number = field.number.unwrap()
      let tag_val = tag(field.type_.unwrap(), field_number, false)
      let field_write_type = self.gen_kind_write(field, "v", async_=async_snake)
      content.write_string(
        (
          $|    \{oneof_name}::\{field_name}(v) => {
          $|      writer |> @protobuf.\{async_snake}write_varint(\{tag_val}UL)
          $|      \{field_write_type}
          $|     }
          $|
        ),
      )
    }
    content.write_string(
      (
        $|    \{oneof_name}::NotSet => ()
        $|  }
        $|
      ),
    )
  }
  content.write_string("}\n")
}

///|
fn CodeGenerator::gen_kind_write(
  _ : CodeGenerator,
  field : Field,
  variable : String,
  async_~ : String = "",
) -> String raise {
  guard field.type_ is Some(field_type) else {
    raise UnexpectedType("Field type is not set: \{field.import_path.name()}")
  }
  match field_type {
    FieldType::TYPE_STRING =>
      "writer |> @protobuf.\{async_}write_string(\{variable})\n"
    FieldType::TYPE_BYTES =>
      "writer |> @protobuf.\{async_}write_bytes(\{variable})\n"
    FieldType::TYPE_MESSAGE =>
      "writer |> @protobuf.\{async_}write_uint32(@protobuf.size_of(\{variable})); \{variable}.\{async_}write(writer)\n"
    FieldType::TYPE_FIXED32 =>
      "writer |> @protobuf.\{async_}write_fixed32(\{variable})\n"
    FieldType::TYPE_SFIXED32 =>
      "writer |> @protobuf.\{async_}write_sfixed32(\{variable})\n"
    FieldType::TYPE_FLOAT =>
      "writer |> @protobuf.\{async_}write_float(\{variable})\n"
    FieldType::TYPE_FIXED64 =>
      "writer |> @protobuf.\{async_}write_fixed64(\{variable})\n"
    FieldType::TYPE_SFIXED64 =>
      "writer |> @protobuf.\{async_}write_sfixed64(\{variable})\n"
    FieldType::TYPE_DOUBLE =>
      "writer |> @protobuf.\{async_}write_double(\{variable})\n"
    FieldType::TYPE_BOOL =>
      "writer |> @protobuf.\{async_}write_bool(\{variable})\n"
    FieldType::TYPE_INT32 =>
      "writer |> @protobuf.\{async_}write_int32(\{variable})\n"
    FieldType::TYPE_INT64 =>
      "writer |> @protobuf.\{async_}write_int64(\{variable})\n"
    FieldType::TYPE_SINT32 =>
      "writer |> @protobuf.\{async_}write_sint32(\{variable})\n"
    FieldType::TYPE_SINT64 =>
      "writer |> @protobuf.\{async_}write_sint64(\{variable})\n"
    FieldType::TYPE_UINT32 =>
      "writer |> @protobuf.\{async_}write_uint32(\{variable})\n"
    FieldType::TYPE_UINT64 =>
      "writer |> @protobuf.\{async_}write_uint64(\{variable})\n"
    FieldType::TYPE_ENUM =>
      "writer |> @protobuf.\{async_}write_enum(\{variable}.to_enum())\n"
    _ =>
      raise UnexpectedType(
        "Unsupported field type: \{field_type} for field \{field.import_path.name()}",
      )
  }
}
