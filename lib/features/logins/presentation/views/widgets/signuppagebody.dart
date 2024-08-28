import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:starx/core/utils/approutes.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/core/widgets/customanimatednextbuttom.dart';
import 'package:starx/core/widgets/custombackgroundsplash.dart';
import 'package:starx/features/logins/presentation/manager/RegisterCubit/register_cubit.dart';
import 'package:starx/features/logins/presentation/views/widgets/logindatafeild.dart';

class SignupPageBody extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          GoRouter.of(context).go(AppRouter.kSetupPageName);
          print('here from success state');
        } else if (state is RegisterFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black,
            content: Text(state.err),
            duration: const Duration(seconds: 5),
          ));
        }
      },
      builder: (context, state) {
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
                            'SignUP',
                            style: Styles.title39B,
                          ),
                          const SizedBox(
                            height: 80,
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
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.read<RegisterCubit>().fetchRegisterPage(
                                    _emailController.text,
                                    _passwordController.text);
                              },
                              child:
                                  const CustomAnimatedButton(order: 'Next  ➔'),
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
      },
    );
  }
}
