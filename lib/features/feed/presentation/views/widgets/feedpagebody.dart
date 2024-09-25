import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/features/feed/presentation/views/widgets/customappbar.dart';
import 'package:starx/features/feed/presentation/views/widgets/custompostlist.dart';

class FeedPageBody extends StatelessWidget {
  const FeedPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(AssetsData.backgroundRectangle),
        Padding(
          padding: const EdgeInsets.only(left: 17.0, right: 17.0),
          child: Center(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const CustomFeedappbar(),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Feed',
                        style: Styles.title25B,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                //scrollpostBoxList
                CustomSilverList(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
