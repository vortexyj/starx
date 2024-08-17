import 'package:flutter/material.dart';
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
        return const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: MessageCard(),
        );
      },
    );
  }
}
