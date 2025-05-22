import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              // เพิ่มการ logout จริงในภายหลัง
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Logged out')),
              );
            },
          ),
        ],
      ),
    );
  }
}
