pub(all) struct EmptyMessage {
} derive(Eq, Show)
pub impl @protobuf.Sized for EmptyMessage with size_of(_) {
  0
}
pub impl Default for EmptyMessage with default() -> EmptyMessage {
  EmptyMessage::{
  }
}
pub async fn[R] EmptyMessage::read(reader : R) -> EmptyMessage noraise {
  let reader = @protobuf.LimitedReader::new(reader)
  EmptyMessage::read_with_limit(reader)
}
pub async fn[R] EmptyMessage::read_with_limit(_ : @protobuf.LimitedReader[R], _limit ?: Int) -> EmptyMessage noraise {
  EmptyMessage::default()
}
pub async fn[W] EmptyMessage::write(_: Self, _ : W) -> Unit noraise {
}
pub impl ToJson for EmptyMessage with to_json(_) {
  {}
}
pub impl @json.FromJson for EmptyMessage with from_json(json: Json, path: @json.JsonPath) -> EmptyMessage noraise {
  EmptyMessage::default()
}
