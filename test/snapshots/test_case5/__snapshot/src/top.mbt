pub(all) struct EmptyMessage {
} derive(Eq, Show)
pub impl @protobuf.Sized for EmptyMessage with size_of(_) {
  0
}
pub impl Default for EmptyMessage with default() -> EmptyMessage {
  EmptyMessage::{
  }
}
pub fn EmptyMessage::new() -> EmptyMessage {
  EmptyMessage::{
  }
}
pub impl @protobuf.Read for EmptyMessage with read_with_limit(_) -> EmptyMessage noraise {
  EmptyMessage::default()
}
pub impl @protobuf.Write for EmptyMessage with write(_, _) -> Unit noraise {
}
pub impl ToJson for EmptyMessage with to_json(_) {
  {}
}
pub impl @json.FromJson for EmptyMessage with from_json(_, _) -> EmptyMessage noraise {
  EmptyMessage::default()
}
pub impl @protobuf.AsyncWrite for EmptyMessage with write(_, _) -> Unit noraise {
}
pub impl @protobuf.AsyncRead for EmptyMessage with read_with_limit(_) -> EmptyMessage noraise {
  EmptyMessage::default()
}
