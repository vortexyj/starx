import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/features/messages/presentation/views/widgets/title.dart';

class MesseagesPageBody extends StatelessWidget {
  const MesseagesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AssetsData.background3),
        Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const TitleBar(),
                const SizedBox(height: 40),
                SearchBar(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: ColorStyle.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.black54),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for contacts",
                hintStyle: Styles.body14,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
