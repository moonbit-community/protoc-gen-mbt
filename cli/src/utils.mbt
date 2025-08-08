///|
fn convert_args(args : String) -> Map[String, String] {
  let params = {}
  let parts = args.split(",")
  for part in parts {
    let key_value = part.split("=").collect()
    if key_value.length() == 2 {
      let key = key_value[0].trim_space()
      let value = key_value[1].trim_space()
      if key.is_empty() || value.is_empty() {
        continue
      }
      params[key.to_string()] = value.to_string()
    }
  }
  return params
}

///|
fn title(s : String) -> String {
  let sb = StringBuilder::new()
  let mut is_word_start = true
  for c in s {
    if c == ' ' {
      sb.write_char(' ')
      is_word_start = true
    } else if is_word_start {
      sb.write_char(c.to_ascii_uppercase())
      is_word_start = false
    } else {
      sb.write_char(c)
    }
  }
  sb.to_string()
}

///|
test "title" {
  inspect(title("hello world"), content="Hello World")
  inspect(title("the quick brown fox"), content="The Quick Brown Fox")
  inspect(title("a b c"), content="A B C")
}

///|
test "title/edge_cases" {
  inspect(title(""), content="")
  inspect(title(" "), content=" ")
  inspect(title("  "), content="  ")
  inspect(title("hello"), content="Hello")
}

///|
test "title/special_characters" {
  inspect(title("hello  world UK"), content="Hello  World UK")
  inspect(title(" hello world"), content=" Hello World")
  inspect(title("hello world "), content="Hello World ")
  inspect(title("123 abc"), content="123 Abc")
}

///|
fn to_camel_case(s : String) -> String {
  let b = StringBuilder::new()
  let chars = s.to_array()
  let len = chars.length()
  let mut i = 0
  while i < len {
    let c = chars[i]
    if (c == '.' || c == '_') &&
      i + 1 < len &&
      chars[i + 1].is_ascii_lowercase() {
      i += 1
      continue
    } else if c == '.' {
      b.write_char('_')
    } else if c == '_' && (i == 0 || chars[i - 1] == '.') {
      b.write_char('X')
    } else if c.is_ascii_digit() {
      b.write_char(c)
    } else {
      let upper_c = c.to_ascii_uppercase()
      b.write_char(upper_c)
      while i + 1 < len && chars[i + 1].is_ascii_lowercase() {
        i += 1
        b.write_char(chars[i])
      }
    }
    i += 1
  }
  return b.to_string()
}

///|
test "to_camel_case" {
  inspect(to_camel_case("hello_world"), content="HelloWorld")
  inspect(to_camel_case("test.proto"), content="TestProto")
  inspect(to_camel_case("_start"), content="Start")
  inspect(to_camel_case("simple"), content="Simple")
  inspect(to_camel_case("test123"), content="Test123")
  inspect(to_camel_case("xml_http_request"), content="XmlHttpRequest")
}

///|
fn pascal_to_snake(name : String) -> String {
  let keywords = [
    "as", "else", "extern", "fn", "fnalias", "if", "let", "const", "match", "using",
    "mut", "type", "typealias", "struct", "enum", "trait", "traitalias", "derive",
    "while", "break", "continue", "import", "return", "throw", "raise", "try", "catch",
    "pub", "priv", "readonly", "true", "false", "_", "test", "loop", "for", "in",
    "impl", "with", "guard", "async", "is", "suberror", "and", "letrec", "enumview",
    "noraise", "defer", "module", "move", "ref", "static", "super", "unsafe", "use",
    "where", "await", "dyn", "abstract", "do", "final", "macro", "override", "typeof",
    "virtual", "yield", "local", "method", "alias", "assert", "package", "recur",
    "using", "enumview", "isnot", "define", "downcast", "inherit", "member", "namespace",
    "static", "upcast", "use", "void", "lazy", "include", "mixin", "protected", "sealed",
    "constructor", "atomic", "volatile", "anyframe", "anytype", "asm", "await", "comptime",
    "errdefer", "export", "opaque", "orelse", "resume", "threadlocal", "unreachable",
    "dynclass", "dynobj", "dynrec", "var", "finally", "noasync", "init", "main"
  ]
  let new_name = StringBuilder::new()
  let upper = StringBuilder::new()
  let prev = '_'

  loop (name[:], prev) {
    (['A'..='Z' as c, .. rest], prev) => {
      if upper.is_empty() && prev != '_' {
        upper.write_char('_')
      }
      upper.write_char(c.to_ascii_lowercase())
      continue (rest, c)
    }
    ([c, .. rest], _) => {
      if not(upper.is_empty()) {
        new_name.write_string(upper.to_string())
        upper.reset()
      }
      new_name.write_char(c)
      continue (rest, c)
    }
    ([], _) => {
      if not(upper.is_empty()) {
        new_name.write_string(upper.to_string())
      }
      break
    }
  }
  if keywords.contains(new_name.to_string()) {
    new_name.write_char('_')
  }
  return new_name.to_string()
}

///|
fn sizeFixed32() -> UInt {
  return 4U
}

///|
fn sizeFixed64() -> UInt {
  return 8U
}

///|
fn size_tag(num : Int) -> Int {
  size_varint(encode_tag(num, 0))
}

///|
fn size_varint(v : UInt64) -> Int {
  let len64 = if v == 0UL { 1 } else { 64 - v.clz() }
  (9 * len64 + 64) / 64
}

///|
fn encode_tag(num : Int, typ : Int) -> UInt64 {
  (num.to_uint64() << 3) | (typ & 7).to_uint64()
}

///|
fn tag(kind : FieldType, number : Int, is_packed : Bool) -> UInt64 {
  if is_packed {
    return encode_tag(number, 2) // BytesType
  }
  match kind {
    FieldType::TYPE_BOOL
    | FieldType::TYPE_ENUM
    | FieldType::TYPE_INT32
    | FieldType::TYPE_INT64
    | FieldType::TYPE_SINT32
    | FieldType::TYPE_SINT64
    | FieldType::TYPE_UINT32
    | FieldType::TYPE_UINT64 => encode_tag(number, 0) // VarintType
    FieldType::TYPE_FIXED32
    | FieldType::TYPE_SFIXED32
    | FieldType::TYPE_FLOAT => encode_tag(number, 5) // Fixed32Type
    FieldType::TYPE_FIXED64
    | FieldType::TYPE_SFIXED64
    | FieldType::TYPE_DOUBLE => encode_tag(number, 1) // Fixed64Type
    FieldType::TYPE_STRING | FieldType::TYPE_BYTES | FieldType::TYPE_MESSAGE =>
      encode_tag(number, 2) // BytesType
    _ => panic()
  }
}

///|
test "pascal_to_snake" {
  inspect(pascal_to_snake("PascalCase"), content="pascal_case")
  inspect(pascal_to_snake("SimpleWord"), content="simple_word")
  inspect(pascal_to_snake("XMLHttpRequest"), content="xmlhttp_request")
  inspect(pascal_to_snake("HTTPSConnection"), content="httpsconnection")
}

///|
test "pascal_to_snake/edge_cases" {
  inspect(pascal_to_snake(""), content="")
  inspect(pascal_to_snake("A"), content="a")
  inspect(pascal_to_snake("ABC"), content="abc")
  inspect(pascal_to_snake("lowercase"), content="lowercase")
}

///|
test "pascal_to_snake/keywords" {
  inspect(pascal_to_snake("Type"), content="type_")
  inspect(pascal_to_snake("Match"), content="match_")
  inspect(pascal_to_snake("New"), content="new")
}
