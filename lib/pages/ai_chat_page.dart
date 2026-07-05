import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // ← เพิ่มการ Import แพ็กเกจสำหรับแปลง Markdown
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': userMessage});
      _isLoading = true;
    });

    _controller.clear();

    try {
      final response = await http.post(
        Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent?key=${ApiConfig.geminiApiKey}',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": userMessage},
              ],
            },
          ],
        }),
      );

      debugPrint("Status Code : ${response.statusCode}");
      debugPrint("Response : ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final aiText =
            data["candidates"][0]["content"]["parts"][0]["text"] ??
            "No response";

        setState(() {
          _messages.add({'role': 'assistant', 'text': aiText});
        });
      } else {
        setState(() {
          _messages.add({
            'role': 'assistant',
            'text': 'Error ${response.statusCode}\n\n${response.body}',
          });
        });
      }
    } catch (e, st) {
      debugPrint(e.toString());
      debugPrint(st.toString());

      setState(() {
        _messages.add({'role': 'assistant', 'text': e.toString()});
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildMessage(Map<String, String> message) {
    final isUser = message["role"] == "user";

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        // ขยายความกว้างสูงสุดให้กล่องข้อความ Markdown แสดงผลได้กว้างขึ้นและสวยงามขึ้น
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? Colors.orange
              : Colors.grey.shade200, // ปรับข้อความฝั่งผู้ใช้เป็นสีส้มคุมโทน
          borderRadius: BorderRadius.circular(12),
        ),
        // ใช้เงื่อนไขสลับการเรนเดอร์: ถ้าเป็นผู้ใช้ให้ใช้ Text ธรรมดา ถ้าเป็น AI ให้ใช้ MarkdownBody
        child: isUser
            ? Text(
                message["text"] ?? "",
                style: const TextStyle(color: Colors.white),
              )
            : MarkdownBody(
                data: message["text"] ?? "",
                styleSheet: MarkdownStyleSheet(
                  p: const TextStyle(color: Colors.black, fontSize: 15),
                  listBullet: const TextStyle(color: Colors.black),
                  h3: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gemini AI Chat"),
        backgroundColor: Colors.orange, // เปลี่ยนสีธีมด้านบนเป็นสีส้ม
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? const Center(
                    child: Text(
                      "👋 Hello Gemini",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _buildMessage(_messages[index]);
                    },
                  ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.orange,
                ), // ตัวโหลดสีส้ม
              ),
            ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Ask Gemini...",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 2,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton.small(
                    onPressed: _isLoading ? null : _sendMessage,
                    backgroundColor: Colors.orange, // ปุ่มส่งสีส้ม
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
