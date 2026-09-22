import 'dart:collection';

// Tạo một class đại diện cho phần tử lưu trong LinkedList
final class NodeItem extends LinkedListEntry<NodeItem> {
  final String value;
  NodeItem(this.value);

  @override
  String toString() => value;
}

void main() {
  var linkedList = LinkedList<NodeItem>();

  // Thêm phần tử
  linkedList.add(NodeItem('Phần tử 1'));
  linkedList.add(NodeItem('Phần tử 2'));

  print('Danh sách liên kết:');
  for (var entry in linkedList) {
    print(entry);
  }
}