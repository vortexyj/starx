import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/features/feed/presentation/views/widgets/custompostinfo.dart';
import 'package:starx/features/feed/presentation/views/widgets/postactionpart.dart';

class LoadingPostView extends StatelessWidget {
  const LoadingPostView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ClipRRect(
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
                imageUrl: '',
                errorWidget: (context, url, error) {
                  return const Center(
                    child: Icon(
                      Icons.access_time_filled_outlined,
                      size: 70,
                    ),
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
                        userName: 'UserName',
                        date: '2 days ago',
                        profileImage: AssetsData.testPhoto,
                      ),
                      Spacer(),
                      PostActionsPart(
                        likesNumber: 000,
                        commentsNumber: 00,
                        sharesNumber: 0,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
