import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/presentation/app_routes.dart';
import 'package:mad_mom_mag/presentation/auth/sign_in/widgets/stack_metod.dart';

import 'package:mad_mom_mag/utils/loading_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 240, 240),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const StackMethod(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                ),
                Column(
                  children: [
                    const Center(
                      child: Text('or continue with'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.2,
                          right: MediaQuery.of(context).size.width * 0.2,
                          top: MediaQuery.of(context).size.width * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            maxRadius:
                                MediaQuery.of(context).size.height * 0.045,
                            child: Icon(Icons.facebook_sharp,
                                size: MediaQuery.of(context).size.width * 0.1),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red,
                            maxRadius:
                                MediaQuery.of(context).size.height * 0.045,
                            child: Text(
                              'G',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.1,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.16),
                      child: Row(
                        children: [
                          const Text("Don't have an account yet? "),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteNames.signUpPage);
                            },
                            child: const Text(
                              'Registration',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Visibility(
              visible: context.watch<AuthCubit>().state is AuthLoadingState,
              child: const LoadingPage())
        ],
      ),
    );
  }
}
