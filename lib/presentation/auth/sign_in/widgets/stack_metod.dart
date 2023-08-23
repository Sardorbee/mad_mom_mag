import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/presentation/app_routes.dart';
import 'package:mad_mom_mag/presentation/forget_password/forget_pass_page.dart';

class StackMethod extends StatefulWidget {
  const StackMethod({super.key});

  @override
  State<StackMethod> createState() => _StackMethodState();
}

class _StackMethodState extends State<StackMethod> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(37, 43, 51, 1),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.025),
            ),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.65,
          top: MediaQuery.of(context).size.height * 0.15,
          child: Text(
            'Sign In',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.08),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.22,
          left: MediaQuery.of(context).size.width * 0.05,
          // right: MediaQuery.of(context).size.width * 0.65,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * 0.023),
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.36,
            child: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.check_circle_rounded),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    obscureText: obscureText,
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      labelText: ('Password'),
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple.shade600),
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.012),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ForgetPasswordPage()))),
                    hoverColor: Colors.blue,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Do not remember the password?',
                        style: TextStyle(color: Colors.blue.shade900),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.016),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.031),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(37, 43, 51, 1),
                        ),
                      ),
                      onPressed: () async {
                        if (_emailcontroller.text.isNotEmpty &&
                            _passwordcontroller.text.isNotEmpty) {
                        await context
                            .read<AuthCubit>()
                            .signInWithPasswordAndGmail(_emailcontroller.text,
                                _passwordcontroller.text);
                        if (context.mounted) {
                        final authState = context.read<AuthCubit>().state;

                          if (context.read<AuthCubit>().state
                              is AuthLoggedState) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, RouteNames.tabBox, (route) => false);
                          } else if (authState is AuthErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(authState.errorText)));
                          }
                        }
                        } else {}
                      },
                      child: const Center(
                        child: Text('Sign In'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
