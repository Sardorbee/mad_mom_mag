import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/user_data_cubit/userdata_cubit.dart';
import 'package:mad_mom_mag/data/models/user_model/field_keys.dart';
import 'package:mad_mom_mag/data/models/user_model/user_model.dart';
import 'package:mad_mom_mag/presentation/auth/sign_in/sign_in_page.dart';
import 'package:mad_mom_mag/presentation/auth/sign_up/widgets/auth_text_field.dart';
import 'package:mad_mom_mag/presentation/auth/confirm_page/confirm_code.dart';
import 'package:mad_mom_mag/presentation/auth/sign_up/widgets/dilalogs.dart';
import 'package:mad_mom_mag/presentation/auth/sign_up/widgets/phone_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode focusNode = FocusNode();

  bool obscureText = true;
  bool isEmailValid = false;
  TextEditingController gmailCont = TextEditingController();
  File? image;
  String? popUpButtonValue;
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
              builder: (context) => ConfirmGmailCode(),
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
                            onChanged: (value) {
                              context
                                  .read<UserDataCubit>()
                                  .updateCurrentUserField(
                                      fieldKey: UserFieldKeys.username,
                                      value: value);
                            },
                            icon: Icons.person_outline_rounded,
                            label: "Username",
                            type: TextInputType.name),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AuthTextField(
                          onChanged: (value) {
                            context
                                .read<UserDataCubit>()
                                .updateCurrentUserField(
                                    fieldKey: UserFieldKeys.email,
                                    value: value);
                          },
                          controller: gmailCont,
                          icon: Icons.email,
                          label: "Gmail Address",
                          errorText: gmailCont.text.isNotEmpty
                              ? isEmailValid
                                  ? null
                                  : "Invalid EMail"
                              : null,
                          type: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        PhoneTextField(
                          hintText: "(__) ___-__-__",
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          focusNode: focusNode,
                          maskFormaters: MaskTextInputFormatter(
                              mask: '## ### ## ##',
                              filter: {"#": RegExp(r'[0-9]')},
                              type: MaskAutoCompletionType.lazy),
                          onChanged: (v) {
                            if (v == 12) {
                              focusNode.unfocus();
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AuthTextField(
                          onChanged: (value) {
                            context
                                .read<UserDataCubit>()
                                .updateCurrentUserField(
                                    fieldKey: UserFieldKeys.password,
                                    value: value);
                          },
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
                                              0.019),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black.withOpacity(0.0),
                                  ),
                                ),
                                onPressed: () {
                                  showBottomSheetDialog();
                                },
                                child: const Center(
                                  child: Text(
                                    'Upload image',
                                    style: TextStyle(color: Colors.black45),
                                  ),
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
                          onChanged: (value) {
                            context
                                .read<UserDataCubit>()
                                .updateCurrentUserField(
                                    fieldKey: UserFieldKeys.profession,
                                    value: value);
                          },
                          icon: Icons.work,
                          label: "Profession",
                          type: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height * 0.019),
                              color: Colors.black12,
                            ),
                            width: 100,
                            child: PopupMenuButton(
                              color: Colors.white.withOpacity(0.9),
                              icon: Text(popUpButtonValue == null
                                  ? "Gender"
                                  : popUpButtonValue!),
                              onSelected: (value) {
                                context
                                    .read<UserDataCubit>()
                                    .updateCurrentUserField(
                                        fieldKey: UserFieldKeys.gender,
                                        value: value);
                                setState(() {
                                  popUpButtonValue = value;
                                });
                              },
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                      value: "Male", child: Text('Male')),
                                  const PopupMenuItem(
                                      value: "Female", child: Text('Female'))
                                ];
                              },
                            ),
                          ),
                        ),
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
                              if (context.read<UserDataCubit>().canRegister()) {
                                if (context.mounted) {
                                  await context
                                      .read<AuthCubit>()
                                      .sendCodeToGmail(
                                          gmailCont.text,
                                          context
                                              .read<UserDataCubit>()
                                              .state
                                              .userModel
                                              .password);
                                }
                              } else {
                                print('something went wrong');
                              }
                            },
                            child: const Center(
                              child: Text('Register'),
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
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      image = File(xFile.path);
      context.read<UserDataCubit>().updateCurrentUserField(
            fieldKey: UserFieldKeys.avatar,
            value: xFile.path,
          );
    }
  }

  Future<void> _getFromGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null && context.mounted) {
      image = File(xFile.path);
      context.read<UserDataCubit>().updateCurrentUserField(
            fieldKey: UserFieldKeys.avatar,
            value: xFile.path,
          );
    }
  }
}
