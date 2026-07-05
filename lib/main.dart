import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/ai_chat_page.dart';

// Global Theme Notifier for Dark Mode Support
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'My Profile',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
            brightness: Brightness.dark,
          ),
          themeMode: currentMode,
          home: const ProfilePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            onPressed: () {
              themeNotifier.value =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // Profile Avatar with subtle glow
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.orange,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Profile Header Info
            const Text(
              'Siwapat Auisui',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              'รหัสนักศึกษา: 67030351',
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.orange.shade300 : Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(height: 16),

            // Challenge 1: Social Media Links Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaButton(
                  icon: Icons.code,
                  url: 'https://github.com/PetchAuisui',
                  tooltip: 'GitHub Profile',
                  color: Colors.orange,
                ),
                SocialMediaButton(
                  icon: Icons.email,
                  url: 'mailto:67030351@kmitl.ac.th',
                  tooltip: 'Send Email',
                  color: Colors.orange,
                ),
                SocialMediaButton(
                  icon: Icons.facebook,
                  url: 'https://facebook.com',
                  tooltip: 'Facebook Profile',
                  color: Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Information Card with modern styling
            Card(
              elevation: isDark ? 1 : 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadowColor: Colors.orange.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildInfoRow(
                      context,
                      Icons.school,
                      'คณะ',
                      'ครุศาสตร์อุตสาหกรรมและเทคโนโลยี',
                    ),
                    const Divider(height: 20),
                    _buildInfoRow(
                      context,
                      Icons.account_balance,
                      'มหาวิทยาลัย',
                      'สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง',
                    ),
                    const Divider(height: 20),
                    _buildInfoRow(
                      context,
                      Icons.email,
                      'อีเมล',
                      '67030351@kmitl.ac.th',
                    ),
                    const Divider(height: 20),
                    _buildInfoRow(
                      context,
                      Icons.code,
                      'วิชาที่ชอบ',
                      'Mobile Development',
                    ),
                    const Divider(height: 20),
                    _buildInfoRow(
                      context,
                      Icons.star,
                      'เป้าหมาย',
                      'พัฒนาแอปให้ได้ 1 ตัว',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Challenge 1: Animated Action Button
            AnimatedActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AiChatPage()),
                );
              },
              icon: const Icon(Icons.smart_toy, color: Colors.white),
              label: const Text('ทดลอง AI Chat'),
              backgroundColor: Colors.orange,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.orange, size: 24),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Challenge 1: Animated Action Button using AnimatedContainer
class AnimatedActionButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget label;
  final Widget icon;
  final Color backgroundColor;

  const AnimatedActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  State<AnimatedActionButton> createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<AnimatedActionButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          height: 52,
          transform: Matrix4.identity()
            ..scale(_isPressed ? 0.96 : (_isHovered ? 1.04 : 1.0)),
          decoration: BoxDecoration(
            color: _isPressed
                ? widget.backgroundColor.withOpacity(0.85)
                : (_isHovered ? widget.backgroundColor.withOpacity(0.95) : widget.backgroundColor),
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: widget.backgroundColor.withOpacity(_isPressed ? 0.2 : 0.4),
                blurRadius: _isPressed ? 4 : (_isHovered ? 12 : 8),
                offset: Offset(0, _isPressed ? 2 : (_isHovered ? 6 : 4)),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              const SizedBox(width: 10),
              DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                child: widget.label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Challenge 1: Social Media Link Button with hover/press animation
class SocialMediaButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String tooltip;
  final Color color;

  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
    required this.color,
  });

  @override
  State<SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          onTap: _launchUrl,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(12),
            transform: Matrix4.identity()
              ..scale(_isPressed ? 0.9 : (_isHovered ? 1.15 : 1.0)),
            decoration: BoxDecoration(
              color: _isPressed
                  ? widget.color.withOpacity(0.2)
                  : (_isHovered ? widget.color.withOpacity(0.15) : (isDark ? Colors.white10 : Colors.grey.shade100)),
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.color.withOpacity(_isHovered ? 0.8 : 0.2),
                width: 2,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: widget.color.withOpacity(0.25),
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ]
                  : [],
            ),
            child: Icon(
              widget.icon,
              color: widget.color,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}
