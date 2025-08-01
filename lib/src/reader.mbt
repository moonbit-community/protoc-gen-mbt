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

///| Trait representing the reader
pub(open) trait Reader {
  read(Self, FixedArray[Byte], offset~ : Int, max_length~ : Int) -> Int? raise
}

///|
let varint_bytes : FixedArray[Byte] = FixedArray::make(256, 0)

///|
fn[T : Reader] read_byte(reader : T) -> Byte raise {
  match reader.read(varint_bytes, offset=0, max_length=1) {
    Some(1) => varint_bytes[0]
    _ => raise EndOfStream
  }
}

///|
pub fn[T : Reader] read_tag(reader : T) -> (UInt, UInt) raise {
  let value = reader |> read_varint32()
  let tag = value >> 3
  let wire_type = value & 0x7
  if wire_type > 5 {
    raise ReaderError::UnknownWireType(wire_type)
  }
  (tag, wire_type)
}

///|
pub fn[T : Reader] read_varint32(reader : T) -> UInt raise {
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
fn[T : Reader] read_varint64(reader : T) -> UInt64 raise {
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
pub fn[T : Reader] read_int32(reader : T) -> Int raise {
  // if integer is negative, varint32 is encoded as 10 bytes
  reader |> read_varint64() |> UInt64::to_int()
}

///|
pub fn[T : Reader] read_int64(reader : T) -> Int64 raise {
  reader |> read_varint64() |> UInt64::reinterpret_as_int64()
}

///|
pub fn[T : Reader] read_uint32(reader : T) -> UInt raise {
  reader |> read_varint32()
}

///|
pub fn[T : Reader] read_uint64(reader : T) -> UInt64 raise {
  reader |> read_varint64()
}

///|
pub fn[T : Reader] read_sint32(reader : T) -> SInt raise {
  let n = reader |> read_varint32()
  // zigzag encoding
  (n >> 1).reinterpret_as_int() ^ -(n & 1).reinterpret_as_int()
}

///|
pub fn[T : Reader] read_sint64(reader : T) -> SInt64 raise {
  let n = reader |> read_varint64()
  // zigzag encoding
  (n >> 1).reinterpret_as_int64() ^ -(n & 1).reinterpret_as_int64()
}

///|
pub fn[T : Reader] read_fixed32(reader : T) -> UInt raise {
  guard reader.read(varint_bytes, offset=0, max_length=4) is Some(4) else {
    raise ReaderError::EndOfStream
  }
  let mut v : UInt = 0
  for i in 0..<4 {
    v = v | (varint_bytes[i].to_uint() << (i * 8))
  }
  v
}

///|
pub fn[T : Reader] read_fixed64(reader : T) -> UInt64 raise {
  guard reader.read(varint_bytes, offset=0, max_length=8) is Some(8) else {
    raise ReaderError::EndOfStream
  }
  let mut v : UInt64 = 0
  for i in 0..<8 {
    v = v | (varint_bytes[i].to_uint64() << (i * 8))
  }
  v
}

///|
pub fn[T : Reader] read_sfixed32(reader : T) -> Int raise {
  reader |> read_fixed32() |> UInt::reinterpret_as_int
}

///|
pub fn[T : Reader] read_sfixed64(reader : T) -> Int64 raise {
  reader |> read_fixed64() |> UInt64::reinterpret_as_int64
}

///|
pub fn[T : Reader] read_float(reader : T) -> Float raise {
  reader |> read_sfixed32() |> Int::reinterpret_as_float
}

///|
pub fn[T : Reader] read_double(reader : T) -> Double raise {
  reader |> read_sfixed64() |> Int64::reinterpret_as_double
}

///|
pub fn[T : Reader] read_bool(reader : T) -> Bool raise {
  (reader |> read_varint32()) != 0
}

///|
pub fn[T : Reader] read_enum(reader : T) -> Enum raise {
  reader |> read_uint32()
}

///|
pub fn[T : Reader] read_bytes(reader : T) -> Bytes raise {
  let length = reader |> read_int32()
  let bytes : FixedArray[Byte] = FixedArray::make(length, 0)
  let mut read_length = 0
  while read_length < length {
    match
      reader.read(bytes, offset=read_length, max_length=length - read_length) {
      Some(len) => read_length += len
      None => raise ReaderError::EndOfStream
    }
  }
  bytes.unsafe_reinterpret_as_bytes()
}

///|
pub fn[T : Reader] read_string(reader : T) -> String raise {
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
      guard reader.read(varint_bytes, offset=0, max_length=3) is Some(3) else {
        raise ReaderError::EndOfStream
      }
      let ch = ((b & 0x07) << 18) |
        ((varint_bytes[0].to_int() & 0x3F) << 12) |
        ((varint_bytes[1].to_int() & 0x3F) << 6) |
        (varint_bytes[2].to_int() & 0x3F)
      string.write_char(ch.unsafe_to_char())
      continue i + 4
    } else {
      raise ReaderError::InvalidString
    }
  }
  string.to_string()
}

///|
pub fn[M : Read + Default] read_message(
  reader : LimitedReader[&Reader],
) -> M raise {
  let len = reader |> read_int32()
  match len {
    0 => M::default()
    _ => {
      let new_limit = if reader.limit is Some(l) {
        if l < len {
          raise EndOfStream
        }
        Some(l - len)
      } else {
        None
      }
      reader.limit = Some(len)
      let msg = reader |> M::read_with_limit()
      reader.limit = new_limit
      msg
    }
  }
}

///| Reads packed repeated field (Array[M])
///
/// Note: packed field are stored as a variable length chunk of data, while regular repeated
/// fields behaves like an iterator, yielding their tag everytime
pub fn[M : Sized, R : Reader] read_packed(
  reader : R,
  read_fn : (LimitedReader[R]) -> M raise,
  size : UInt?,
) -> Array[M] raise {
  let len = reader |> read_varint32()
  let array = []
  let reader = LimitedReader::new(reader, limit=len.reinterpret_as_int())
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
pub fn[T : Reader] read_unknown(reader : T, wire_type : UInt) -> Unit raise {
  match wire_type {
    0 => reader |> read_varint64() |> ignore
    1 => reader |> read_fixed64() |> ignore
    2 => reader |> read_bytes() |> ignore
    5 => reader |> read_fixed32() |> ignore
    _ => raise ReaderError::UnknownWireType(wire_type)
  }
}
