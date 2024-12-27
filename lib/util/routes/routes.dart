import 'package:flutter/material.dart';
import 'package:mvvm_architecture/view/home_screen.dart';
import 'package:mvvm_architecture/view/login_view.dart';
import 'package:mvvm_architecture/view/signup_view.dart';
import 'package:mvvm_architecture/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case 'splash_screen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case 'home_screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'login_screen':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'signup_screen':
        return MaterialPageRoute(builder: (_) => SignupView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${setting.name}'),
                  ),
                ));
    }
  }
}
