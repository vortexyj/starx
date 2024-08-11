import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';

class BackGroundImageSplash extends StatelessWidget {
  const BackGroundImageSplash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        height: 256,
        width: 314,
        AssetsData.backgroundRectangle, // Path to your image
        fit: BoxFit.cover,
      ),
    );
  }
}
