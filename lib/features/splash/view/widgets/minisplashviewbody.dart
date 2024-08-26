import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starx/core/utils/approutes.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/core/widgets/custombackgroundsplash.dart';
import 'package:starx/features/splash/view/widgets/loadinginfo.dart';

class MiniSplashViewBody extends StatefulWidget {
  const MiniSplashViewBody({super.key});

  @override
  State<MiniSplashViewBody> createState() => _MiniSplashViewBodyState();
}

class _MiniSplashViewBodyState extends State<MiniSplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToFeeds();
  }

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
                'Welcome Back!',
                style: Styles.body16,
              ),
              Text(
                'StarX',
                style: Styles.title39B,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset(AssetsData.logo)),
              const Loadinginfo(
                title: "Please Wait",
                description:
                    "We're setting things up for you. This will only take a moment.",
              ),
            ],
          ),
        )
      ],
    ));
  }

  void navigateToFeeds() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        // Get.to(() => const HomeView(),
        //     // calculations
        //     transition: Transition.fade,
        //     duration: kTranstionDuration);

        GoRouter.of(context).push(AppRouter.kNavigationbarPage);
      },
    );
  }
}
