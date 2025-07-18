///|
pub(open) trait AsyncWriter {
  async write(Self, @bytes.View) -> Unit raise
}
