import 'package:flutter/material.dart';
import 'package:starx/core/widgets/customtextfieldlogins.dart';

class LoginDataFeild extends StatelessWidget {
  const LoginDataFeild(
      {super.key, required this.accountHint, required this.passwordHint});
  final String accountHint;
  final String passwordHint;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 0.88,
          child: CustomTextFieldLogins(
            hint: accountHint,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Opacity(
          opacity: 0.88,
          child: CustomTextFieldLogins(
            hint: passwordHint,
          ),
        ),
      ],
    );
  }
}
