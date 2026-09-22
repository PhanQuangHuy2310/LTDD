import 'package:flutter/material.dart';

// Để tạo UI tương tác (có thể thay đổi giá trị), chúng ta bắt buộc phải dùng StatefulWidget
class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  // 1. Khai báo các biến trạng thái (state variables) để lưu giá trị của người dùng
  double _sliderValue = 50.0; // Giá trị mặc định của Slider
  bool _switchValue = false; // Giá trị mặc định của Switch (Tắt)
  int _radioValue = 1; // Giá trị mặc định của RadioListTile
  DateTime? _selectedDate; // Ngày được chọn, có thể null (chưa chọn)

  // Hàm hiển thị DatePicker
  Future<void> _selectDate(BuildContext context) async {
    // showDatePicker là một Future, nó sẽ chờ người dùng chọn ngày xong mới trả về giá trị
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày hiển thị ban đầu khi mở lịch
      firstDate: DateTime(2000), // Ngày nhỏ nhất có thể chọn
      lastDate: DateTime(2100), // Ngày lớn nhất có thể chọn
    );
    // Nếu người dùng có chọn ngày (khác null) và khác với ngày hiện tại đang chọn
    if (picked != null && picked != _selectedDate) {
      // setState để báo cho Flutter biết cần vẽ lại màn hình (cập nhật UI)
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 2: Input Controls'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView( // Giúp cuộn màn hình nếu nội dung quá dài (tránh lỗi Overflow)
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SLIDER ---
            const Text('1. Slider:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Slider(
              value: _sliderValue, // Liên kết với biến trạng thái
              min: 0,
              max: 100,
              divisions: 10, // Chia thanh trượt làm 10 phần bằng nhau
              label: _sliderValue.round().toString(), // Hiển thị số khi kéo
              onChanged: (double value) {
                // Khi người dùng kéo, cập nhật lại giá trị và vẽ lại UI
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            Text('Giá trị Slider: ${_sliderValue.round()}'), // Hiển thị giá trị
            const Divider(height: 30),

            // --- SWITCH ---
            const Text('2. Switch:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text('Chế độ ban đêm (Night Mode)'),
              value: _switchValue, // Liên kết với biến trạng thái
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            Text('Trạng thái Switch: ${_switchValue ? "BẬT" : "TẮT"}'),
            const Divider(height: 30),

            // --- RADIO LIST TILE ---
            const Text('3. RadioListTile:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            RadioListTile<int>(
              title: const Text('Tùy chọn A'),
              value: 1, // Giá trị đại diện cho tùy chọn này
              // ignore: deprecated_member_use
              groupValue: _radioValue, // Nhóm radio sẽ dùng chung biến này để biết cái nào đang được chọn
              // ignore: deprecated_member_use
              onChanged: (int? value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('Tùy chọn B'),
              value: 2,
              // ignore: deprecated_member_use
              groupValue: _radioValue,
              // ignore: deprecated_member_use
              onChanged: (int? value) {
                setState(() {
                  _radioValue = value!;
                });
              },
            ),
            Text('Lựa chọn của bạn: ${_radioValue == 1 ? "Tùy chọn A" : "Tùy chọn B"}'),
            const Divider(height: 30),

            // --- DATE PICKER ---
            const Text('4. Date Picker:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context), // Gọi hàm mở lịch
              child: const Text('Chọn Ngày (Select Date)'),
            ),
            const SizedBox(height: 10),
            Text(
              _selectedDate == null
                  ? 'Bạn chưa chọn ngày nào.'
                  // Hiển thị ngày đã chọn (cắt bớt phần giờ/phút/giây)
                  : 'Ngày đã chọn: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
