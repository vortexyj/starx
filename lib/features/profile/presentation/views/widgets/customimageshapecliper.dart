import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.8, 0) // Horizontal top line till cut off point
      ..lineTo(size.width, size.height * 0.2) // Diagonal cut
      ..lineTo(size.width, size.height) // Right vertical line
      ..lineTo(0, size.height) // Bottom horizontal line
      ..close(); // Connect back to the starting point

    // Drawing the rounded corners manually
    final roundedPath = Path()
      ..addRRect(RRect.fromRectAndCorners(
        const Rect.fromLTWH(0, 0, 80, 80),
        topLeft: const Radius.circular(37), // Adjust radius as needed
        topRight: const Radius.circular(37),
        bottomLeft: const Radius.circular(37),
        bottomRight: const Radius.circular(37),
      ));

    return Path.combine(PathOperation.intersect, path, roundedPath);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
