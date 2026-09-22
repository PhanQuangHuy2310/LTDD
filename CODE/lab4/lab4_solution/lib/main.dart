import 'package:flutter/material.dart';
import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_basics_demo.dart';
import 'app_structure_demo.dart';
import 'debug_fix_demo.dart';

void main() {
  // Hàm main là điểm bắt đầu của ứng dụng Flutter
  runApp(const Lab4App());
}

class Lab4App extends StatelessWidget {
  const Lab4App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp là widget gốc cấu hình các thông số chung của app như giao diện, điều hướng
    return MaterialApp(
      title: 'Lab 4 - Flutter UI Fundamentals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Màn hình đầu tiên hiển thị khi mở app
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 - Menu Bài Tập'),
      ),
      // ListView giúp hiển thị danh sách các mục và có thể cuộn được
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuButton(context, 'Bài 1: Core Widgets', const CoreWidgetsDemo()),
          _buildMenuButton(context, 'Bài 2: Input Controls', const InputControlsDemo()),
          _buildMenuButton(context, 'Bài 3: Layout Basics', const LayoutBasicsDemo()),
          _buildMenuButton(context, 'Bài 4: App Structure', const AppStructureDemo()),
          _buildMenuButton(context, 'Bài 5: Debug & Fix UI', const DebugFixDemo()),
        ],
      ),
    );
  }

  // Hàm hỗ trợ tạo nút bấm để chuyển màn hình, giúp code gọn gàng hơn
  Widget _buildMenuButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 18),
        ),
        onPressed: () {
          // Navigator.push dùng để chuyển sang màn hình mới
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(title),
      ),
    );
  }
}
