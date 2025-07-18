// Copyright 2025 International Digital Economy Academy
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

///|
pub(all) suberror ReaderError {
  UnexpectedEnd
  InvalidString
  UnknownWireType(UInt)
} derive(Eq, Show)

///| Trait representing the reader
/// 
/// `next_bytes` should be implemented at least, and calling `next_bytes(0)` should return an empty bytes if there are still bytes to read
pub(open) trait Reader {
  next(Self) -> Byte? = _
  next_bytes(Self, UInt) -> Bytes?
}

///|
impl Reader with next(self) {
  self.next_bytes(1).map(bytes => bytes[0])
}

///|
pub fn[T : Reader] is_eof(reader : T) -> Bool {
  reader.next_bytes(0).is_empty()
}

///|
fn[T : Reader] read_byte(reader : T) -> Byte raise ReaderError {
  match reader.next() {
    Some(b) => b
    None => raise UnexpectedEnd
  }
}

///|
pub fn[T : Reader] read_tag(reader : T) -> (UInt, UInt) raise ReaderError {
  let value = reader |> read_varint32()
  let tag = value >> 3
  let wire_type = value & 0x7
  if wire_type > 5 {
    raise ReaderError::UnknownWireType(wire_type)
  }
  (tag, wire_type)
}

///|
pub fn[T : Reader] read_varint32(reader : T) -> UInt raise ReaderError {
  let mut b = 0U
  for i in 0..<5 {
    let byte = reader |> read_byte() |> Byte::to_uint()
    b = ((byte & 0x7F) << (i * 7)) | b
    if (byte & 0x80) == 0 {
      return b
    }
  } else {
    b
  }
}

///|
fn[T : Reader] read_varint64(reader : T) -> UInt64 raise ReaderError {
  let mut b = 0UL
  for i in 0..<10 {
    let byte = reader |> read_byte() |> Byte::to_uint64()
    b = ((byte & 0x7F) << (i * 7)) | b
    if (byte & 0x80) == 0 {
      return b
    }
  } else {
    b
  }
}

///|
pub fn[T : Reader] read_int32(reader : T) -> Int raise ReaderError {
  // if integer is negative, varint32 is encoded as 10 bytes
  reader |> read_varint64() |> UInt64::to_int()
}

///|
pub fn[T : Reader] read_int64(reader : T) -> Int64 raise ReaderError {
  reader |> read_varint64() |> UInt64::reinterpret_as_int64()
}

///|
pub fn[T : Reader] read_uint32(reader : T) -> UInt raise ReaderError {
  reader |> read_varint32()
}

///|
pub fn[T : Reader] read_uint64(reader : T) -> UInt64 raise ReaderError {
  reader |> read_varint64()
}

///|
pub fn[T : Reader] read_sint32(reader : T) -> SInt raise ReaderError {
  let n = reader |> read_varint32()
  // zigzag encoding
  (n >> 1).reinterpret_as_int() ^ -(n & 1).reinterpret_as_int()
}

///|
pub fn[T : Reader] read_sint64(reader : T) -> SInt64 raise ReaderError {
  let n = reader |> read_varint64()
  // zigzag encoding
  (n >> 1).reinterpret_as_int64() ^ -(n & 1).reinterpret_as_int64()
}

///|
pub fn[T : Reader] read_fixed32(reader : T) -> UInt raise ReaderError {
  guard reader.next_bytes(4) is Some(bytes) else {
    raise ReaderError::UnexpectedEnd
  }
  let mut v : UInt = 0
  for i, b in bytes {
    v = v | (b.to_uint() << (i * 8))
  }
  v
}

///|
pub fn[T : Reader] read_fixed64(reader : T) -> UInt64 raise ReaderError {
  guard reader.next_bytes(8) is Some(bytes) else {
    raise ReaderError::UnexpectedEnd
  }
  let mut v : UInt64 = 0
  for i, b in bytes {
    v = v | (b.to_uint64() << (i * 8))
  }
  v
}

///|
pub fn[T : Reader] read_sfixed32(reader : T) -> Int raise ReaderError {
  reader |> read_fixed32() |> UInt::reinterpret_as_int
}

///|
pub fn[T : Reader] read_sfixed64(reader : T) -> Int64 raise ReaderError {
  reader |> read_fixed64() |> UInt64::reinterpret_as_int64
}

