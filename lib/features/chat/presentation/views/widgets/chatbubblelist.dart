import 'package:flutter/material.dart';
import 'package:starx/features/chat/presentation/views/widgets/homemessagebubble.dart';

class ChatBubbleList extends StatelessWidget {
  const ChatBubbleList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const HomeMesseageBubble(); // Replace this with your item widget
        },
        childCount: 30, // Number of items in the list
      ),
    );
  }
}
