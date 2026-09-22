void main() {
  // Sinh ra Iterable chứa 10 phần tử số từ 0 - đến 9
  var iterable = Iterable.generate(10);

  print('--- Duyệt qua bằng vòng lặp for ---');
  for (var item in iterable) {
    print(item);
  }

  print('--- Duyệt qua bằng forEach ---');
  iterable.forEach((f) {
    print(f);
  });
}