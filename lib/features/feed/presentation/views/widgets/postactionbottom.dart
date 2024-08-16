import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/core/utils/styles.dart';

class CustomPostActionButton extends StatelessWidget {
  const CustomPostActionButton(
      {super.key, required this.icon, required this.num});
  final IconData icon;
  final String num;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 12.0),
              Text(num, style: Styles.body16.copyWith(color: ColorStyle.white)),
            ],
          ),
        ),
      ),
    );
  }
}
