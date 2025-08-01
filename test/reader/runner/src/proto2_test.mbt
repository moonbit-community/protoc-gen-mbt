///|
test "proto2_test_case_1" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_1.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 42,
    "fInt64": "1234567890",
    "fFooEnum": "FIRST_VALUEX",
    "fBytes": "AQIDBA==",
    "fString": "Hello, World!",
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 42,
    "fInt64": "1234567890",
    "fFooEnum": "FIRST_VALUEX",
    "fBytes": "AQIDBA==",
    "fString": "Hello, World!",
  })
}

///|
test "proto2_test_case_2" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_2.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 42,
    "fInt64": "1234567890",
    "fRepeatedInt32": [1, 2, 3, 4, 5],
    "fRepeatedPackedInt32": [6, 7, 8, 9, 10],
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 42,
    "fInt64": "1234567890",
    "fRepeatedInt32": [1, 2, 3, 4, 5],
    "fRepeatedPackedInt32": [6, 7, 8, 9, 10],
  })
}

///|
test "proto2_test_case_3" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_3.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": -42,
    "fInt64": "-1234567890",
    "fDefaultBool": false,
    "fDefaultDouble": 3.2229,
    "fDefaultEnum": "FIRST_VALUEX",
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": -42,
    "fInt64": "-1234567890",
    "fDefaultBool": false,
    "fDefaultDouble": 3.2229,
    "fDefaultEnum": "FIRST_VALUEX",
  })
}

///|
test "proto2_test_case_4" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_4.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 2147483647,
    "fInt64": "9223372036854775807",
    "fUint32": 4294967295,
    "fUint64": "18446744073709551615",
    "fSint32": -2147483648,
    "fSint64": "-9223372036854775808",
    "fFixed64": "987654321012345",
    "fSfixed64": "-987654321012345",
    "fFixed32": 123456789,
    "fSfixed32": -123456789,
    "fDouble": 123.456789,
    "fFloat": 78.90119934082031,
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 2147483647,
    "fInt64": "9223372036854775807",
    "fUint32": 4294967295,
    "fUint64": "18446744073709551615",
    "fSint32": -2147483648,
    "fSint64": "-9223372036854775808",
    "fFixed64": "987654321012345",
    "fSfixed64": "-987654321012345",
    "fFixed32": 123456789,
    "fSfixed32": -123456789,
    "fDouble": 123.456789,
    "fFloat": 78.90119934082031,
  })
}

///|
test "proto2_test_case_5" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_5.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 100,
    "fInt64": "200",
    "fBool": true,
    "fFooEnum": "SECOND_VALUEX",
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 100,
    "fInt64": "200",
    "fBool": true,
    "fFooEnum": "SECOND_VALUEX",
  })
}

///|
test "proto2_test_case_6" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_6.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 300,
    "fInt64": "400",
    "fBarMessage": { "bInt32": 500 },
    "fBaz": {
      "nested": { "fNested": { "fNested": 700 } },
      "bInt64": "600",
      "bString": "nested baz message",
    },
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 300,
    "fInt64": "400",
    "fBarMessage": { "bInt32": 500 },
    "fBaz": {
      "nested": { "fNested": { "fNested": 700 } },
      "bInt64": "600",
      "bString": "nested baz message",
    },
  })
}

///|
test "proto2_test_case_7" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_7.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 800,
    "fInt64": "900",
    "fRepeatedInt32": [10, 20, 30, 40, 50],
    "fRepeatedPackedInt32": [60, 70, 80, 90, 100],
    "fRepeatedPackedFloat": [
      1.100000023841858, 2.200000047683716, 3.299999952316284, 4.400000095367432,
      5.5,
    ],
    "fRepeatedString": ["first", "second", "third"],
    "fRepeatedBazMessage": [
      { "bInt64": "1001", "bString": "first repeated baz" },
      { "bInt64": "1002", "bString": "second repeated baz" },
    ],
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 800,
    "fInt64": "900",
    "fRepeatedInt32": [10, 20, 30, 40, 50],
    "fRepeatedPackedInt32": [60, 70, 80, 90, 100],
    "fRepeatedPackedFloat": [
      1.100000023841858, 2.200000047683716, 3.299999952316284, 4.400000095367432,
      5.5,
    ],
    "fRepeatedString": ["first", "second", "third"],
    "fRepeatedBazMessage": [
      { "bInt64": "1001", "bString": "first repeated baz" },
      { "bInt64": "1002", "bString": "second repeated baz" },
    ],
  })
}

///|
test "proto2_test_case_8" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_8.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={ "fBool": false, "fBytes": "", "fString": "" })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={ "fBool": false, "fBytes": "", "fString": "" })
}

///|
test "proto2_test_case_9" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_9.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": -1,
    "fInt64": "-1",
    "fBytes": "AP9/gAH+",
    "fString": "Special chars: !@#$%^&*()_+{}|:<>?[]\\;',./",
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": -1,
    "fInt64": "-1",
    "fBytes": "AP9/gAH+",
    "fString": "Special chars: !@#$%^&*()_+{}|:<>?[]\\;',./",
  })
}

///|
test "proto2_test_case_10" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_10.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 12345,
    "fInt64": "67890",
    "fBytes": "VVRGLTggYnl0ZXM6IOa1i+ivlQ==",
    "fString": "Unicode: 你好世界 🌍 こんにちは العالم",
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 12345,
    "fInt64": "67890",
    "fBytes": "VVRGLTggYnl0ZXM6IOa1i+ivlQ==",
    "fString": "Unicode: 你好世界 🌍 こんにちは العالم",
  })
}

///|
test "proto2_test_case_11" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_11.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 111,
    "fInt64": "222",
    "fNested": { "fNested": { "fNested": 333 } },
    "fNestedEnum": "Bar",
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 111,
    "fInt64": "222",
    "fNested": { "fNested": { "fNested": 333 } },
    "fNestedEnum": "Bar",
  })
}

///|
test "proto2_test_case_12" {
  let json = (
    from_file_to_proto_message("../bin/proto2_test_case_12.bin") :
    @gen_proto2.FooMessageP2)
  @json.inspect(json, content={
    "fInt32": 444,
    "fInt64": "555",
    "f1": 666,
    "f2": true,
    "f3": "f3 value",
    "fOptionalString": "optional string value",
  })
  let message : @gen_proto2.FooMessageP2 = @json.from_json(json.to_json())
  @json.inspect(message, content={
    "fInt32": 444,
    "fInt64": "555",
    "f1": 666,
    "f2": true,
    "f3": "f3 value",
    "fOptionalString": "optional string value",
  })
}
