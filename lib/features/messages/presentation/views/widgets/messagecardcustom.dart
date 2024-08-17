import 'package:flutter/material.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/features/profile/presentation/views/widgets/imagerotatedframe.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: ColorStyle.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          const ImageRotatedFrame(),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Youssef Jehad',
                  style: Styles.body16.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5.0),
              Text('Hey, how’s it goin?',
                  style: Styles.body14.copyWith(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
