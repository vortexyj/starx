import 'package:flutter/material.dart';
import 'package:starx/core/utils/styles.dart';

class CustomFeedappbar extends StatelessWidget {
  const CustomFeedappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'StarX',
          style: Styles.body16.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
