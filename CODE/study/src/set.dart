void main() {
  // Khởi tạo một tập hợp
  var s = <String>{};

  // Thêm phần tử
  s.add('Apple');
  s.add('Banana');
  s.add('Apple'); // Sẽ không được thêm vào vì trùng lặp

  print('Tập hợp: $s'); // Kết quả chỉ có {Apple, Banana}

  // Kiểm tra tồn tại
  print('Có chứa Apple không? ${s.contains('Apple')}');

  // Loại bỏ phần tử
  s.remove('Banana');
  print('Tập hợp sau khi xóa: $s');
}