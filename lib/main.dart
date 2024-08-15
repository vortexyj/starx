import 'package:flutter/material.dart';
import 'package:starx/core/utils/approutes.dart';

void main() {
  runApp(const StarX());
}

class StarX extends StatelessWidget {
  const StarX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
