void main() {
  // 1. Mảng có số phần tử cố định (Cập nhật cú pháp Dart mới)
  var listState = List<String>.filled(2, ''); // Mảng 2 phần tử chuỗi rỗng
  listState[0] = 'on';
  listState[1] = 'off';
  print('Mảng cố định: $listState');

  // 2. Mảng thay đổi được số lượng phần tử
  var dow = <String>[]; // Tương đương new List() bản cũ
  dow.add('Monday');
  dow.add('Tuesday');
  dow.add('Thursday');
  print('Mảng thay đổi được: $dow');

  // Xóa phần tử cuối cùng
  dow.removeLast();
  print('Sau khi xóa phần tử cuối: $dow');

  // 3. Khởi tạo mảng có sẵn dữ liệu
  var group = ['member', 'admin'];
  group.insert(0, 'guest'); // Chèn vào vị trí 0
  print('Mảng khởi tạo sẵn và chèn thêm: $group');
}