import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/presentation/auth/sign_in/sign_in_page.dart';
import 'package:mad_mom_mag/utils/loading_page.dart';

// ignore: must_be_immutable
class SendCodeToGmail extends StatefulWidget {
  const SendCodeToGmail({super.key});

  @override
  State<SendCodeToGmail> createState() => _SendCodeToGmailState();
}

class _SendCodeToGmailState extends State<SendCodeToGmail> {
  final TextEditingController _emmaillcont = TextEditingController();

  final TextEditingController _passwordlcont = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).unfocus()),
      child: Stack(
        children: [
          Scaffold(
            // appBar: AppBar(backgroundColor: Colors.transparent),
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
                            'Send Code to Gmail',
                            style: TextStyle(
                              fontFamily: 'Fjalla',
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.032,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontFamily: 'Fjalla'),
                          'We need your email adress and password so we can send you the register confirmation code.',
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
                            controller: _emmaillcont,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.email),
                              labelText: "Email Address",
                              labelStyle: TextStyle(
                                fontFamily: 'Fjalla',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.019),
                            color: Colors.black12,
                          ),
                          child: TextFormField(
                            obscureText: obscureText,
                            controller: _passwordlcont,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.password),
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                fontFamily: 'Fjalla',
                              ),
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
                            onPressed: () {
                              if (_emmaillcont.text.isNotEmpty &&
                                  _passwordlcont.text.isNotEmpty) {
                                context.read<AuthCubit>().sendCodeToGmail(
                                    _emmaillcont.text, _passwordlcont.text);
                                // if (context.read<AuthCubit>().state
                                //     is AuthSendCodeSuccessState) {
                                //   Navigator.pushNamed(
                                //       context, RouteNames.confirmCode);
                                // }
                              } else if (_emmaillcont.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                    content:
                                        Text('Did you forget entering Email!!'),
                                  ),
                                );
                              } else if (_passwordlcont.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                    content: Text(
                                        'Did you forget entering Password!!'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                    content: Text(
                                        'Something went wrong please try again!!'),
                                  ),
                                );
                              }
                            },
                            child: const Center(
                              child: Text('Send Gmail'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.39,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You want to try ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignInPage())),
                            (route) => false),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: context.watch<AuthCubit>().state is AuthLoadingState,
            child: const LoadingPage(),
          ),
        ],
      ),
    );
  }
}
