import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: // Background image
            Positioned.fill(
          child: Image.asset(
            AssetsData.backgroundRectangle, // Path to your image
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
