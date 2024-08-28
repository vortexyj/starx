import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/core/widgets/customanimatednextbuttom.dart';
import 'package:starx/core/widgets/custombackgroundsplash.dart';
import 'package:starx/core/widgets/customtextfieldlogins.dart';
import 'package:starx/features/logins/presentation/views/widgets/addphotoinsignup.dart';

class Testappbody extends StatelessWidget {
  Testappbody({super.key});
  final TextEditingController _passwordController = TextEditingController();
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
                        height: 120,
                      ),
                      Text(
                        'SetUP Page',
                        style: Styles.title39B,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      GestureDetector(
                        onTap: () async {},
                        child: const AddPhotoInSignUp(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Opacity(
                        opacity: 0.88,
                        child: CustomTextFieldLogins(
                          controller: _passwordController,
                          hint: 'Add UserName',
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: const CustomAnimatedButton(order: 'Next  ➔'),
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
