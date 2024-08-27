import 'dart:ui';
import 'package:flutter/material.dart';
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
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            Image.network(
              height: double.infinity,
              width: double.infinity,
              'https://firebasestorage.googleapis.com/v0/b/starx-429cb.appspot.com/o/images%2FDUJkeMCXcAAJNn1.jpg?alt=media&token=ed559502-42ad-4d2a-a152-d959f1fe3e54',
              fit: BoxFit.contain,
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
