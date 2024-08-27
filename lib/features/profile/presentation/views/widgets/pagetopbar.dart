import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starx/core/utils/approutes.dart';

class PageTopBar extends StatelessWidget {
  const PageTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.arrow_back_ios_new,
        ),
        IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              context.go(AppRouter.kloginPage);
            },
            icon: const Icon(Icons.logout_outlined))
      ],
    );
  }
}
