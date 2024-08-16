import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/core/utils/styles.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: ClipOval(
            child: Image.asset(
              AssetsData.profiletestPhoto,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Youssef Jehad',
              style: Styles.body14.copyWith(color: ColorStyle.white),
            ),
            Text(
              '2 hrs ago',
              style: Styles.body12Gray.copyWith(color: ColorStyle.white),
            )
          ],
        )
      ],
    );
  }
}
