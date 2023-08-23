import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/data/models/user_model/user_model.dart';
import 'package:mad_mom_mag/presentation/app_routes.dart';

// ignore: must_be_immutable
class ConfirmGmailCode extends StatelessWidget {
  final UserModel userModel;

  ConfirmGmailCode({
    super.key,
    required this.userModel,
  });
  final TextEditingController _codecont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthConfirmCodeSuccessState) {
          await context.read<AuthCubit>().registerUser(userModel);
          debugPrint("${userModel.avatar},${userModel.username}");
          if (context.mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.authStates, (route) => false);
          }
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
        return GestureDetector(
          onTap: (() => FocusScope.of(context).unfocus()),
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 243, 240, 240),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirm code',
                            style: TextStyle(
                              fontFamily: 'Fjalla',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.032,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Fjalla'),
                          'We will send a code to your Gmail address! Gmail manzilingizga kod yubordik!',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.019),
                            color: Colors.black12,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _codecont,
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
                                          0.028),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(37, 43, 51, 1),
                              ),
                            ),
                            onPressed: (() async {
                              if (_codecont.text.isNotEmpty) {
                                context
                                    .read<AuthCubit>()
                                    .sendConfirmationCode(_codecont.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                    content: Text(
                                        'You should enter the code we sent to you, first!!'),
                                  ),
                                );
                              }
                            }),
                            child: const Center(
                              child: Text('Confirm'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.49,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
