import 'package:flutter/material.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/core/utils/styles.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({
    super.key,
    required this.userName,
    required this.date,
    required this.profileImage,
  });
  final String userName;
  final String date;
  final String profileImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: ClipOval(
            child: Image.asset(
              profileImage,
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
              userName,
              style: Styles.body14.copyWith(color: ColorStyle.white),
            ),
            Text(
              date,
              style: Styles.body12Gray.copyWith(color: ColorStyle.white),
            )
          ],
        )
      ],
    );
  }
}
