// Copyright 2024 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

///| Trait representing the Writer
pub(open) trait Writer {
  write(Self, @bytes.View) -> Unit raise
}

///|
impl Writer with write_byte(self, byte) {
  self.write_bytes(Bytes::make(1, byte))
}

///|
pub fn[T : Writer] write_varint(writer : T, input : UInt64) -> Unit {
  let mut v = input
  while v >= 0x80 {
    writer.write_byte((v.to_byte() & 0x7F) | 0x80)
    v = v >> 7
  }
  writer.write_byte(v.to_byte())
}

///|
pub fn[T : Writer] write_tag(writer : T, tag : (UInt, UInt)) -> Unit {
  let (tag, wire_type) = tag
  writer |> write_varint(((tag << 3) | wire_type).to_uint64())
}

///|
pub fn[T : Writer] write_int32(writer : T, v : Int) -> Unit {
  writer |> write_varint(v.to_uint64())
}

///|
pub fn[T : Writer] write_int64(writer : T, v : Int64) -> Unit {
  writer |> write_varint(v.reinterpret_as_uint64())
}

///|
pub fn[T : Writer] write_uint32(writer : T, v : UInt) -> Unit {
  writer |> write_varint(v.to_uint64())
}

///|
pub fn[T : Writer] write_uint64(writer : T, v : UInt64) -> Unit {
  writer |> write_varint(v)
}

///|
pub fn[T : Writer] write_sint32(writer : T, v : Int) -> Unit {
  writer |> write_varint(((v << 1) ^ (v >> 31)).to_uint64())
}

///|
pub fn[T : Writer] write_sint64(writer : T, v : Int64) -> Unit {
  writer |> write_varint(((v << 1) ^ (v >> 63)).reinterpret_as_uint64())
}

///|
pub fn[T : Writer] write_fixed32(writer : T, v : UInt) -> Unit {
  let mut v = v
  for i in 0..<4 {
    writer.write_byte((v & 0xFF) |> UInt::to_byte())
    v = v >> 8
  }
}

///|
pub fn[T : Writer] write_fixed64(writer : T, v : UInt64) -> Unit {
  let mut v = v
  for i in 0..<8 {
    writer.write_byte((v & 0xFF) |> UInt64::to_byte())
    v = v >> 8
  }
}

///|
pub fn[T : Writer] write_sfixed32(writer : T, v : Int) -> Unit {
  writer |> write_fixed32(v.reinterpret_as_uint())
}

///|
pub fn[T : Writer] write_sfixed64(writer : T, v : Int64) -> Unit {
  writer |> write_fixed64(v.reinterpret_as_uint64())
}

///|
pub fn[T : Writer] write_float(writer : T, v : Float) -> Unit {
  writer |> write_fixed32(v.reinterpret_as_uint())
}

///|
pub fn[T : Writer] write_double(writer : T, v : Double) -> Unit {
  writer |> write_fixed64(v.reinterpret_as_uint64())
}

///|
pub fn[T : Writer] write_bool(writer : T, v : Bool) -> Unit {
  writer.write_byte(if v { 1 } else { 0 })
}

///|
pub fn[T : Writer] write_enum(writer : T, v : Enum) -> Unit {
  writer |> write_varint(v.inner().to_uint64())
}

///|
pub fn[T : Writer] write_bytes(writer : T, v : Bytes) -> Unit {
  let length = v.length()
  writer |> write_varint(length.to_uint64())
  writer.write_bytes(v)
}

///|
pub fn[T : Writer] write_string(writer : T, v : String) -> Unit {
  let utf8_string = @buffer.new()
  for ch in v {
    let ch = ch.to_int()
    if ch < 0x80 {
      utf8_string.write_byte(ch.to_byte())
    } else if ch < 0x800 {
      utf8_string.write_byte((0xC0 | (ch >> 6)).to_byte())
      utf8_string.write_byte((0x80 | (ch & 0x3F)).to_byte())
    } else if ch < 0x10000 {
      utf8_string.write_byte((0xE0 | (ch >> 12)).to_byte())
      utf8_string.write_byte((0x80 | ((ch >> 6) & 0x3F)).to_byte())
      utf8_string.write_byte((0x80 | (ch & 0x3F)).to_byte())
    } else {
      utf8_string.write_byte((0xF0 | (ch >> 18)).to_byte())
      utf8_string.write_byte((0x80 | ((ch >> 12) & 0x3F)).to_byte())
      utf8_string.write_byte((0x80 | ((ch >> 6) & 0x3F)).to_byte())
      utf8_string.write_byte((0x80 | (ch & 0x3F)).to_byte())
    }
  }
  let utf8_string = utf8_string.to_bytes()
  writer |> write_varint(utf8_string.length().reinterpret_as_uint().to_uint64())
  writer.write_bytes(utf8_string)
}
