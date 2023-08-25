import 'package:flutter/material.dart';
import 'package:mad_mom_mag/presentation/auth/sign_in/sign_in_page.dart';
import 'package:mad_mom_mag/presentation/auth/auth_states.dart';
import 'package:mad_mom_mag/presentation/auth/sign_up/sign_up_page.dart';
import 'package:mad_mom_mag/presentation/splash/splash.dart';
import 'package:mad_mom_mag/presentation/tab_bar.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String signInPage = "/signInPage";
  static const String tabBox = "/tabbox";
  static const String signUpPage = "/signUpPage";
  static const String sendCodeToGmail = "/sendCodeToGmail";
  static const String confirmCode = "/confirmCode";
  static const String authStates = "/authStates";
  static const String articleDetails = "/articleDetails";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (context) {
          return const SignInPage();
        });

      case RouteNames.signUpPage:
        return MaterialPageRoute(builder: (context) => const SignUpPage());

      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => const TabBarScreen());

      // case RouteNames.sendCodeToGmail:
      //   return MaterialPageRoute(builder: (context) => const SendCodeToGmail());

      // case RouteNames.articleDetails:
      //   return MaterialPageRoute(builder: (context) =>  ArticleDetails());

      case RouteNames.authStates:
        return MaterialPageRoute(builder: (context) => const AuthStates());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}
