import 'package:flutter/material.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/features/profile/presentation/views/widgets/profilephotoframe.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Profilephotowithframe(),
        const SizedBox(height: 30),
        Text(
          'Youssef Jehad',
          style: Styles.title25B,
        ),
        Text(
          '@YoussefJehad',
          style: Styles.body14,
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Posts',
                  style: Styles.body16,
                ),
                Text(
                  '30',
                  style: Styles.title25B,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Followers',
                  style: Styles.body16,
                ),
                Text(
                  '1,552',
                  style: Styles.title25B,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Follows',
                  style: Styles.body16,
                ),
                Text(
                  '128',
                  style: Styles.title25B,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
