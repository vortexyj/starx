import 'package:flutter/material.dart';
import 'package:starx/core/utils/styles.dart';

class CustomTextFieldLogins extends StatelessWidget {
  const CustomTextFieldLogins({
    super.key,
    required this.hint,
    required this.controller,
  });
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: Styles.body14,
          ),
        ),
      ),
    );
  }
}
