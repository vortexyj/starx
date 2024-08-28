import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starx/core/utils/approutes.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/core/utils/styles.dart';
import 'package:starx/core/widgets/customanimatednextbuttom.dart';
import 'package:starx/core/widgets/custombackgroundsplash.dart';
import 'package:starx/core/widgets/customtextfieldlogins.dart';
import 'package:starx/features/logins/presentation/manager/SetupCubit/setup_cubit_cubit.dart';
import 'package:starx/features/logins/presentation/views/widgets/addphotoinsignup.dart';

// ignore: must_be_immutable
class SetupPagebody extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? image;
  String? uRL;
  SetupPagebody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetupCubitCubit, SetupCubitState>(
      listener: (context, state) {
        if (state is SetupCubitSuccess) {
          context.go(AppRouter.kNavigationbarPage);
        } else if (state is SetupCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black,
            content: Text(state.failure),
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
                            'SetUP Page',
                            style: Styles.title39B,
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          GestureDetector(
                            onTap: () async {
                              getDownloadURL();
                              uRL = await getDownloadURL();
                            },
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
                              onTap: () {
                                // final String email =
                                //     GoRouterState.of(context).extra! as String;
                                // Get the current user
                                User? user = FirebaseAuth.instance.currentUser;

                                // Get the user's email
                                String? email = user?.email;
                                context.read<SetupCubitCubit>().fetchSetupPage(
                                    'lololol.jpg',
                                    _passwordController.text,
                                    email!,
                                    0,
                                    0,
                                    0);
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

  Future<String> getDownloadURL() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      image = File(pickedFile!.path);
      final path = 'images/${pickedFile.name}';

      final ref = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask = ref.putFile(image!);
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();

      return (urlDownload);
    } on PlatformException catch (e) {
      return (e.toString());
    }
  }
}
