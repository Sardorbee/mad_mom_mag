import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/presentation/app_routes.dart';
import 'package:mad_mom_mag/presentation/auth/sign_in/sign_in_page.dart';

class AuthStates extends StatefulWidget {
  const AuthStates({super.key});

  @override
  State<AuthStates> createState() => _AuthStatesState();
}

class _AuthStatesState extends State<AuthStates> {
  @override
  void initState() {
    context.read<AuthCubit>().checkLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSendCodeSuccessState) {
          Navigator.pushReplacementNamed(context, RouteNames.confirmCode);
        } else if (state is AuthRegisteredState) {
          Navigator.pushReplacementNamed(context, RouteNames.tabBox);
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
      child: const SignInPage(),
    );
  }
}
