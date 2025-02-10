

import 'package:flashcardquiz/config/routes/routes_name.dart';
import 'package:flashcardquiz/features/bottom_navbar/presentation/view/BottomNavbar.dart';
import 'package:flashcardquiz/features/question/presentation/page/question_view/question_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/features/sign_in/page/login.dart';
import '../../features/auth/features/signup/page/sign_up.dart';
import '../../features/auth/features/splash/presentation/page/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.questionView:
        return MaterialPageRoute(builder: (BuildContext context) => const QuestionView());

      case RoutesName.bottomNavBar:
        return MaterialPageRoute(builder: (BuildContext context) => const BottomNavbar());

      case RoutesName.splashView:
        return MaterialPageRoute(builder: (BuildContext context) =>  SplashScreen());

      case RoutesName.signUpView:
        return MaterialPageRoute(builder: (BuildContext context) =>  RegistrationScreen());

      case RoutesName.loginView:
        return MaterialPageRoute(builder: (BuildContext context) =>  LoginScreen());


      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}