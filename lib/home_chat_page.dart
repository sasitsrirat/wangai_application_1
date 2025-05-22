import 'package:flutter/material.dart';
import 'chat_room_page.dart';

class HomeChatPage extends StatelessWidget {
  final List<Map<String, dynamic>> chatList = [
    {
      'name': 'Eleanor Pena',
      'message': 'Sure, sounds good!',
      'time': '9:30 AM',
      'avatar': 'https://i.pravatar.cc/150?img=1',
      'online': true,
      'unread': 1,
    },
    {
      'name': 'Cody Fischer',
      'message': 'Here’s the photo from th...',
      'time': '8:45 AM',
      'avatar': 'https://i.pravatar.cc/150?img=2',
      'online': false,
      'unread': 0,
    },
    {
      'name': 'Theresa Webb',
      'message': 'Absolutely!',
      'time': 'Yesterday',
      'avatar': 'https://i.pravatar.cc/150?img=3',
      'online': false,
      'unread': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.chat_bubble, size: 32, color: Colors.green),
                SizedBox(width: 8),
                Text('Wangai', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Chats header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Chats', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),

          // Chat list
          Expanded(
            child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final chat = chatList[index];
                return ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatRoomPage(userName: chat['name'], chatId: '',),
                    ),
                  ),
                  leading: Stack(
                    children: [
                      CircleAvatar(backgroundImage: NetworkImage(chat['avatar']), radius: 24),
                      if (chat['online'])
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(chat['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(chat['message'], overflow: TextOverflow.ellipsis),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(chat['time'], style: TextStyle(fontSize: 12)),
                      if (chat['unread'] > 0)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${chat['unread']}',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                    ],
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
