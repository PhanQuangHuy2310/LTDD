void main() {
  // 1. Tạo một map và khởi tạo luôn giá trị
  var student = {
    'name': 'Abc',
    'age': 22,
    'score': 'A'
  };
  student['Subject'] = 'Math'; // Thêm phần tử mới
  print('Truy cập phần tử name: ${student['name']}');

  // 2. Tạo Map từ hàm khởi tạo
  var studentB = <String, dynamic>{};
  studentB['name'] = 'StudentB';
  studentB['age'] = 20;

  // 3. Duyệt qua các phần tử
  print('\n--- Duyệt Map cách 1 (forEach) ---');
  student.forEach((key, value) {
    print('$key : có giá trị $value');
  });

  print('\n--- Duyệt Map cách 2 (for-in theo keys) ---');
  for (var key in studentB.keys) {
    print('$key : ${studentB[key]}');
  }
}