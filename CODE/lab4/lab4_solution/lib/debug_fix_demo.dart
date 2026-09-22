import 'package:flutter/material.dart';

class DebugFixDemo extends StatefulWidget {
  const DebugFixDemo({super.key});

  @override
  State<DebugFixDemo> createState() => _DebugFixDemoState();
}

class _DebugFixDemoState extends State<DebugFixDemo> {
  // LỖI 3 (Đã sửa): Lỗi State không cập nhật.
  // Nguyên nhân cũ: Biến counter thay đổi nhưng UI không vẽ lại vì thiếu setState().
  // Cách sửa: Bọc phần gán giá trị biến vào bên trong hàm setState().
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // LỖI 4 (Đã sửa): Lỗi DatePicker BuildContext.
  // Nguyên nhân cũ: Gọi showDatePicker ở ngoài hàm build hoặc dùng sai context không chứa Scaffold/Navigator.
  // Cách sửa: Truyền đúng biến 'context' từ hàm build hoặc widget con vào.
  Future<void> _showDatePicker(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 5: Debug & Fix UI'),
        backgroundColor: Colors.redAccent,
      ),
      // LỖI 2 (Đã sửa): Lỗi Overflow (Vượt quá màn hình) khi nội dung quá dài.
      // Nguyên nhân cũ: Chỉ dùng Column, nếu nội dung dài hơn chiều cao màn hình sẽ xuất hiện dải sọc vàng đen cảnh báo lỗi "Bottom overflowed...".
      // Cách sửa: Bọc Column bằng SingleChildScrollView để cho phép cuộn nội dung.
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- DEMO FIX STATE ---
            const Text(
              '1. Sửa lỗi cập nhật State (setState)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text('Số lần bấm: $_counter', style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Tăng +1'),
                ),
              ],
            ),
            const Divider(height: 30),

            // --- DEMO FIX CONTEXT DATEPICKER ---
            const Text(
              '2. Sửa lỗi Context khi gọi DatePicker',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => _showDatePicker(context), // context này hợp lệ vì nằm trong cây widget
              child: const Text('Mở Lịch (DatePicker)'),
            ),
            const Divider(height: 30),

            // --- DEMO FIX LISTVIEW INSIDE COLUMN ---
            const Text(
              '3. Sửa lỗi ListView bên trong Column',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Nguyên nhân cũ: ListView.builder cần biết chiều cao cụ thể, nhưng Column thì chiều cao vô hạn. Điều này gây lỗi sập UI (Vertical viewport was given unbounded height).',
              style: TextStyle(color: Colors.red),
            ),
            const Text(
              'Cách sửa: Dùng ListView(shrinkWrap: true, physics: NeverScrollableScrollPhysics()) HOẶC bọc ListView vào Expanded/SizedBox.',
              style: TextStyle(color: Colors.green),
            ),
            const SizedBox(height: 10),
            
            // LỖI 1 (Đã sửa): ListView inside Column.
            // Do chúng ta đang bọc toàn bộ bằng SingleChildScrollView ở ngoài cùng, nên ở đây ta KHÔNG DÙNG Expanded (sẽ gây lỗi vì Expanded đòi chiếm chỗ trống còn lại, nhưng SingleChildScrollView thì có chiều cao vô cực).
            // Thay vào đó, trong trường hợp này ta dùng shrinkWrap: true để ListView chỉ lấy chiều cao vừa đủ cho danh sách của nó, và tắt cuộn (physics: NeverScrollableScrollPhysics()) để nhường quyền cuộn cho SingleChildScrollView.
            // (Nếu không có SingleChildScrollView ở ngoài, ta sẽ dùng Expanded bọc ListView).
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ListView.builder(
                shrinkWrap: true, // Ép ListView thu lại vừa bằng nội dung bên trong
                physics: const NeverScrollableScrollPhysics(), // Tắt cuộn của ListView (để cuộn bằng SingleChildScrollView bên ngoài)
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.green),
                    title: Text('Mục danh sách thứ ${index + 1}'),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 30),
            const Text('Phần nội dung dài bên dưới để thử nghiệm cuộn (Tránh Overflow)'),
            Container(height: 200, color: Colors.blue[100]), // Tạo khối màu lớn để ép màn hình phải cuộn
            Container(height: 200, color: Colors.green[100]),
          ],
        ),
      ),
    );
  }
}
