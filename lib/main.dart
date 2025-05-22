import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_chat_page.dart';
import 'settings_page.dart';
import 'firebase_options.dart'; // ต้องสร้างไฟล์นี้จาก Firebase CLI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: "AIzaSyBjD24mv2rjJor0gxxz_00nqifG9XAL8WQ",
      appId: "1:224670449:android:aac8fb34f21f720c0bef50",
      messagingSenderId: "224670449",
      projectId: "wangaiapplication",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final pages = [
    HomeChatPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
