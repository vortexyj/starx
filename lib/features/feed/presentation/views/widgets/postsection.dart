import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/features/feed/presentation/views/widgets/custompostinfo.dart';
import 'package:starx/features/feed/presentation/views/widgets/postactionpart.dart';

class PostBox extends StatelessWidget {
  const PostBox({
    super.key,
    required this.userName,
    required this.date,
    required this.image,
    required this.likesNumber,
    required this.commentsNumber,
    required this.sharesNumber,
    required this.imageUrl,
  });
  final String userName;
  final String date;
  final String image;
  final int likesNumber;
  final int commentsNumber;
  final int sharesNumber;
  final String imageUrl;
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
              imageUrl: imageUrl,
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
                  children: [
                    PostInfo(
                      userName: 'youssefjehad',
                      date: '2 days ago',
                      profileImage: AssetsData.testPhoto,
                    ),
                    Spacer(),
                    PostActionsPart(
                      likesNumber: 120,
                      commentsNumber: 20,
                      sharesNumber: 4,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
