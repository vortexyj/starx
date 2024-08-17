import 'package:flutter/material.dart';

class GridActionSection extends StatelessWidget {
  const GridActionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.photo)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
      ],
    );
  }
}
