import 'package:flutter/material.dart';
import 'main.dart'; // Import Lab4App để gọi hàm toggleTheme

class AppStructureDemo extends StatelessWidget {
  const AppStructureDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // GOAL 4: Thực hành xây dựng cấu trúc màn hình với Scaffold, AppBar, FAB & Theme
    // Ở đây ta gọi hàm toggleTheme() đã được định nghĩa ở Lab4App (trong main.dart)
    // để thay đổi thuộc tính themeMode của toàn ứng dụng theo đúng yêu cầu bài tập.
    
    // Lấy trạng thái ThemeMode hiện tại để hiển thị icon cho đúng
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // 1. APP BAR: Thanh điều hướng phía trên
      appBar: AppBar(
        title: const Text('Bài 4: App Structure & Theme'),
        actions: [
          // Nút chuyển đổi Dark/Light Mode trên thanh AppBar
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () {
              // Gọi hàm từ widget gốc (Lab4App) để thay đổi themeMode toàn app
              Lab4App.of(context).toggleTheme();
            },
          ),
        ],
      ),
      
      // 2. BODY: Phần nội dung chính của màn hình
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
          children: [
            Text(
              'Đây là phần Body của Scaffold',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text('Hãy thử bấm vào nút mặt trăng/mặt trời trên AppBar!'),
            SizedBox(height: 10),
            Text('(Giao diện sẽ thay đổi toàn app dựa trên thuộc tính themeMode)'),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
