import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatRoomPage extends StatelessWidget {
  final String chatId;
  final String userName; // ✅ เพิ่มตรงนี้

  ChatRoomPage({required this.chatId, required this.userName}); // ✅ เพิ่ม this.userName
  final String currentUserId = 'userA'; // mock user
  final List<Map<String, dynamic>> mockMessages = [
    {
      'senderId': 'userA',
      'text': 'Hey! How are you?',
      'timestamp': DateTime(2025, 5, 21, 10, 0),
    },
    {
      'senderId': 'userB',
      'text': "I'm good, thanks! You?",
      'timestamp': DateTime(2025, 5, 21, 10, 1),
    },
    {
      'senderId': 'userA',
      'text': 'Doing great. Ready for our meeting?',
      'timestamp': DateTime(2025, 5, 21, 10, 2),
    },
    {
      'senderId': 'userB',
      'text': "Absolutely. Let's do this!",
      'timestamp': DateTime(2025, 5, 21, 10, 3),
    },
  ];

  String formatTimestamp(DateTime timestamp) {
    return DateFormat('hh:mm a').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: mockMessages.length,
              itemBuilder: (context, index) {
                final msg = mockMessages[mockMessages.length - index - 1];
                final isMe = msg['senderId'] == currentUserId;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
                  child: Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment:
                          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.green[200] : Colors.grey[300],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
                              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
                            ),
                          ),
                          child: Text(msg['text']),
                        ),
                        SizedBox(height: 4),
                        Text(
                          formatTimestamp(msg['timestamp']),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
