import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starx/core/utils/styles.dart';
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
            CachedNetworkImage(
              height: double.infinity,
              width: double.infinity,
              imageUrl:
                  'https://firebasestoragex.googleapis.com/v0/b/starx-429cb.appspot.com/o/images%2FDUJkeMCXcAAJNn1.jpg?alt=media&token=b0421dd6-23f0-4598-b2a9-a76567e1e97e',
              errorWidget: (context, url, error) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 70,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Error loading the image',
                      style: Styles.body16,
                    )
                  ],
                );
              },
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
