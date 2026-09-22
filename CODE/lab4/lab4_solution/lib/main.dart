import 'package:flutter/material.dart';
import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_basics_demo.dart';
import 'app_structure_demo.dart';
import 'debug_fix_demo.dart';

void main() {
  runApp(const Lab4App());
}

class Lab4App extends StatefulWidget {
  const Lab4App({super.key});

  // Cung cấp một phương thức tĩnh để các màn hình con có thể gọi và thay đổi ThemeMode
  static _Lab4AppState of(BuildContext context) =>
      context.findAncestorStateOfType<_Lab4AppState>()!;

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {
  // Biến quản lý ThemeMode ở cấp cao nhất của ứng dụng
  ThemeMode _themeMode = ThemeMode.light;

  // Hàm chuyển đổi Dark/Light mode
  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 - Flutter UI Fundamentals',
      // Cấu hình giao diện Light Mode
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      // Cấu hình giao diện Dark Mode
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      // THỰC HIỆN GOAL 4: Sử dụng thuộc tính themeMode để chuyển đổi giao diện toàn app
      themeMode: _themeMode,
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

  Widget _buildMenuButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 18),
        ),
        onPressed: () {
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
