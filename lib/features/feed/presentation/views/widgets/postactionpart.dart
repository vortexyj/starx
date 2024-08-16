import 'package:flutter/material.dart';
import 'package:starx/features/feed/presentation/views/widgets/postactionbottom.dart';

class PostActionsPart extends StatelessWidget {
  const PostActionsPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomPostActionButton(
          icon: Icons.favorite_border,
          num: '5.2K',
        ),
        CustomPostActionButton(
          icon: Icons.add_comment_outlined,
          num: '5.2K',
        ),
        CustomPostActionButton(
          icon: Icons.share_outlined,
          num: '5.2K',
        ),
      ],
    );
  }
}
