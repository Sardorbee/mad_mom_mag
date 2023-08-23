import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/data/models/user_model/user_model.dart';
import 'package:mad_mom_mag/presentation/auth/sign_in/sign_in_page.dart';
import 'package:mad_mom_mag/presentation/auth/sign_up/auth_text_field.dart';
import 'package:mad_mom_mag/presentation/auth/sign_up/confirm_code.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  ImagePicker picker = ImagePicker();
  XFile? file;
  bool obscureText = true;
  bool isEmailValid = false;
  UserModel? userModel;
  TextEditingController usernameCont = TextEditingController();
  TextEditingController gmailCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController professionCont = TextEditingController();
  TextEditingController genderCont = TextEditingController();
  File? image;
  @override
  void initState() {
    super.initState();
    gmailCont.addListener(_validateEmail);
  }

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  void _validateEmail() {
    setState(() {
      if (_emailRegex.hasMatch(gmailCont.text)) {
        setState(() {
          isEmailValid = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSendCodeSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ConfirmGmailCode(userModel: userModel!),
            ),
          );
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
              content: Text(state.errorText),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 243, 240, 240),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          'Welcome to Mad Mom Magazine 👋',
                          style: TextStyle(
                            fontFamily: 'Fjalla',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.032,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Fjalla'),
                          'Hello, I guess you are new around here. You can start using the application after sign up.',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        AuthTextField(
                            controller: usernameCont,
                            icon: Icons.person_outline_rounded,
                            label: "Username",
                            type: TextInputType.name),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AuthTextField(
                            controller: gmailCont,
                            icon: Icons.email,
                            label: "Gmail Address",
                            errorText: gmailCont.text.isNotEmpty
                                ? isEmailValid
                                    ? null
                                    : "Invalid EMail"
                                : null,
                            type: TextInputType.emailAddress),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AuthTextField(
                            controller: phoneCont,
                            icon: Icons.phone,
                            label: "Phone Number",
                            type: TextInputType.phone),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AuthTextField(
                          controller: passwordCont,
                          obscure: obscureText,
                          icon: Icons.lock,
                          label: "Password",
                          type: TextInputType.text,
                          suffixIcon: IconButton(
                            icon: Icon(obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.height *
                                              0.031),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromRGBO(37, 43, 51, 1),
                                  ),
                                ),
                                onPressed: () {
                                  showBottomSheetDialog();
                                },
                                child: const Center(
                                  child: Text('Upload image'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 120,
                              child: image != null
                                  ? Image.file(image!)
                                  : const SizedBox(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AuthTextField(
                            controller: professionCont,
                            icon: Icons.work,
                            label: "Profession",
                            type: TextInputType.text),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AuthTextField(
                            controller: genderCont,
                            icon: Icons.male,
                            label: "Gender",
                            type: TextInputType.text),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          0.031),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(37, 43, 51, 1),
                              ),
                            ),
                            onPressed: () async {
                              if (file != null &&
                                  usernameCont.text.isNotEmpty &&
                                  gmailCont.text.isNotEmpty &&
                                  phoneCont.text.isNotEmpty &&
                                  passwordCont.text.isNotEmpty &&
                                  professionCont.text.isNotEmpty &&
                                  genderCont.text.isNotEmpty) {
                                userModel = UserModel(
                                  password: passwordCont.text,
                                  username: usernameCont.text,
                                  email: gmailCont.text,
                                  contact: phoneCont.text,
                                  gender: genderCont.text,
                                  profession: professionCont.text,
                                  avatar: file!.path,
                                );

                                if (context.mounted) {
                                  await context
                                      .read<AuthCubit>()
                                      .sendCodeToGmail(
                                          gmailCont.text, passwordCont.text);

                                  if (context.mounted) {}
                                }
                              } else {
                                print('something went wrong');
                              }
                            },
                            child: const Center(
                              child: Text('Sign In'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const SignInPage())),
                                  (route) => false),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      setState(() {
        file = xFile;
        image = File(file!.path);
      });
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      setState(() {
        file = xFile;
        image = File(file!.path);
      });
    }
  }
}
