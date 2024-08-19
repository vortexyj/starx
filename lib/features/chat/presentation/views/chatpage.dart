import 'package:flutter/material.dart';
import 'package:starx/features/chat/presentation/views/widgets/chatpagebody.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: ChatPageBody());
  }
}
