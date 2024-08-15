import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starx/core/utils/approutes.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/core/widgets/customanimatednextbuttom.dart';
import 'package:starx/core/widgets/custombackgroundsplash.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const BackGroundImageSplash(),
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Welcome to',
                style: Styles.body16,
              ),
              Text(
                'StarX',
                style: Styles.title39B,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset(AssetsData.logo)),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.go(AppRouter.kloginPage);
                    },
                    child: const CustomAnimatedButton(
                      order: 'Next ➔',
                    )), // Include your custom animation
              ),
            ],
          ),
        )
      ],
    ));
  }
}
