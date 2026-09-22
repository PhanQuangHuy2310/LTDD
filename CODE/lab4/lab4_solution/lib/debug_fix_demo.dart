import 'package:flutter/material.dart';

class DebugFixDemo extends StatelessWidget {
  const DebugFixDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Sử dụng TabBar để tách riêng các bài sửa lỗi, giúp tránh xung đột UI
    // (VD: Expanded không thể nằm trong SingleChildScrollView)
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bài 5: Debug & Fix UI'),
          backgroundColor: Colors.redAccent,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: '1. Expanded'),
              Tab(text: '2. Overflow'),
              Tab(text: '3. setState'),
              Tab(text: '4. Context'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _FixExpandedDemo(),
            _FixOverflowDemo(),
            _FixStateDemo(),
            _FixContextDemo(),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 1. Fix ListView inside Column using Expanded
// ==========================================
class _FixExpandedDemo extends StatelessWidget {
  const _FixExpandedDemo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Lỗi cũ: ListView đặt trực tiếp trong Column bị lỗi "unbounded height".\n'
            'Cách sửa: Dùng widget Expanded bọc ListView lại.',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        // GOAL 5.1: Fix ListView inside Column using Expanded
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.check_circle),
                title: Text('Mục danh sách thứ ${index + 1}'),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 2. Fix overflow in small screens using SingleChildScrollView
// ==========================================
class _FixOverflowDemo extends StatelessWidget {
  const _FixOverflowDemo();

  @override
  Widget build(BuildContext context) {
    // GOAL 5.2: Fix overflow in small screens using SingleChildScrollView
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lỗi cũ: Nội dung vượt quá màn hình gây ra dải sọc vàng đen cảnh báo.\n'
              'Cách sửa: Bọc Column bằng SingleChildScrollView.',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          Container(height: 200, color: Colors.blue[100], child: const Center(child: Text('Khối 1 (200px)'))),
          Container(height: 200, color: Colors.green[100], child: const Center(child: Text('Khối 2 (200px)'))),
          Container(height: 200, color: Colors.orange[100], child: const Center(child: Text('Khối 3 (200px)'))),
          Container(height: 200, color: Colors.purple[100], child: const Center(child: Text('Khối 4 (200px) - Đã có thể cuộn xuống'))),
        ],
      ),
    );
  }
}

// ==========================================
// 3. Fix state update issue by adding setState()
// ==========================================
class _FixStateDemo extends StatefulWidget {
  const _FixStateDemo();

  @override
  State<_FixStateDemo> createState() => _FixStateDemoState();
}

class _FixStateDemoState extends State<_FixStateDemo> {
  int _counter = 0;

  void _incrementCounter() {
    // GOAL 5.3: Fix state update issue by adding setState()
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lỗi cũ: Biến thay đổi nhưng UI không cập nhật.\n'
              'Cách sửa: Gọi setState() khi thay đổi biến.',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ),
          Text('Số lần bấm: $_counter', style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: const Text('Tăng +1'),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. Fix DatePicker build context errors
// ==========================================
class _FixContextDemo extends StatelessWidget {
  const _FixContextDemo();

  // GOAL 5.4: Fix DatePicker build context errors by calling from valid widget tree
  Future<void> _showDatePicker(BuildContext context) async {
    await showDatePicker(
      context: context, // Truyền đúng context từ hàm build (nằm trong Scaffold)
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lỗi cũ: Lỗi "No MaterialLocalizations found" khi gọi hàm Picker ở ngoài hoặc dùng sai context.\n'
              'Cách sửa: Truyền BuildContext hợp lệ từ trong cây Widget.',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () => _showDatePicker(context),
            child: const Text('Mở DatePicker'),
          ),
        ],
      ),
    );
  }
}
