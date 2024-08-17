import 'package:flutter/material.dart';
import 'package:starx/core/utils/styles.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Messages',
          style: Styles.title25B,
        ),
      ],
    );
  }
}
