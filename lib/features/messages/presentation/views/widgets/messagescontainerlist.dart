import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:starx/core/utils/approutes.dart';
import 'package:starx/features/messages/presentation/views/widgets/messagecardcustom.dart';

class MessagesContainerListSection extends StatelessWidget {
  const MessagesContainerListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
              onTap: () {
                context.go(AppRouter.kChatPage);
              },
              child: const MessageCard()),
        );
      },
    );
  }
}
