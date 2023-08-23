import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/presentation/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    context.read<AuthCubit>().checkLoggedState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/mad_mom.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is AuthUnAuthenticatedState) {
          Navigator.pushReplacementNamed(context, RouteNames.authStates);
        }
        if (state is AuthLoggedState) {
          Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        }
      },
    );
  }
}
