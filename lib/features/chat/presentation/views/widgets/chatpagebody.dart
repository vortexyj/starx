import 'package:flutter/material.dart';
import 'package:starx/features/chat/presentation/views/widgets/charbarinfocustom.dart';
import 'package:starx/features/chat/presentation/views/widgets/chatbubblelist.dart';
import 'package:starx/features/chat/presentation/views/widgets/sendmessagetextfieldcustom.dart';

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 17.0, right: 17.0, top: 8.0),
      child: Stack(children: [
        Center(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomChatBarInfo(),
              ),
              ChatBubbleList(),
            ],
          ),
        ),
        SendMessageTextFeildCustom()
      ]),
    ));
  }
}
