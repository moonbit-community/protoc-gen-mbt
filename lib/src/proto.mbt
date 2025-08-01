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
pub(open) trait Read {
  read(&Reader) -> Self raise = _
  read_with_limit(LimitedReader[&Reader]) -> Self raise
}

///|
impl Read with read(reader : &Reader) -> Self raise {
  let reader = LimitedReader::new(reader)
  Read::read_with_limit(reader)
}

///|
pub(open) trait Write {
  write(Self, &Writer) -> Unit raise
}

///|
pub(open) trait AsyncRead {
  async read(&AsyncReader) -> Self raise = _
  async read_with_limit(LimitedReader[&AsyncReader]) -> Self raise
}

///|
impl AsyncRead with read(reader : &AsyncReader) -> Self raise {
  let reader = LimitedReader::new(reader)
  AsyncRead::read_with_limit(reader)
}

///|
pub(open) trait AsyncWrite {
  async write(Self, &AsyncWriter) -> Unit raise
}

///|
pub(open) trait Proto: Read + Write {}

///|
pub(open) trait AsyncProto: AsyncReader + AsyncWriter {}
