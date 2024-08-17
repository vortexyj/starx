import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/features/messages/presentation/views/widgets/messagescontainerlist.dart';
import 'package:starx/features/messages/presentation/views/widgets/searchbar.dart';
import 'package:starx/features/messages/presentation/views/widgets/title.dart';

class MesseagesPageBody extends StatelessWidget {
  const MesseagesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsData.background2,
          fit: BoxFit.fill,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 17.0, right: 17.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                TitleBar(),
                SizedBox(height: 40),
                SearchBarCustom(),
                Expanded(
                  child: MessagesContainerListSection(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
