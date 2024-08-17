import 'package:flutter/material.dart';
import 'package:starx/features/messages/presentation/views/widgets/messeagespagebody.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: MesseagesPageBody());
  }
}
