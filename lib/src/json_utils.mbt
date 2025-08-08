///|
pub fn base64_encode(data : Bytes) -> String {
  let base64 = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  let buf = StringBuilder::new()
  let len = data.length()
  let rem = len % 3
  for i = 0; i < len - rem; i = i + 3 {
    let b0 = data[i].to_int()
    let b1 = data[i + 1].to_int()
    let b2 = data[i + 2].to_int()
    let x0 = base64[(b0 & 0xFC) >> 2]
    let x1 = base64[((b0 & 0x03) << 4) | ((b1 & 0xF0) >> 4)]
    let x2 = base64[((b1 & 0x0F) << 2) | ((b2 & 0xC0) >> 6)]
    let x3 = base64[b2 & 0x3F]
    buf.write_char(x0.to_char())
    buf.write_char(x1.to_char())
    buf.write_char(x2.to_char())
    buf.write_char(x3.to_char())
  }
  if rem == 1 {
    let b0 = data[len - 1].to_int()
    let x0 = base64[(b0 & 0xFC) >> 2]
    let x1 = base64[(b0 & 0x03) << 4]
    buf.write_char(x0.to_char())
    buf.write_char(x1.to_char())
    buf.write_char('=')
    buf.write_char('=')
  } else if rem == 2 {
    let b0 = data[len - 2].to_int()
    let b1 = data[len - 1].to_int()
    let x0 = base64[(b0 & 0xFC) >> 2]
    let x1 = base64[((b0 & 0x03) << 4) | ((b1 & 0xF0) >> 4)]
    let x2 = base64[(b1 & 0x0F) << 2]
    buf.write_char(x0.to_char())
    buf.write_char(x1.to_char())
    buf.write_char(x2.to_char())
    buf.write_char('=')
  }
  buf.to_string()
}

///|
pub fn base64_decode(s : String) -> Bytes {
  let base64 = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  let input_length = s.length()
  let output_length = input_length / 4 * 3 -
    (match s {
      [.., '=', '='] => 2
      [.., '='] => 1
      _ => 0
    })
  let buf = Array::new(capacity=output_length)
  let rev_table : Array[Byte] = Array::make(256, 0)
  for j = 0; j < 64; j = j + 1 {
    rev_table[base64[j].to_int()] = j.to_byte()
  }
  let get_char = fn(i : Int) -> Byte {
    if s.get_char(i).unwrap() == '=' {
      0
    } else {
      rev_table[s.get_char(i).unwrap().to_int()]
    }
  }
  for i = 0; i < input_length; i = i + 4 {
    let b0 = get_char(i)
    let b1 = get_char(i + 1)
    let b2 = get_char(i + 2)
    let b3 = get_char(i + 3)
    let triplet = (b0.to_int() << 18) |
      (b1.to_int() << 12) |
      (b2.to_int() << 6) |
      b3.to_int()
    for j = 2; j >= 0 && buf.length() < output_length; j = j - 1 {
      buf.push((triplet >> (j * 8)).to_byte())
    }
  }
  Bytes::from_array(buf)
}

///|
test "decode/encode" {
  let data = b"Hello, World!"
  let encoded = base64_encode(data)
  inspect(encoded, content="SGVsbG8sIFdvcmxkIQ==")
  let decoded = base64_decode(encoded)
  inspect(
    decoded,
    content=(
      #|b"\x48\x65\x6c\x6c\x6f\x2c\x20\x57\x6f\x72\x6c\x64\x21"
    ),
  )
  assert_eq(data, decoded)
}

///|
test "decode/encode emoji" {
  let data = b"\xf0\x9f\x98\x80" // 😀
  let encoded = base64_encode(data)
  inspect(encoded, content="8J+YgA==")
  let decoded = base64_decode(encoded)
  inspect(
    decoded,
    content=(
      #|b"\xf0\x9f\x98\x80"
    ),
  )
  assert_eq(data, decoded)
}
