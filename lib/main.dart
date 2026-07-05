import 'package:flutter/material.dart';
import 'pages/ai_chat_page.dart'; // 1. เพิ่ม import สำหรับเชื่อมต่อไปหน้า AI Chat

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        // ปรับโทนสีหลักให้เป็นสีส้มตามหน้าจอจริงของคุณ
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.orange, // สีส้มตามหน้าจอจริง
        foregroundColor: Colors.white,
        centerTitle: true, // จัดให้อยู่ตรงกลางตาม UI บนเว็บของคุณ
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // รูปโปรไฟล์สีส้มตามดีไซน์ของคุณ
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 16),

            // ข้อมูลชื่อและรหัสตรงตามที่ปรากฏบนหน้าจอจริง
            const Text(
              'Siwapat Auisui',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'รหัสนักศึกษา: 67030351',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Card แสดงรายการข้อมูลทั้งหมด 5 แถวจากภาพหน้าจอของคุณ
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow(
                      Icons.school,
                      'คณะ',
                      'ครุศาสตร์อุตสาหกรรมและเทคโนโลยี',
                    ),
                    const Divider(),
                    _buildInfoRow(
                      Icons.account_balance,
                      'มหาวิทยาลัย',
                      'สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง',
                    ),
                    const Divider(),
                    _buildInfoRow(Icons.email, 'อีเมล', '67030351@kmitl.ac.th'),
                    const Divider(),
                    _buildInfoRow(
                      Icons.code,
                      'วิชาที่ชอบ',
                      'Mobile Development',
                    ),
                    const Divider(),
                    _buildInfoRow(
                      Icons.star,
                      'เป้าหมาย',
                      'พัฒนาแอปให้ได้ 1 ตัว',
                    ),
                  ],
                ),
              ),
            ),

            // ↓↓↓ 2. ปุ่มกดไปหน้า AI Chat Demo เพิ่มต่อท้าย Card ตามใบงานขั้นตอนที่ 5 ↓↓↓
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AiChatPage()),
                );
              },
              icon: const Icon(Icons.smart_toy),
              label: const Text('ทดลอง AI Chat'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // ใช้สีส้มคุมโทนเดียวกัน
                foregroundColor: Colors.white, // ตัวอักษรสีขาว
                minimumSize: const Size.fromHeight(
                  50,
                ), // ขยายปุ่มให้กดง่ายเต็มหน้าจอ
              ),
            ),

            // ↑↑↑ จบส่วนปุ่มกดเชื่อมโยงหน้า ↑↑↑
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันช่วยสร้างแถวข้อมูล (Info Row)
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange), // เปลี่ยนไอคอนเป็นสีส้มตาม Theme
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
