import 'package:flutter/material.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle:
              0.785398, // Rotation angle in radians (e.g., 45 degrees = 0.785398 radians)
          child: CustomPaint(
            size: const Size(0, 0), // Adjust size as needed
            painter: CustomBorderPainter(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class CustomBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2; // Adjust the thickness of the border

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
        const Rect.fromLTWH(100, 100, 100, 100),
        topLeft: const Radius.circular(35), // Adjust radius as needed
        topRight: const Radius.circular(35),
        bottomLeft: const Radius.circular(35),
        bottomRight: const Radius.circular(35),
      ));

    canvas.drawPath(
        Path.combine(PathOperation.intersect, path, roundedPath), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
