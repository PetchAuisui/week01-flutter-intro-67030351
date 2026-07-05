import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  // Predefined AI personalities (System Prompts)
  final Map<String, Map<String, String>> _personalities = {
    'friendly': {
      'name': '😊 เป็นกันเอง',
      'prompt': 'คุณคือผู้ช่วย AI แสนดี ตอบคำถามอย่างน่ารัก สุภาพ เป็นกันเอง และพูดคุยภาษาไทยอย่างเป็นธรรมชาติ มีความเห็นอกเห็นใจผู้อื่น',
    },
    'advisor': {
      'name': '🎓 อาจารย์ที่ปรึกษา',
      'prompt': 'คุณคืออาจารย์ที่ปรึกษาจากสถาบัน KMITL ที่มีความรอบรู้ ให้คำปรึกษาแก่นักศึกษาอย่างใจดี อบอุ่น และเต็มไปด้วยความรู้ทางวิชาการและแนวคิดที่เป็นประโยชน์',
    },
    'tech': {
      'name': '💻 โปรแกรมเมอร์รุ่นพี่',
      'prompt': 'คุณคือรุ่นพี่นักพัฒนาซอฟต์แวร์ผู้เชี่ยวชาญ ตอบคำถามเชิงเทคนิคและการเขียนโค้ดด้วยภาษาที่เข้าใจง่าย เป็นกันเอง และใช้ศัพท์โปรแกรมเมอร์บ้างเล็กน้อยอย่างเหมาะสม',
    },
  };

  late String _selectedPersonalityKey;

  @override
  void initState() {
    super.initState();
    _selectedPersonalityKey = 'friendly';
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': userMessage});
      _isLoading = true;
    });
    _controller.clear();
    _scrollToBottom();

    try {
      // Challenge 2: Build contents with Chat History
      final contents = _messages
          .where((msg) => !msg['text']!.startsWith('Error '))
          .map((msg) {
            return {
              "role": msg['role'] == 'user' ? 'user' : 'model',
              "parts": [
                {"text": msg['text']!}
              ]
            };
          }).toList();

      final systemPrompt = _personalities[_selectedPersonalityKey]?['prompt'] ?? '';

      final response = await http.post(
        Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent?key=${ApiConfig.geminiApiKey}',
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          // Challenge 2: Include System Prompt
          "systemInstruction": {
            "parts": [
              {"text": systemPrompt}
            ]
          },
          "contents": contents,
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
      _scrollToBottom();
    }
  }

  // Challenge 2: Clear Chat Confirmation Dialog
  void _confirmClearChat() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ล้างประวัติการสนทนา?'),
        content: const Text('คุณแน่ใจหรือไม่ว่าต้องการลบข้อความทั้งหมดในห้องแชทนี้?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ยกเลิก', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _messages.clear();
              });
              Navigator.pop(context);
            },
            child: const Text('ล้างแชท', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Map<String, String> message) {
    final isUser = message["role"] == "user";
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? Colors.orange
              : (isDark ? Colors.grey.shade800 : Colors.grey.shade200),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isUser ? const Radius.circular(16) : const Radius.circular(4),
            bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: isUser
            ? Text(
                message["text"] ?? "",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            : MarkdownBody(
                data: message["text"] ?? "",
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 15, height: 1.4),
                  listBullet: TextStyle(color: isDark ? Colors.white : Colors.black),
                  h3: TextStyle(
                    color: isDark ? Colors.orange.shade300 : Colors.orange.shade800,
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gemini AI Chat", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          if (_messages.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'ล้างประวัติการสนทนา',
              onPressed: _confirmClearChat,
            ),
        ],
      ),
      body: Column(
        children: [
          // Challenge 2: AI Personality (System Prompt) Selector
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
            child: Row(
              children: [
                const Icon(Icons.face, color: Colors.orange, size: 20),
                const SizedBox(width: 10),
                const Text(
                  "บุคลิกของ AI:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey.shade800 : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange.withOpacity(0.3)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedPersonalityKey,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.orange),
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        items: _personalities.entries.map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.key,
                            child: Text(entry.value['name'] ?? ''),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedPersonalityKey = value;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 64,
                          color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "👋 เริ่มต้นคุยกับ Gemini กันเลย!",
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _buildMessage(_messages[index]);
                    },
                  ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ),
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
                        hintText: "พิมพ์ข้อความที่นี่...",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
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
                    backgroundColor: Colors.orange,
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
    _scrollController.dispose();
    super.dispose();
  }
}
