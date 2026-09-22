import 'package:flutter/material.dart';

class LayoutBasicsDemo extends StatelessWidget {
  const LayoutBasicsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu (giả lập danh sách phim)
    final List<String> movies = [
      'Spider-Man: No Way Home',
      'The Batman',
      'Doctor Strange in the Multiverse of Madness',
      'Top Gun: Maverick',
      'Avatar: The Way of Water',
      'Black Panther: Wakanda Forever'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 3: Layout Basics'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        // Áp dụng Padding 16px đều 4 cạnh để tạo khoảng cách với viền màn hình (Quy tắc thiết kế UI nhất quán)
        padding: const EdgeInsets.all(16.0),
        // Sử dụng Column để bố cục theo chiều dọc
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECTION 1: HEADER ---
            const Text(
              'Trang Chủ (Home Screen)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // SizedBox dùng để tạo khoảng trống cố định giữa các thành phần
            const SizedBox(height: 16),

            // --- SECTION 2: BỐ CỤC NGANG VỚI ROW ---
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple.shade200),
              ),
              // Row sắp xếp các widget theo chiều ngang
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Dàn đều 2 đầu
                children: [
                  const Row(
                    children: [
                      Icon(Icons.movie, color: Colors.purple),
                      SizedBox(width: 8),
                      Text('Phim Nổi Bật', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Xem tất cả'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- SECTION 3: DANH SÁCH CUỘN VỚI LISTVIEW ---
            const Text(
              'Danh sách phim:',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            // Quan Trọng: ListView nằm trong Column sẽ bị lỗi nếu không bọc bởi Expanded.
            // Expanded nói với Flutter: "Hãy dùng toàn bộ không gian còn lại cho ListView này"
            Expanded(
              // ListView.builder rất tối ưu cho danh sách dài vì nó chỉ render các mục đang hiển thị trên màn hình
              child: ListView.builder(
                itemCount: movies.length, // Số lượng phần tử
                itemBuilder: (context, index) {
                  // Widget tạo ra cho mỗi phần tử trong danh sách
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12), // Khoảng cách giữa các Card
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text(movies[index]),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Xử lý sự kiện khi bấm vào 1 mục (trong thực tế có thể mở chi tiết phim)
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
