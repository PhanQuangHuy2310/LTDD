import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold cung cấp cấu trúc cơ bản cho màn hình (AppBar, Body, FloatingActionButton,...)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 1: Core Widgets'),
        backgroundColor: Colors.teal, // Thêm màu cho AppBar
      ),
      // SafeArea đảm bảo nội dung không bị che khuất bởi tai thỏ (notch) hoặc thanh trạng thái của điện thoại
      body: SafeArea(
        // Padding dùng để tạo khoảng cách giữa nội dung và viền màn hình
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Column dùng để sắp xếp các widget con theo chiều dọc (từ trên xuống dưới)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các phần tử con
            children: [
              // 1. Text Widget: Dùng để hiển thị văn bản
              const Text(
                'Đây là một Text Headline',
                style: TextStyle(
                  fontSize: 24, // Kích thước chữ
                  fontWeight: FontWeight.bold, // In đậm
                  color: Colors.blueAccent, // Màu chữ
                ),
              ),
              const SizedBox(height: 20), // SizedBox dùng để tạo khoảng trống giữa các widget

              // 2. Icon Widget: Hiển thị các biểu tượng (Material Icons)
              const Row(
                children: [
                  Icon(
                    Icons.star, // Biểu tượng ngôi sao
                    size: 40, // Kích thước biểu tượng
                    color: Colors.amber, // Màu vàng
                  ),
                  SizedBox(width: 10), // Tạo khoảng trống theo chiều ngang
                  Text('Đây là một Icon', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 20),

              // 3. Image Widget: Hiển thị hình ảnh từ mạng (Internet)
              // Lưu ý: Sinh viên cần đảm bảo máy ảo hoặc thiết bị thật có kết nối mạng
              Center(
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', // Đường dẫn (URL) của ảnh
                  height: 150, // Chiều cao ảnh
                  fit: BoxFit.cover, // Cách ảnh hiển thị để vừa với khung
                  errorBuilder: (context, error, stackTrace) {
                    // Xử lý khi ảnh bị lỗi (ví dụ không có mạng)
                    return const Text('Lỗi tải ảnh, hãy kiểm tra mạng!');
                  },
                ),
              ),
              const SizedBox(height: 20),

              // 4. Card & ListTile Widget
              // Card: Tạo một khung có đổ bóng nhìn giống thẻ
              Card(
                elevation: 4, // Độ lớn của bóng (tạo cảm giác nổi 3D)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bo góc cho thẻ
                ),
                // ListTile: Widget tiện ích thường dùng trong danh sách, có sẵn các thuộc tính leading, title, subtitle, trailing
                child: const ListTile(
                  leading: Icon(Icons.person, size: 40, color: Colors.teal), // Phần đầu tiên bên trái
                  title: Text('Đây là ListTile nằm trong Card'), // Tiêu đề chính
                  subtitle: Text('Subtitle - Phụ đề của ListTile'), // Tiêu đề phụ
                  trailing: Icon(Icons.arrow_forward_ios), // Phần ngoài cùng bên phải
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
