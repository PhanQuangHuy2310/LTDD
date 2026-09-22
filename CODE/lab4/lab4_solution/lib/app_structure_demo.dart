import 'package:flutter/material.dart';

class AppStructureDemo extends StatefulWidget {
  const AppStructureDemo({super.key});

  @override
  State<AppStructureDemo> createState() => _AppStructureDemoState();
}

class _AppStructureDemoState extends State<AppStructureDemo> {
  // Biến trạng thái để lưu chế độ Dark Mode
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // Để áp dụng Theme (Dark/Light mode) cho riêng màn hình này (mà không ảnh hưởng toàn app),
    // chúng ta bọc Scaffold trong một widget Theme.
    // Trong thực tế, Dark Mode thường được cấu hình ở tầng cao nhất là MaterialApp(themeMode: ...).
    return Theme(
      // Tùy chỉnh dữ liệu Theme dựa trên trạng thái _isDarkMode
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        // 1. APP BAR: Thanh điều hướng phía trên
        appBar: AppBar(
          title: const Text('Bài 4: App Structure'),
          // Màu sắc AppBar có thể phụ thuộc vào Theme hiện tại
          backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.green,
          actions: [
            // Nút chuyển đổi Dark/Light Mode trên thanh AppBar
            IconButton(
              icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode; // Đảo ngược trạng thái
                });
              },
            ),
          ],
        ),
        
        // 2. BODY: Phần nội dung chính của màn hình
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
            children: [
              Text(
                'Đây là phần Body của Scaffold',
                style: TextStyle(
                  fontSize: 20,
                  // Đổi màu chữ theo Theme
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Hãy thử bấm vào nút ở góc phải dưới!'),
            ],
          ),
        ),

        // 3. FLOATING ACTION BUTTON (FAB): Nút chức năng nổi, thường đặt ở góc dưới cùng bên phải
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Khi bấm vào FAB, hiển thị một thông báo dạng Snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bạn vừa bấm vào FloatingActionButton!'),
                duration: Duration(seconds: 2), // Thời gian hiển thị
              ),
            );
          },
          // Màu của nút phụ thuộc vào Theme
          backgroundColor: _isDarkMode ? Colors.tealAccent : Colors.green,
          child: Icon(
            Icons.add,
            // Nếu là Dark Mode, biểu tượng màu đen sẽ dễ nhìn hơn trên nền sáng của tealAccent
            color: _isDarkMode ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
