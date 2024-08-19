import 'package:flutter/material.dart';
import 'package:starx/core/utils/colors.dart';

class AwayMesseageBubble extends StatelessWidget {
  const AwayMesseageBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding:
              const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: ColorStyle.lightGray.withOpacity(0.15),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32))),
          child: const Text(
            'Hisadadadas',
            style: TextStyle(color: ColorStyle.black),
          )),
    );
  }
}
