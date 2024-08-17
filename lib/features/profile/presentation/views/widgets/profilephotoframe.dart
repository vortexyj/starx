import 'package:flutter/widgets.dart';
import 'package:starx/features/profile/presentation/views/widgets/customborderpainter.dart';
import 'package:starx/features/profile/presentation/views/widgets/imagerotatedframe.dart';

class Profilephotowithframe extends StatelessWidget {
  const Profilephotowithframe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.785398,
      child: CustomPaint(
        size: const Size(20, 20), // Adjust size as needed
        painter: CustomBorderPainter(),
        child: Transform.rotate(
          angle: -0.785398,
          child:
              const SizedBox(height: 100, width: 100, child: ImageRotatedFrame()
                  // child: Image.asset(AssetsData.profiletestPhoto),
                  ),
        ),
      ),
    );
  }
}
