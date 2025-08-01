///|
/// 
fn[T : Default + @protobuf.AsyncRead] from_bin_to_proto_message(
  file : String,
) -> T {
  let bytes = (try? @fs.read_file_to_bytes(file)).unwrap()
  let reader = @protobuf.BytesReader::from_bytes(bytes)
  let mut buf = T::default()
  async_run(async fn() -> Unit noraise {
    buf = @protobuf.AsyncRead::read(reader) catch { _ => T::default() }
  })
  buf
}

///|
fn[T : Default + @json.FromJson] from_json_to_proto_message(file : String) -> T {
  let string = (try? @fs.read_file_to_string(file)).unwrap()
  let json = @json.parse(string) catch {
    err => {
      println("Error parsing JSON: \{err}")
      Json::null()
    }
  }
  @json.from_json(json) catch {
    err => {
      println("Error converting JSON to proto message: \{err}")
      T::default()
    }
  }
}

///|
fn async_run(f : async () -> Unit noraise) -> Unit = "%async.run"

///|
test "proto3_test_case_1" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_1.bin",
  )
  @json.inspect(json, content={
    "fInt32": 42,
    "fInt64": "1234567890",
    "fBytes": "AQIDBA==",
    "fString": "Hello, World!",
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_1.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_2" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_2.bin",
  )
  @json.inspect(json, content={
    "fInt32": -42,
    "fInt64": "-1234567890",
    "fBool": true,
    "fFooEnum": "SECOND_VALUE",
    "fBytes": "BQYHCA==",
    "fString": "Test String",
    "fBarMessage": { "bInt32": 100 },
    "fRepeatedInt32": [1, 2, 3, 4, 5],
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_2.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_3" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_3.bin",
  )
  @json.inspect(json, content={
    "fInt32": 1000,
    "fInt64": "2000",
    "fString": "Another test string",
    "fRepeatedInt32": [10, 20, 30],
    "f3": "This is a oneof field",
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_3.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_4" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_4.bin",
  )
  @json.inspect(json, content={
    "fBool": true,
    "fDouble": 3.14,
    "fMap": { "key1": 1, "key2": 2, "key3": 3 },
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_4.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_5" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_5.bin",
  )
  @json.inspect(json, content={
    "fString": "Repeated Int32 Test",
    "fRepeatedInt32": [10, 20, 30],
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_5.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_6" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_6.bin",
  )
  @json.inspect(json, content={ "fBarMessage": { "bInt32": 100 } })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_6.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_7" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_7.bin",
  )
  @json.inspect(json, content={ "fInt32": -42, "fInt64": "-1234567890" })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_7.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_8" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_8.bin",
  )
  @json.inspect(json, content={ "fInt32": -1 })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_8.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_9" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_9.bin",
  )
  @json.inspect(json, content={
    "fString": "Test Repeated String",
    "fRepeatedString": ["test1", "test2", "test3"],
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_9.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_10" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_10.bin",
  )
  @json.inspect(json, content={
    "fUint32": 4294967295,
    "fUint64": "18446744073709551615",
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_10.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_11" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_11.bin",
  )
  @json.inspect(json, content={ "fSint32": -123, "fSint64": "-9876543210" })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_11.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_12" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_12.bin",
  )
  @json.inspect(json, content={
    "fFixed64": "1000000000000000000",
    "fSfixed64": "-500000000000000000",
    "fFixed32": 1000000000,
    "fSfixed32": -500000000,
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_12.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_13" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_13.bin",
  )
  @json.inspect(json, content={
    "fDouble": 2.718281828459045,
    "fFloat": 3.141590118408203,
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_13.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_14" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_14.bin",
  )
  @json.inspect(json, content={
    "fFooEnum": "SECOND_VALUE",
    "fString": "Enum test",
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_14.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_15" {
  let json : @gen_proto3.FooMessage = from_bin_to_proto_message(
    "../bin/proto3_test_case_15.bin",
  )
  @json.inspect(json, content={
    "fString": "Negative repeated integers",
    "fRepeatedPackedInt32": [-1, -2, -3, -4, -5],
    "fRepeatedPackedFloat": [
      1.100000023841858, 2.200000047683716, 3.299999952316284, 4.400000095367432,
      5.5,
    ],
  })
  let file_json : @gen_proto3.FooMessage = from_json_to_proto_message(
    "../bin/proto3_test_case_15.json",
  )
  assert_eq(file_json, json)
}

///|
test "proto3_test_case_16" {
  let json = (
    from_bin_to_proto_message("../bin/proto3_test_case_16.bin") :
    @gen_proto3.FooMessage)
  @json.inspect(json, content={
    "fBaz": {
      "nested": { "fNested": { "fNested": 42 } },
      "bInt64": "999888777",
      "bString": "Nested baz message",
    },
  })
  let message : @gen_proto3.FooMessage = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fBaz": {
      "nested": { "fNested": { "fNested": 42 } },
      "bInt64": "999888777",
      "bString": "Nested baz message",
    },
  })
}

///|
test "proto3_test_case_17" {
  let json = (
    from_bin_to_proto_message("../bin/proto3_test_case_17.bin") :
    @gen_proto3.FooMessage)
  @json.inspect(json, content={
    "fBytes": "QmluYXJ5IGRhdGEgd2l0aCBzcGVjaWFsIGNoYXJzOiAAAQL/",
  })
  let message : @gen_proto3.FooMessage = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fBytes": "QmluYXJ5IGRhdGEgd2l0aCBzcGVjaWFsIGNoYXJzOiAAAQL/",
  })
}

///|
test "proto3_test_case_18" {
  let json = (
    from_bin_to_proto_message("../bin/proto3_test_case_18.bin") :
    @gen_proto3.FooMessage)
  @json.inspect(json, content={
    "fString": "Unicode test: 你好世界 🌍 مرحبا بالعالم",
  })
  let message : @gen_proto3.FooMessage = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fString": "Unicode test: 你好世界 🌍 مرحبا بالعالم",
  })
}

///|
test "proto3_test_case_19" {
  let json = (
    from_bin_to_proto_message("../bin/proto3_test_case_19.bin") :
    @gen_proto3.FooMessage)
  @json.inspect(json, content={ "fString": "Oneof with F1", "f1": 12345 })
  let message : @gen_proto3.FooMessage = @json.from_json(json.to_json())
  @json.inspect(message, content={ "fString": "Oneof with F1", "f1": 12345 })
}

///|
test "proto3_test_case_20" {
  let json = (
    from_bin_to_proto_message("../bin/proto3_test_case_20.bin") :
    @gen_proto3.FooMessage)
  @json.inspect(json, content={ "fString": "Oneof with F2 bool", "f2": true })
  let message : @gen_proto3.FooMessage = @json.from_json(json.to_json())
  @json.inspect(message, content={ "fString": "Oneof with F2 bool", "f2": true })
}

///|
test "proto3_test_case_22" {
  let json = (
    from_bin_to_proto_message("../bin/proto3_test_case_20.bin") :
    @gen_proto3.EmptyMessageWithField)
  @json.inspect(json, content={})
  let message : @gen_proto3.EmptyMessageWithField = @json.from_json(
    json.to_json(),
  )
  @json.inspect(message, content={})
}
