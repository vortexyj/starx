import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';

class GridList extends StatelessWidget {
  const GridList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            color: Colors.transparent,
            child: Image.asset(AssetsData.testPhoto),
          );
        },
        childCount: 30,
      ),
    );
  }
}
