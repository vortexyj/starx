import 'package:flutter/material.dart';
import 'package:starx/features/feed/presentation/views/widgets/postactionbottom.dart';

class PostActionsPart extends StatelessWidget {
  const PostActionsPart({
    super.key,
    required this.likesNumber,
    required this.commentsNumber,
    required this.sharesNumber,
  });
  final int likesNumber;
  final int commentsNumber;
  final int sharesNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomPostActionButton(
          icon: Icons.favorite_border,
          num: likesNumber.toString(),
        ),
        CustomPostActionButton(
          icon: Icons.add_comment_outlined,
          num: commentsNumber.toString(),
        ),
        CustomPostActionButton(
          icon: Icons.share_outlined,
          num: sharesNumber.toString(),
        ),
      ],
    );
  }
}