///|
pub fn[T : Reader] read_float(reader : T) -> Float raise ReaderError {
  reader |> read_sfixed32() |> Int::reinterpret_as_float
}

///|
pub fn[T : Reader] read_double(reader : T) -> Double raise ReaderError {
  reader |> read_sfixed64() |> Int64::reinterpret_as_double
}

///|
pub fn[T : Reader] read_bool(reader : T) -> Bool raise ReaderError {
  (reader |> read_varint32()) != 0
}

///|
pub fn[T : Reader] read_enum(reader : T) -> Enum raise ReaderError {
  reader |> read_uint32()
}

///|
pub fn[T : Reader] read_bytes(reader : T) -> Bytes raise ReaderError {
  let length = reader |> read_int32()
  guard reader.next_bytes(length.reinterpret_as_uint()) is Some(bytes) else {
    raise ReaderError::UnexpectedEnd
  }
  bytes
}

///|
pub fn[T : Reader] read_string(reader : T) -> String raise ReaderError {
  let length = reader |> read_int32()
  let string = StringBuilder::new()
  for i = 0; i < length; {
    let b = reader |> read_byte() |> Byte::to_int()
    if b < 0x80 {
      string.write_char(b.unsafe_to_char())
      continue i + 1
    } else if b < 0xE0 {
      if i + 1 == length {
        raise ReaderError::InvalidString
      }
      let b2 = reader |> read_byte() |> Byte::to_int()
      let ch = ((b & 0x1F) << 6) | (b2 & 0x3F)
      string.write_char(ch.unsafe_to_char())
      continue i + 2
    } else if b < 0xF0 {
      if i + 2 >= length {
        raise ReaderError::InvalidString
      }
      let b2 = reader |> read_byte() |> Byte::to_int()
      let b3 = reader |> read_byte() |> Byte::to_int()
      let ch = ((b & 0x0F) << 12) | ((b2 & 0x3F) << 6) | (b3 & 0x3F)
      string.write_char(ch.unsafe_to_char())
      continue i + 3
    } else if b < 0xF8 {
      if i + 3 >= length {
        raise ReaderError::InvalidString
      }
      guard reader.next_bytes(3) is Some(bytes) else {
        raise ReaderError::UnexpectedEnd
      }
      let ch = ((b & 0x07) << 18) |
        ((bytes[0].to_int() & 0x3F) << 12) |
        ((bytes[1].to_int() & 0x3F) << 6) |
        (bytes[2].to_int() & 0x3F)
      string.write_char(ch.unsafe_to_char())
      continue i + 4
    } else {
      raise ReaderError::InvalidString
    }
  }
  string.to_string()
}

///|
pub fn[M : Read + Default, R : Reader] read_message(
  reader : R
) -> M raise ReaderError {
  let len = reader |> read_varint32()
  match len {
    0 => M::default()
    _ => {
      guard reader.next_bytes(len) is Some(bytes) else {
        raise ReaderError::UnexpectedEnd
      }
      let reader = bytes |> BytesReader::from_bytes
      reader |> M::read()
    }
  }
}

///| Reads packed repeated field (Array[M])
///
/// Note: packed field are stored as a variable length chunk of data, while regular repeated
/// fields behaves like an iterator, yielding their tag everytime
pub fn[M : Sized, R : Reader] read_packed(
  reader : R,
  read_fn : (&Reader) -> M raise ReaderError,
  size : UInt?
) -> Array[M] raise ReaderError {
  let len = reader |> read_varint32()
  guard reader.next_bytes(len) is Some(bytes) else {
    raise ReaderError::UnexpectedEnd
  }
  let reader = bytes |> BytesReader::from_bytes
  let array = []
  match size {
    Some(size) =>
      for i = 0U; i < len / size; i = i + 1 {
        array.push(reader |> read_fn())
      }
    None =>
      for i = 0U; i < len; {
        let value = reader |> read_fn()
        let size = value.size_of()
        array.push(value)
        continue i + size
      }
  }
  array
}

///|
pub fn[T : Reader] read_unknown(
  reader : T,
  wire_type : UInt
) -> Unit raise ReaderError {
  match wire_type {
    0 => reader |> read_varint64() |> ignore
    1 => reader |> read_fixed64() |> ignore
    2 => reader |> read_bytes() |> ignore
    5 => reader |> read_fixed32() |> ignore
    _ => raise ReaderError::UnknownWireType(wire_type)
  }
}
