import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/core/utils/styles.dart';

class SendMessageTextFeildCustom extends StatelessWidget {
  const SendMessageTextFeildCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 320,
          height: 95,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: ColorStyle.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 30,
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Write a message...",
                    hintStyle: Styles.body14,
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsData.sendbutton,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
