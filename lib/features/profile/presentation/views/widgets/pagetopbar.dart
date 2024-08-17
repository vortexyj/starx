import 'package:flutter/material.dart';

class PageTopBar extends StatelessWidget {
  const PageTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.arrow_back_ios_new,
        ),
      ],
    );
  }
}
