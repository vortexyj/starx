import 'package:flutter/material.dart';
import 'dart:math';

import 'package:starx/core/utils/assets.dart'; // For rotation

// Your custom animation class
class MyCustomAnimation extends StatefulWidget {
  @override
  _MyCustomAnimationState createState() => _MyCustomAnimationState();
}

class _MyCustomAnimationState extends State<MyCustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The rotating image
        Positioned(
          bottom: -100, // Offset so that only 75% of the image is visible
          right: -100, // Offset so that only 75% of the image is visible
          child: Transform.rotate(
            angle: _animation.value,
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.75, // Adjust size to 75%
              height: MediaQuery.of(context).size.width *
                  0.75, // Ensure it remains square
              child: Image.asset(
                AssetsData.blackRectangle, // Your image path
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        // The "Next" text that appears after the animation
        if (_controller.isCompleted) // Show text only after animation completes
          Positioned(
            bottom: 50, // Adjust position as needed
            right: 30, // Adjust position as needed
            child: Text(
              'Next ➔',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
