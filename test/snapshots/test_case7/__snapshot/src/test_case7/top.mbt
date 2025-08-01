pub(all) struct TreeNode {
  mut name : String
  mut value : Int?
  mut parent : TreeNode?
  mut children : Array[TreeNode]
  mut sibling : TreeNode?
} derive(Eq, Show)
pub impl @protobuf.Sized for TreeNode with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.name); @protobuf.size_of(size) + size }
  match self.value {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  match self.parent {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.children.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.sibling {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for TreeNode with default() -> TreeNode {
  TreeNode::{
    name : String::default(),
    value : None,
    parent : None,
    children : [],
    sibling : None,
  }
}
pub fn TreeNode::new(name : String, value? : Int, parent? : TreeNode, children : Array[TreeNode], sibling? : TreeNode) -> TreeNode {
  TreeNode::{
    name,
    value,
    parent,
    children,
    sibling,
  }
}
pub impl @protobuf.Read for TreeNode with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> TreeNode raise {
  let msg = TreeNode::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.value = reader |> @protobuf.read_int32() |> Some
      (3, _) => msg.parent = (reader |> @protobuf.read_message() : TreeNode) |> Some
      (4, _) => msg.children.push((reader |> @protobuf.read_message() : TreeNode))
      (5, _) => msg.sibling = (reader |> @protobuf.read_message() : TreeNode) |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for TreeNode with write(self: TreeNode, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.name)
  match self.value {
    Some(v) => {
      writer |> @protobuf.write_varint(16UL);
      writer |> @protobuf.write_int32(v)

    }
    None => ()
  }
  match self.parent {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
  for item in self.children {
    writer |> @protobuf.write_varint(34UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); @protobuf.Write::write(item, writer)

  }
  match self.sibling {
    Some(v) => {
      writer |> @protobuf.write_varint(42UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
}
pub impl ToJson for TreeNode with to_json(self) {
  let json: Map[String, Json] = {}
  if self.name != Default::default() {
  json["name"] = self.name.to_json()
  }
  match self.value {
      Some(v) => json["value"] = v.to_json()
      _ => ()
    }
  match self.parent {
      Some(v) => json["parent"] = v.to_json()
      _ => ()
    }
  if self.children != Default::default() {
  json["children"] = self.children.to_json()
  }
  match self.sibling {
      Some(v) => json["sibling"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for TreeNode with from_json(json: Json, path: @json.JsonPath) -> TreeNode raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for TreeNode"))
  }
  let message = TreeNode::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = @json.from_json(value, path~)
      ("value", value) => message.value = Some(@json.from_json(value, path~))
      ("parent", value) => message.parent = Some(@json.from_json(value, path~))
      ("children", Array(value)) => message.children = value.map(v => 
@json.from_json(v, path~))
      ("sibling", value) => message.sibling = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncWrite for TreeNode with write(self: TreeNode, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.name)
  match self.value {
    Some(v) => {
      writer |> @protobuf.async_write_varint(16UL);
      writer |> @protobuf.async_write_int32(v)

    }
    None => ()
  }
  match self.parent {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
  for item in self.children {
    writer |> @protobuf.async_write_varint(34UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); @protobuf.AsyncWrite::write(item, writer)

  }
  match self.sibling {
    Some(v) => {
      writer |> @protobuf.async_write_varint(42UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
}
pub impl @protobuf.AsyncRead for TreeNode with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> TreeNode raise {
  let msg = TreeNode::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.value = reader |> @protobuf.async_read_int32() |> Some
      (3, _) => msg.parent = (reader |> @protobuf.async_read_message() : TreeNode) |> Some
      (4, _) => msg.children.push((reader |> @protobuf.async_read_message() : TreeNode))
      (5, _) => msg.sibling = (reader |> @protobuf.async_read_message() : TreeNode) |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub(all) struct ListNode {
  mut data : String
  mut next : ListNode?
  mut prev : ListNode?
} derive(Eq, Show)
pub impl @protobuf.Sized for ListNode with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.data); @protobuf.size_of(size) + size }
  match self.next {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.prev {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for ListNode with default() -> ListNode {
  ListNode::{
    data : String::default(),
    next : None,
    prev : None,
  }
}
pub fn ListNode::new(data : String, next? : ListNode, prev? : ListNode) -> ListNode {
  ListNode::{
    data,
    next,
    prev,
  }
}
pub impl @protobuf.Read for ListNode with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> ListNode raise {
  let msg = ListNode::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.data = reader |> @protobuf.read_string()
      (2, _) => msg.next = (reader |> @protobuf.read_message() : ListNode) |> Some
      (3, _) => msg.prev = (reader |> @protobuf.read_message() : ListNode) |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for ListNode with write(self: ListNode, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.data)
  match self.next {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
  match self.prev {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
}
pub impl ToJson for ListNode with to_json(self) {
  let json: Map[String, Json] = {}
  if self.data != Default::default() {
  json["data"] = self.data.to_json()
  }
  match self.next {
      Some(v) => json["next"] = v.to_json()
      _ => ()
    }
  match self.prev {
      Some(v) => json["prev"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for ListNode with from_json(json: Json, path: @json.JsonPath) -> ListNode raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for ListNode"))
  }
  let message = ListNode::default()
  for key, value in obj {
    match (key, value) {
      ("data", value) => message.data = @json.from_json(value, path~)
      ("next", value) => message.next = Some(@json.from_json(value, path~))
      ("prev", value) => message.prev = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncWrite for ListNode with write(self: ListNode, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.data)
  match self.next {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
  match self.prev {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
}
pub impl @protobuf.AsyncRead for ListNode with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> ListNode raise {
  let msg = ListNode::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.data = reader |> @protobuf.async_read_string()
      (2, _) => msg.next = (reader |> @protobuf.async_read_message() : ListNode) |> Some
      (3, _) => msg.prev = (reader |> @protobuf.async_read_message() : ListNode) |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub(all) struct GraphNode {
  mut id : String
  mut label : String?
  mut neighbors : Array[GraphNode]
  mut visited : Bool?
} derive(Eq, Show)
pub impl @protobuf.Sized for GraphNode with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.id); @protobuf.size_of(size) + size }
  match self.label {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.neighbors.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  match self.visited {
    Some(v) => size += 1U + @protobuf.size_of(v)
    None => ()
  }
  size
}
pub impl Default for GraphNode with default() -> GraphNode {
  GraphNode::{
    id : String::default(),
    label : None,
    neighbors : [],
    visited : Some(false),
  }
}
pub fn GraphNode::new(id : String, label? : String, neighbors : Array[GraphNode], visited? : Bool) -> GraphNode {
  GraphNode::{
    id,
    label,
    neighbors,
    visited,
  }
}
pub impl @protobuf.Read for GraphNode with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> GraphNode raise {
  let msg = GraphNode::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.id = reader |> @protobuf.read_string()
      (2, _) => msg.label = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.neighbors.push((reader |> @protobuf.read_message() : GraphNode))
      (4, _) => msg.visited = reader |> @protobuf.read_bool() |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for GraphNode with write(self: GraphNode, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.id)
  match self.label {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  for item in self.neighbors {
    writer |> @protobuf.write_varint(26UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); @protobuf.Write::write(item, writer)

  }
  match self.visited {
    Some(v) => {
      writer |> @protobuf.write_varint(32UL);
      writer |> @protobuf.write_bool(v)

    }
    None => ()
  }
}
pub impl ToJson for GraphNode with to_json(self) {
  let json: Map[String, Json] = {}
  if self.id != Default::default() {
  json["id"] = self.id.to_json()
  }
  match self.label {
      Some(v) => json["label"] = v.to_json()
      _ => ()
    }
  if self.neighbors != Default::default() {
  json["neighbors"] = self.neighbors.to_json()
  }
  match self.visited {
      Some(v) if v != false => json["visited"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for GraphNode with from_json(json: Json, path: @json.JsonPath) -> GraphNode raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for GraphNode"))
  }
  let message = GraphNode::default()
  for key, value in obj {
    match (key, value) {
      ("id", value) => message.id = @json.from_json(value, path~)
      ("label", value) => message.label = Some(@json.from_json(value, path~))
      ("neighbors", Array(value)) => message.neighbors = value.map(v => 
@json.from_json(v, path~))
      ("visited", value) => message.visited = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncWrite for GraphNode with write(self: GraphNode, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.id)
  match self.label {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  for item in self.neighbors {
    writer |> @protobuf.async_write_varint(26UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); @protobuf.AsyncWrite::write(item, writer)

  }
  match self.visited {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
}
pub impl @protobuf.AsyncRead for GraphNode with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> GraphNode raise {
  let msg = GraphNode::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.id = reader |> @protobuf.async_read_string()
      (2, _) => msg.label = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.neighbors.push((reader |> @protobuf.async_read_message() : GraphNode))
      (4, _) => msg.visited = reader |> @protobuf.async_read_bool() |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub(all) struct NestedSelfRef_Inner {
  mut inner_name : String?
  mut outer_ref : NestedSelfRef?
  mut inner_ref : NestedSelfRef_Inner?
} derive(Eq, Show)
pub impl @protobuf.Sized for NestedSelfRef_Inner with size_of(self) {
  let mut size = 0U
  match self.inner_name {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.outer_ref {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.inner_ref {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for NestedSelfRef_Inner with default() -> NestedSelfRef_Inner {
  NestedSelfRef_Inner::{
    inner_name : None,
    outer_ref : None,
    inner_ref : None,
  }
}
pub fn NestedSelfRef_Inner::new(inner_name? : String, outer_ref? : NestedSelfRef, inner_ref? : NestedSelfRef_Inner) -> NestedSelfRef_Inner {
  NestedSelfRef_Inner::{
    inner_name,
    outer_ref,
    inner_ref,
  }
}
pub impl @protobuf.Read for NestedSelfRef_Inner with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> NestedSelfRef_Inner raise {
  let msg = NestedSelfRef_Inner::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.inner_name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.outer_ref = (reader |> @protobuf.read_message() : NestedSelfRef) |> Some
      (3, _) => msg.inner_ref = (reader |> @protobuf.read_message() : NestedSelfRef_Inner) |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for NestedSelfRef_Inner with write(self: NestedSelfRef_Inner, writer : &@protobuf.Writer) -> Unit raise {
  match self.inner_name {
    Some(v) => {
      writer |> @protobuf.write_varint(10UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.outer_ref {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
  match self.inner_ref {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
}
pub impl ToJson for NestedSelfRef_Inner with to_json(self) {
  let json: Map[String, Json] = {}
  match self.inner_name {
      Some(v) => json["innerName"] = v.to_json()
      _ => ()
    }
  match self.outer_ref {
      Some(v) => json["outerRef"] = v.to_json()
      _ => ()
    }
  match self.inner_ref {
      Some(v) => json["innerRef"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for NestedSelfRef_Inner with from_json(json: Json, path: @json.JsonPath) -> NestedSelfRef_Inner raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for NestedSelfRef_Inner"))
  }
  let message = NestedSelfRef_Inner::default()
  for key, value in obj {
    match (key, value) {
      ("innerName", value) => message.inner_name = Some(@json.from_json(value, path~))
      ("outerRef", value) => message.outer_ref = Some(@json.from_json(value, path~))
      ("innerRef", value) => message.inner_ref = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncWrite for NestedSelfRef_Inner with write(self: NestedSelfRef_Inner, writer : &@protobuf.AsyncWriter) -> Unit raise {
  match self.inner_name {
    Some(v) => {
      writer |> @protobuf.async_write_varint(10UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.outer_ref {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
  match self.inner_ref {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
}
pub impl @protobuf.AsyncRead for NestedSelfRef_Inner with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> NestedSelfRef_Inner raise {
  let msg = NestedSelfRef_Inner::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.inner_name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.outer_ref = (reader |> @protobuf.async_read_message() : NestedSelfRef) |> Some
      (3, _) => msg.inner_ref = (reader |> @protobuf.async_read_message() : NestedSelfRef_Inner) |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub(all) struct NestedSelfRef {
  mut name : String
  mut inner : NestedSelfRef_Inner?
  mut self_ref : NestedSelfRef?
} derive(Eq, Show)
pub impl @protobuf.Sized for NestedSelfRef with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.name); @protobuf.size_of(size) + size }
  match self.inner {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.self_ref {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size
}
pub impl Default for NestedSelfRef with default() -> NestedSelfRef {
  NestedSelfRef::{
    name : String::default(),
    inner : None,
    self_ref : None,
  }
}
pub fn NestedSelfRef::new(name : String, inner? : NestedSelfRef_Inner, self_ref? : NestedSelfRef) -> NestedSelfRef {
  NestedSelfRef::{
    name,
    inner,
    self_ref,
  }
}
pub impl @protobuf.Read for NestedSelfRef with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> NestedSelfRef raise {
  let msg = NestedSelfRef::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.inner = (reader |> @protobuf.read_message() : NestedSelfRef_Inner) |> Some
      (3, _) => msg.self_ref = (reader |> @protobuf.read_message() : NestedSelfRef) |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for NestedSelfRef with write(self: NestedSelfRef, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.name)
  match self.inner {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
  match self.self_ref {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
}
pub impl ToJson for NestedSelfRef with to_json(self) {
  let json: Map[String, Json] = {}
  if self.name != Default::default() {
  json["name"] = self.name.to_json()
  }
  match self.inner {
      Some(v) => json["inner"] = v.to_json()
      _ => ()
    }
  match self.self_ref {
      Some(v) => json["selfRef"] = v.to_json()
      _ => ()
    }
  Json::object(json)
}
pub impl @json.FromJson for NestedSelfRef with from_json(json: Json, path: @json.JsonPath) -> NestedSelfRef raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for NestedSelfRef"))
  }
  let message = NestedSelfRef::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = @json.from_json(value, path~)
      ("inner", value) => message.inner = Some(@json.from_json(value, path~))
      ("selfRef", value) => message.self_ref = Some(@json.from_json(value, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncWrite for NestedSelfRef with write(self: NestedSelfRef, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.name)
  match self.inner {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
  match self.self_ref {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
}
pub impl @protobuf.AsyncRead for NestedSelfRef with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> NestedSelfRef raise {
  let msg = NestedSelfRef::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.inner = (reader |> @protobuf.async_read_message() : NestedSelfRef_Inner) |> Some
      (3, _) => msg.self_ref = (reader |> @protobuf.async_read_message() : NestedSelfRef) |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub(all) struct Organization {
  mut name : String
  mut description : String?
  mut parent_org : Organization?
  mut sub_orgs : Array[Organization]
  mut employees : Array[Employee]
} derive(Eq, Show)
pub impl @protobuf.Sized for Organization with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.name); @protobuf.size_of(size) + size }
  match self.description {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.parent_org {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.sub_orgs.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size += self.employees.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for Organization with default() -> Organization {
  Organization::{
    name : String::default(),
    description : None,
    parent_org : None,
    sub_orgs : [],
    employees : [],
  }
}
pub fn Organization::new(name : String, description? : String, parent_org? : Organization, sub_orgs : Array[Organization], employees : Array[Employee]) -> Organization {
  Organization::{
    name,
    description,
    parent_org,
    sub_orgs,
    employees,
  }
}
pub impl @protobuf.Read for Organization with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> Organization raise {
  let msg = Organization::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.description = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.parent_org = (reader |> @protobuf.read_message() : Organization) |> Some
      (4, _) => msg.sub_orgs.push((reader |> @protobuf.read_message() : Organization))
      (5, _) => msg.employees.push((reader |> @protobuf.read_message() : Employee))
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for Organization with write(self: Organization, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.name)
  match self.description {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_string(v)

    }
    None => ()
  }
  match self.parent_org {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
  for item in self.sub_orgs {
    writer |> @protobuf.write_varint(34UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); @protobuf.Write::write(item, writer)

  }
  for item in self.employees {
    writer |> @protobuf.write_varint(42UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); @protobuf.Write::write(item, writer)

  }
}
pub impl ToJson for Organization with to_json(self) {
  let json: Map[String, Json] = {}
  if self.name != Default::default() {
  json["name"] = self.name.to_json()
  }
  match self.description {
      Some(v) => json["description"] = v.to_json()
      _ => ()
    }
  match self.parent_org {
      Some(v) => json["parentOrg"] = v.to_json()
      _ => ()
    }
  if self.sub_orgs != Default::default() {
  json["subOrgs"] = self.sub_orgs.to_json()
  }
  if self.employees != Default::default() {
  json["employees"] = self.employees.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Organization with from_json(json: Json, path: @json.JsonPath) -> Organization raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Organization"))
  }
  let message = Organization::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = @json.from_json(value, path~)
      ("description", value) => message.description = Some(@json.from_json(value, path~))
      ("parentOrg", value) => message.parent_org = Some(@json.from_json(value, path~))
      ("subOrgs", Array(value)) => message.sub_orgs = value.map(v => 
@json.from_json(v, path~))
      ("employees", Array(value)) => message.employees = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncWrite for Organization with write(self: Organization, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.name)
  match self.description {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_string(v)

    }
    None => ()
  }
  match self.parent_org {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
  for item in self.sub_orgs {
    writer |> @protobuf.async_write_varint(34UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); @protobuf.AsyncWrite::write(item, writer)

  }
  for item in self.employees {
    writer |> @protobuf.async_write_varint(42UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); @protobuf.AsyncWrite::write(item, writer)

  }
}
pub impl @protobuf.AsyncRead for Organization with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> Organization raise {
  let msg = Organization::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.description = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.parent_org = (reader |> @protobuf.async_read_message() : Organization) |> Some
      (4, _) => msg.sub_orgs.push((reader |> @protobuf.async_read_message() : Organization))
      (5, _) => msg.employees.push((reader |> @protobuf.async_read_message() : Employee))
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub(all) struct Employee {
  mut name : String
  mut id : String
  mut organization : Organization?
  mut manager : Employee?
  mut subordinates : Array[Employee]
} derive(Eq, Show)
pub impl @protobuf.Sized for Employee with size_of(self) {
  let mut size = 0U
  size += 1U + { let size = @protobuf.size_of(self.name); @protobuf.size_of(size) + size }
  size += 1U + { let size = @protobuf.size_of(self.id); @protobuf.size_of(size) + size }
  match self.organization {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  match self.manager {
    Some(v) => size += 1U + { let size = @protobuf.size_of(v); @protobuf.size_of(size) + size }
    None => ()
  }
  size += self.subordinates.iter().map(@protobuf.size_of).map(s => 1U + @protobuf.size_of(s) + s).fold(init=0U, UInt::op_add)
  size
}
pub impl Default for Employee with default() -> Employee {
  Employee::{
    name : String::default(),
    id : String::default(),
    organization : None,
    manager : None,
    subordinates : [],
  }
}
pub fn Employee::new(name : String, id : String, organization? : Organization, manager? : Employee, subordinates : Array[Employee]) -> Employee {
  Employee::{
    name,
    id,
    organization,
    manager,
    subordinates,
  }
}
pub impl @protobuf.Read for Employee with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.Reader]) -> Employee raise {
  let msg = Employee::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.id = reader |> @protobuf.read_string()
      (3, _) => msg.organization = (reader |> @protobuf.read_message() : Organization) |> Some
      (4, _) => msg.manager = (reader |> @protobuf.read_message() : Employee) |> Some
      (5, _) => msg.subordinates.push((reader |> @protobuf.read_message() : Employee))
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
pub impl @protobuf.Write for Employee with write(self: Employee, writer : &@protobuf.Writer) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.name)
  writer |> @protobuf.write_varint(18UL);
  writer |> @protobuf.write_string(self.id)
  match self.organization {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
  match self.manager {
    Some(v) => {
      writer |> @protobuf.write_varint(34UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); @protobuf.Write::write(v, writer)

    }
    None => ()
  }
  for item in self.subordinates {
    writer |> @protobuf.write_varint(42UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); @protobuf.Write::write(item, writer)

  }
}
pub impl ToJson for Employee with to_json(self) {
  let json: Map[String, Json] = {}
  if self.name != Default::default() {
  json["name"] = self.name.to_json()
  }
  if self.id != Default::default() {
  json["id"] = self.id.to_json()
  }
  match self.organization {
      Some(v) => json["organization"] = v.to_json()
      _ => ()
    }
  match self.manager {
      Some(v) => json["manager"] = v.to_json()
      _ => ()
    }
  if self.subordinates != Default::default() {
  json["subordinates"] = self.subordinates.to_json()
  }
  Json::object(json)
}
pub impl @json.FromJson for Employee with from_json(json: Json, path: @json.JsonPath) -> Employee raise {
  guard json is Object(obj) else {
    raise @json.JsonDecodeError((path, "Expected an object for Employee"))
  }
  let message = Employee::default()
  for key, value in obj {
    match (key, value) {
      ("name", value) => message.name = @json.from_json(value, path~)
      ("id", value) => message.id = @json.from_json(value, path~)
      ("organization", value) => message.organization = Some(@json.from_json(value, path~))
      ("manager", value) => message.manager = Some(@json.from_json(value, path~))
      ("subordinates", Array(value)) => message.subordinates = value.map(v => 
@json.from_json(v, path~))
      key => raise @json.JsonDecodeError((path, "Unknown field \{key}"))
    }
  }
  message
}
pub impl @protobuf.AsyncWrite for Employee with write(self: Employee, writer : &@protobuf.AsyncWriter) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.name)
  writer |> @protobuf.async_write_varint(18UL);
  writer |> @protobuf.async_write_string(self.id)
  match self.organization {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
  match self.manager {
    Some(v) => {
      writer |> @protobuf.async_write_varint(34UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); @protobuf.AsyncWrite::write(v, writer)

    }
    None => ()
  }
  for item in self.subordinates {
    writer |> @protobuf.async_write_varint(42UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); @protobuf.AsyncWrite::write(item, writer)

  }
}
pub impl @protobuf.AsyncRead for Employee with read_with_limit(reader : @protobuf.LimitedReader[&@protobuf.AsyncReader]) -> Employee raise {
  let msg = Employee::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.id = reader |> @protobuf.async_read_string()
      (3, _) => msg.organization = (reader |> @protobuf.async_read_message() : Organization) |> Some
      (4, _) => msg.manager = (reader |> @protobuf.async_read_message() : Employee) |> Some
      (5, _) => msg.subordinates.push((reader |> @protobuf.async_read_message() : Employee))
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  msg
}
