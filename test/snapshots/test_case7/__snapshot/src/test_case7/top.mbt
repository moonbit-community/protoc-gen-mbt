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
pub  fn[R: @protobuf.Reader] TreeNode::read(reader : R) -> TreeNode raise {
  let reader = @protobuf.LimitedReader::new(reader)
  TreeNode::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] TreeNode::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> TreeNode raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = TreeNode::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.value = reader |> @protobuf.read_int32() |> Some
      (3, _) => msg.parent =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      TreeNode::default()
    } else {
      TreeNode::read_with_limit(reader, limit=len)
    }
  } |> Some
      (4, _) => msg.children.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      TreeNode::default()
    } else {
      TreeNode::read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.sibling =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      TreeNode::default()
    } else {
      TreeNode::read_with_limit(reader, limit=len)
    }
  } |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub  fn[W: @protobuf.Writer] TreeNode::write(self:Self, writer : W) -> Unit raise {
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
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.children {
    writer |> @protobuf.write_varint(34UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  match self.sibling {
    Some(v) => {
      writer |> @protobuf.write_varint(42UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

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
pub async fn[R: @protobuf.AsyncReader] TreeNode::async_read(reader : R) -> TreeNode raise {
  let reader = @protobuf.LimitedReader::new(reader)
  TreeNode::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] TreeNode::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> TreeNode raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = TreeNode::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.value = reader |> @protobuf.async_read_int32() |> Some
      (3, _) => msg.parent =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      TreeNode::default()
    } else {
      TreeNode::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (4, _) => msg.children.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      TreeNode::default()
    } else {
      TreeNode::async_read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.sibling =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      TreeNode::default()
    } else {
      TreeNode::async_read_with_limit(reader, limit=len)
    }
  } |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub async fn[W: @protobuf.AsyncWriter] TreeNode::async_write(self:Self, writer : W) -> Unit raise {
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
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.children {
    writer |> @protobuf.async_write_varint(34UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.sibling {
    Some(v) => {
      writer |> @protobuf.async_write_varint(42UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
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
pub  fn[R: @protobuf.Reader] ListNode::read(reader : R) -> ListNode raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ListNode::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] ListNode::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ListNode raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ListNode::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.data = reader |> @protobuf.read_string()
      (2, _) => msg.next =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      ListNode::default()
    } else {
      ListNode::read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.prev =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      ListNode::default()
    } else {
      ListNode::read_with_limit(reader, limit=len)
    }
  } |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub  fn[W: @protobuf.Writer] ListNode::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.data)
  match self.next {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.prev {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

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
pub async fn[R: @protobuf.AsyncReader] ListNode::async_read(reader : R) -> ListNode raise {
  let reader = @protobuf.LimitedReader::new(reader)
  ListNode::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] ListNode::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> ListNode raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = ListNode::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.data = reader |> @protobuf.async_read_string()
      (2, _) => msg.next =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      ListNode::default()
    } else {
      ListNode::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.prev =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      ListNode::default()
    } else {
      ListNode::async_read_with_limit(reader, limit=len)
    }
  } |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub async fn[W: @protobuf.AsyncWriter] ListNode::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.data)
  match self.next {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.prev {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
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
pub  fn[R: @protobuf.Reader] GraphNode::read(reader : R) -> GraphNode raise {
  let reader = @protobuf.LimitedReader::new(reader)
  GraphNode::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] GraphNode::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> GraphNode raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = GraphNode::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.id = reader |> @protobuf.read_string()
      (2, _) => msg.label = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.neighbors.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      GraphNode::default()
    } else {
      GraphNode::read_with_limit(reader, limit=len)
    }
  })
      (4, _) => msg.visited = reader |> @protobuf.read_bool() |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub  fn[W: @protobuf.Writer] GraphNode::write(self:Self, writer : W) -> Unit raise {
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
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

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
pub async fn[R: @protobuf.AsyncReader] GraphNode::async_read(reader : R) -> GraphNode raise {
  let reader = @protobuf.LimitedReader::new(reader)
  GraphNode::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] GraphNode::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> GraphNode raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = GraphNode::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.id = reader |> @protobuf.async_read_string()
      (2, _) => msg.label = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.neighbors.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      GraphNode::default()
    } else {
      GraphNode::async_read_with_limit(reader, limit=len)
    }
  })
      (4, _) => msg.visited = reader |> @protobuf.async_read_bool() |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub async fn[W: @protobuf.AsyncWriter] GraphNode::async_write(self:Self, writer : W) -> Unit raise {
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
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  match self.visited {
    Some(v) => {
      writer |> @protobuf.async_write_varint(32UL);
      writer |> @protobuf.async_write_bool(v)

    }
    None => ()
  }
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
pub  fn[R: @protobuf.Reader] NestedSelfRef_Inner::read(reader : R) -> NestedSelfRef_Inner raise {
  let reader = @protobuf.LimitedReader::new(reader)
  NestedSelfRef_Inner::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] NestedSelfRef_Inner::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> NestedSelfRef_Inner raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = NestedSelfRef_Inner::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.inner_name = reader |> @protobuf.read_string() |> Some
      (2, _) => msg.outer_ref =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      NestedSelfRef::default()
    } else {
      NestedSelfRef::read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.inner_ref =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      NestedSelfRef_Inner::default()
    } else {
      NestedSelfRef_Inner::read_with_limit(reader, limit=len)
    }
  } |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub  fn[W: @protobuf.Writer] NestedSelfRef_Inner::write(self:Self, writer : W) -> Unit raise {
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
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.inner_ref {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

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
pub async fn[R: @protobuf.AsyncReader] NestedSelfRef_Inner::async_read(reader : R) -> NestedSelfRef_Inner raise {
  let reader = @protobuf.LimitedReader::new(reader)
  NestedSelfRef_Inner::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] NestedSelfRef_Inner::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> NestedSelfRef_Inner raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = NestedSelfRef_Inner::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.inner_name = reader |> @protobuf.async_read_string() |> Some
      (2, _) => msg.outer_ref =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      NestedSelfRef::default()
    } else {
      NestedSelfRef::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.inner_ref =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      NestedSelfRef_Inner::default()
    } else {
      NestedSelfRef_Inner::async_read_with_limit(reader, limit=len)
    }
  } |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub async fn[W: @protobuf.AsyncWriter] NestedSelfRef_Inner::async_write(self:Self, writer : W) -> Unit raise {
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
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.inner_ref {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
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
pub  fn[R: @protobuf.Reader] NestedSelfRef::read(reader : R) -> NestedSelfRef raise {
  let reader = @protobuf.LimitedReader::new(reader)
  NestedSelfRef::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] NestedSelfRef::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> NestedSelfRef raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = NestedSelfRef::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.inner =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      NestedSelfRef_Inner::default()
    } else {
      NestedSelfRef_Inner::read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.self_ref =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      NestedSelfRef::default()
    } else {
      NestedSelfRef::read_with_limit(reader, limit=len)
    }
  } |> Some
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub  fn[W: @protobuf.Writer] NestedSelfRef::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.name)
  match self.inner {
    Some(v) => {
      writer |> @protobuf.write_varint(18UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.self_ref {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

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
pub async fn[R: @protobuf.AsyncReader] NestedSelfRef::async_read(reader : R) -> NestedSelfRef raise {
  let reader = @protobuf.LimitedReader::new(reader)
  NestedSelfRef::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] NestedSelfRef::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> NestedSelfRef raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = NestedSelfRef::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.inner =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      NestedSelfRef_Inner::default()
    } else {
      NestedSelfRef_Inner::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (3, _) => msg.self_ref =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      NestedSelfRef::default()
    } else {
      NestedSelfRef::async_read_with_limit(reader, limit=len)
    }
  } |> Some
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub async fn[W: @protobuf.AsyncWriter] NestedSelfRef::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.name)
  match self.inner {
    Some(v) => {
      writer |> @protobuf.async_write_varint(18UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.self_ref {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
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
pub  fn[R: @protobuf.Reader] Organization::read(reader : R) -> Organization raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Organization::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] Organization::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Organization raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Organization::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.description = reader |> @protobuf.read_string() |> Some
      (3, _) => msg.parent_org =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      Organization::default()
    } else {
      Organization::read_with_limit(reader, limit=len)
    }
  } |> Some
      (4, _) => msg.sub_orgs.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      Organization::default()
    } else {
      Organization::read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.employees.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      Employee::default()
    } else {
      Employee::read_with_limit(reader, limit=len)
    }
  })
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub  fn[W: @protobuf.Writer] Organization::write(self:Self, writer : W) -> Unit raise {
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
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.sub_orgs {
    writer |> @protobuf.write_varint(34UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

  }
  for item in self.employees {
    writer |> @protobuf.write_varint(42UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

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
pub async fn[R: @protobuf.AsyncReader] Organization::async_read(reader : R) -> Organization raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Organization::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] Organization::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Organization raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Organization::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.description = reader |> @protobuf.async_read_string() |> Some
      (3, _) => msg.parent_org =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      Organization::default()
    } else {
      Organization::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (4, _) => msg.sub_orgs.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      Organization::default()
    } else {
      Organization::async_read_with_limit(reader, limit=len)
    }
  })
      (5, _) => msg.employees.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      Employee::default()
    } else {
      Employee::async_read_with_limit(reader, limit=len)
    }
  })
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub async fn[W: @protobuf.AsyncWriter] Organization::async_write(self:Self, writer : W) -> Unit raise {
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
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.sub_orgs {
    writer |> @protobuf.async_write_varint(34UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
  for item in self.employees {
    writer |> @protobuf.async_write_varint(42UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
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
pub  fn[R: @protobuf.Reader] Employee::read(reader : R) -> Employee raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Employee::read_with_limit(reader)
}
pub  fn[R: @protobuf.Reader] Employee::read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Employee raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Employee::default()
  try {
    for {
      match (reader |> @protobuf.read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.read_string()
      (2, _) => msg.id = reader |> @protobuf.read_string()
      (3, _) => msg.organization =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      Organization::default()
    } else {
      Organization::read_with_limit(reader, limit=len)
    }
  } |> Some
      (4, _) => msg.manager =   {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      Employee::default()
    } else {
      Employee::read_with_limit(reader, limit=len)
    }
  } |> Some
      (5, _) => msg.subordinates.push(  {
    let len = reader |> @protobuf.read_int32()
    if len == 0 {
      Employee::default()
    } else {
      Employee::read_with_limit(reader, limit=len)
    }
  })
       (_, wire) => reader |> @protobuf.read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub  fn[W: @protobuf.Writer] Employee::write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.write_varint(10UL);
  writer |> @protobuf.write_string(self.name)
  writer |> @protobuf.write_varint(18UL);
  writer |> @protobuf.write_string(self.id)
  match self.organization {
    Some(v) => {
      writer |> @protobuf.write_varint(26UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  match self.manager {
    Some(v) => {
      writer |> @protobuf.write_varint(34UL);
      writer |> @protobuf.write_uint32(@protobuf.size_of(v)); v.write(writer)

    }
    None => ()
  }
  for item in self.subordinates {
    writer |> @protobuf.write_varint(42UL)
    writer |> @protobuf.write_uint32(@protobuf.size_of(item)); item.write(writer)

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
pub async fn[R: @protobuf.AsyncReader] Employee::async_read(reader : R) -> Employee raise {
  let reader = @protobuf.LimitedReader::new(reader)
  Employee::async_read_with_limit(reader)
}
pub async fn[R: @protobuf.AsyncReader] Employee::async_read_with_limit(reader : @protobuf.LimitedReader[R], limit ?: Int) -> Employee raise {
  let new_limit = if reader.limit is Some(l) && limit is Some(limit) {
    if l < limit { raise @protobuf.EndOfStream }
    Some(l - limit)
  } else { None }
  reader.limit = limit
  let msg = Employee::default()
  try {
    for {
      match (reader |> @protobuf.async_read_tag()) {
      (1, _) => msg.name = reader |> @protobuf.async_read_string()
      (2, _) => msg.id = reader |> @protobuf.async_read_string()
      (3, _) => msg.organization =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      Organization::default()
    } else {
      Organization::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (4, _) => msg.manager =   {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      Employee::default()
    } else {
      Employee::async_read_with_limit(reader, limit=len)
    }
  } |> Some
      (5, _) => msg.subordinates.push(  {
    let len = reader |> @protobuf.async_read_int32()
    if len == 0 {
      Employee::default()
    } else {
      Employee::async_read_with_limit(reader, limit=len)
    }
  })
       (_, wire) => reader |> @protobuf.async_read_unknown(wire)
      }
    }
  } catch {
    @protobuf.EndOfStream => ()
    err => raise err
  }
  reader.limit = new_limit
  msg
}
pub async fn[W: @protobuf.AsyncWriter] Employee::async_write(self:Self, writer : W) -> Unit raise {
  writer |> @protobuf.async_write_varint(10UL);
  writer |> @protobuf.async_write_string(self.name)
  writer |> @protobuf.async_write_varint(18UL);
  writer |> @protobuf.async_write_string(self.id)
  match self.organization {
    Some(v) => {
      writer |> @protobuf.async_write_varint(26UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  match self.manager {
    Some(v) => {
      writer |> @protobuf.async_write_varint(34UL);
      writer |> @protobuf.async_write_uint32(@protobuf.size_of(v)); v.async_write(writer)

    }
    None => ()
  }
  for item in self.subordinates {
    writer |> @protobuf.async_write_varint(42UL)
    writer |> @protobuf.async_write_uint32(@protobuf.size_of(item)); item.async_write(writer)

  }
}
