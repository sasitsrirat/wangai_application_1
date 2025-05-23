import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wangai_application_1/views/chat_room_page.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chatUsers = [
    {
      'name': 'Eleanor Pena',
      'uid': 'uid_1', // สมมุติ uid ของคู่สนทนา
    },
    {
      'name': 'Cody Fischer',
      'uid': 'uid_2',
    },
    // เพิ่มรายชื่ออื่น ๆ ตามต้องการ
  ];

  String generateChatId(String uid1, String uid2) {
    final sorted = [uid1, uid2]..sort();
    return '${sorted[0]}_${sorted[1]}';
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('Chats')),
      body: ListView.builder(
        itemCount: chatUsers.length,
        itemBuilder: (context, index) {
          final user = chatUsers[index];
          final otherUid = user['uid'];
          final userName = user['name'];
          final chatId = generateChatId(currentUser!.uid, otherUid);

          return ListTile(
            leading: CircleAvatar(child: Text(userName[0])),
            title: Text(userName),
            subtitle: Text("Tap to chat"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatRoomPage(
                    chatId: chatId,
                    userName: userName,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
