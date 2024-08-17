import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/features/profile/presentation/views/widgets/customimageshapecliper.dart';

class ImageRotatedFrame extends StatelessWidget {
  const ImageRotatedFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80, // Width of the container
        height: 80, // Height of the container
        color: Colors.transparent, // Background color
        child: ClipPath(
          clipper: CustomShapeClipper(),
          child: Image.asset(
            AssetsData.testPhoto, // Replace with your image path
            fit: BoxFit.cover, // Match the container's height
          ),
        ),
      ),
    );
  }
}
