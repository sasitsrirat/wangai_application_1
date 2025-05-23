import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatRoomPage extends StatelessWidget {
  final String chatId;
  final String userName;

  ChatRoomPage({super.key, required this.chatId, required this.userName});

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
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: BackButton(color: Colors.green[800]),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green[200],
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(
              userName,
              style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: mockMessages.length,
              itemBuilder: (context, index) {
                final msg = mockMessages[mockMessages.length - index - 1];
                final isMe = msg['senderId'] == currentUserId;
                return _ChatBubble(
                  text: msg['text'],
                  time: formatTimestamp(msg['timestamp']),
                  isMe: isMe,
                );
              },
            ),
          ),
          _MessageInputBar(),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;

  const _ChatBubble({
    required this.text,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              decoration: BoxDecoration(
                color: isMe ? Colors.green[200] : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft:
                      isMe
                          ? const Radius.circular(16)
                          : const Radius.circular(4),
                  bottomRight:
                      isMe
                          ? const Radius.circular(4)
                          : const Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                text,
                style: TextStyle(color: Colors.grey[900], fontSize: 15),
              ),
            ),
            const SizedBox(height: 4),
            Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }
}

class _MessageInputBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.green[600],
            child: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
