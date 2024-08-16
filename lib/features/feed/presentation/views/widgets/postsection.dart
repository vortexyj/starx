import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/features/feed/presentation/views/widgets/custompostinfo.dart';
import 'package:starx/features/feed/presentation/views/widgets/postactionpart.dart';

class PostBox extends StatelessWidget {
  const PostBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.3,
        child: Stack(
          children: [
            Image.asset(
              AssetsData.testPhoto,
              fit: BoxFit.fill,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  children: [PostInfo(), Spacer(), PostActionsPart()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
