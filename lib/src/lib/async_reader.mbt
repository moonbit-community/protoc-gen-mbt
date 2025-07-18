///|
pub(open) trait AsyncReader {
  async read(Self, FixedArray[Byte], offset~ : Int, max_length~ : Int) -> Int? raise
}
