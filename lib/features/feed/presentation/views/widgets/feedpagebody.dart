import 'package:flutter/material.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/features/feed/presentation/views/widgets/customappbar.dart';
import 'package:starx/features/feed/presentation/views/widgets/postsection.dart';

class FeedPageBody extends StatelessWidget {
  const FeedPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 17.0, right: 17.0),
        child: CustomScrollView(
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: PostBox(),
                  ); // Replace this with your item widget
                },
                childCount: 30, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}
