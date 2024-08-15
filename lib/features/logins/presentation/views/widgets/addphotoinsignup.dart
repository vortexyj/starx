import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';

class AddPhotoInSignUp extends StatelessWidget {
  const AddPhotoInSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 90, child: Image.asset(AssetsData.addPhoto)),
        Text(
          'Add Photo',
          style: Styles.body16
              .copyWith(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
