import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starx/core/utils/approutes.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/core/widgets/customanimatednextbuttom.dart';
import 'package:starx/core/widgets/custombackgroundsplash.dart';
import 'package:starx/features/logins/presentation/views/widgets/addphotoinsignup.dart';
import 'package:starx/features/logins/presentation/views/widgets/logindatafeild.dart';

class SignupPageBody extends StatelessWidget {
  const SignupPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImageSplash(),
          Center(
            child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Image.asset(AssetsData.logo)),
          ),
          Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        'SignUP',
                        style: Styles.title39B,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const AddPhotoInSignUp(),
                      const SizedBox(
                        height: 20,
                      ),
                      const LoginDataFeild(
                          accountHint: 'Account', passwordHint: 'Password'),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.go(AppRouter.kloginPage);
                          },
                          child: const CustomAnimatedButton(order: 'SignUp ➔'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
