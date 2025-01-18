import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AskGuruScreen extends StatefulWidget {
  const AskGuruScreen({super.key});

  @override
  State<AskGuruScreen> createState() => _AskGuruScreenState();
}

class _AskGuruScreenState extends State<AskGuruScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final Dio _dio = Dio();

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'user', 'text': userMessage});
      });

      _controller.clear();

      try {
        final response = await _dio.post(
          'http://10.0.2.2:5000/chat',
          data: {'message': userMessage},
        );

        final botMessage = response.data['response'] as String? ?? 'No response';

        setState(() {
          _messages.add({'sender': 'bot', 'text': botMessage});
        });
      } catch (e) {
        // Handle API errors
        setState(() {
          _messages.add({'sender': 'bot', 'text': 'Failed to get response. Try again later.'});
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ask Guru'),
          leading: Image.asset('assets/images/finance_logo.png'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - 1 - index];
                  final isUserMessage = message['sender'] == 'user';
                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? Colors.blue.shade100
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12.0),
                          topRight: const Radius.circular(12.0),
                          bottomLeft: isUserMessage
                              ? const Radius.circular(12.0)
                              : const Radius.circular(0.0),
                          bottomRight: isUserMessage
                              ? const Radius.circular(0.0)
                              : const Radius.circular(12.0),
                        ),
                      ),
                      child: Text(
                        message['text'] ?? '',
                        style: TextStyle(
                          color: isUserMessage ? Colors.black : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                        ),
                        hintText: 'Type your message...',
                        hintStyle: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
