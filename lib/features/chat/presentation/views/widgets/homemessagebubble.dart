import 'package:flutter/material.dart';
import 'package:starx/core/utils/colors.dart';

class HomeMesseageBubble extends StatelessWidget {
  const HomeMesseageBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding:
              const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: ColorStyle.lightGray.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  topLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32))),
          child: const Text(
            'Hisadadadas',
            style: TextStyle(color: ColorStyle.black),
          )),
    );
  }
}
