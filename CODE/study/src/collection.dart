// Bắt buộc phải import thư viện collection để dùng Queue, HashMap, HashSet
import 'dart:collection';

void main() {
  print('--- 1. HÀNG ĐỢI (QUEUE) ---');
  var q = Queue<String>();
  q.add('A');
  q.add('B');
  q.addFirst('A0'); // Thêm vào đầu
  q.addLast('B0');  // Thêm vào cuối
  print('Queue ban đầu: $q');

  q.removeFirst();
  q.removeLast();
  q.remove('B');
  print('Queue sau khi xóa: $q\n');

  print('--- 2. HASH MAP ---');
  // Sử dụng giống Map nhưng tối ưu tìm kiếm qua hashCode
  var hashMap = HashMap<String, int>();
  hashMap['One'] = 1;
  hashMap['Two'] = 2;
  print('HashMap: $hashMap\n');

  print('--- 3. HASH SET ---');
  // Sử dụng giống Set nhưng tối ưu qua hashCode
  var hashSet = HashSet<String>();
  hashSet.add('X');
  hashSet.add('Y');
  print('HashSet: $hashSet');
}