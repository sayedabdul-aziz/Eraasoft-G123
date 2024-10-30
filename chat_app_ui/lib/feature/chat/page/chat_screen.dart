// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_app_ui/feature/chat/widgets/chat_list.dart';
import 'package:chat_app_ui/feature/chat/widgets/fav_contacts.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Row(
          children: [
            const Text(
              'Chats',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavContacts(),
          SizedBox(height: 15),
          ChatList(),
        ],
      ),
    );
  }
}
