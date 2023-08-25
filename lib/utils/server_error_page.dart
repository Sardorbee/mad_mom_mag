import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorServerPage extends StatelessWidget {
  const ErrorServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: LottieBuilder.asset("assets/lottie/error_server.json"),
      ),
    );
  }
}
