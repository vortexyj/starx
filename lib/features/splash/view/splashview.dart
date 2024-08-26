import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:starx/features/splash/view/minisplashview.dart';
import 'package:starx/features/splash/view/widgets/splashviewbody.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    if (user?.uid == null) {
      return const SplashViewBody();
    } else {
      return const MiniSplashView();
    }
  }
}
