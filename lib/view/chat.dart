import 'package:flutter/material.dart';
import 'package:project2/utils/customWidgts.dart';

class ChatScreen extends StatelessWidget {
  final List<Chat> chats = List.generate(
      20,
      (index) => Chat(
            username: 'User $index',
            message: 'Hello, this is message number $index',
            time: '${index}m ago',
            avatarUrl: 'https://via.placeholder.com/150',
          ));

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const App_emoji_search(inputText: "Chat"),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: buildChatList(),
        ),
      ]),
    );
  }

  Widget buildChatList() {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ChatListTile(chat: chats[index]);
      },
    );
  }
}
