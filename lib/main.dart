import 'package:flutter/material.dart';
import 'package:starx/features/splash/view/splashview.dart';

void main() {
  runApp(const StarX());
}

class StarX extends StatelessWidget {
  const StarX({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashView());
  }
}
