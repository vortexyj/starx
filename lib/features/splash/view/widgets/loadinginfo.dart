import 'package:flutter/material.dart';
import 'package:starx/core/utils/styles.dart';

class Loadinginfo extends StatelessWidget {
  const Loadinginfo({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Styles.title25B.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: Styles.body14,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16 * 2.5),
            Transform.scale(
              scale: 1.8,
              child: const CircularProgressIndicator.adaptive(),
            ),
          ],
        ),
      ),
    );
  }
}
