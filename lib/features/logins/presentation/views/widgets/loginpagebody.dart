import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starx/core/utils/approutes.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/core/widgets/customanimatednextbuttom.dart';
import 'package:starx/core/widgets/custombackgroundsplash.dart';
import 'package:starx/features/logins/presentation/manager/LoginCubit/login_cubit.dart';
import 'package:starx/features/logins/presentation/views/widgets/logindatafeild.dart';

class LoginPageBody extends StatelessWidget {
  LoginPageBody({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.go(AppRouter.kNavigationbarPage);
        } else if (state is LoginFailureState) {
          // ignore: avoid_print
          print('===============================');
          // ignore: avoid_print

          print(state.err);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorStyle.accentStroke,
            content: Text(state.err),
            duration: const Duration(seconds: 5),
          ));
        }
      },
      child: Scaffold(
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
                          height: 100,
                        ),
                        Text(
                          'Welcome back',
                          style: Styles.body16,
                        ),
                        Text(
                          'Login',
                          style: Styles.title39B,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        LoginDataFeild(
                          accountHint: 'Account',
                          passwordHint: 'Password',
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go(AppRouter.kSignupPage);
                          },
                          child: Text(
                            'Sign UP',
                            style: Styles.body16
                                .copyWith(color: ColorStyle.accentStroke),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.read<LoginCubit>().fetchLoginPage(
                                  _emailController.text,
                                  _passwordController.text);
                            },
                            child: const CustomAnimatedButton(order: 'Login ➔'),
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
      ),
    );
  }
}
