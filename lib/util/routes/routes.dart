import 'package:flutter/material.dart';
import 'package:mvvm_architecture/view/home_screen.dart';
import 'package:mvvm_architecture/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case 'home_screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'login_screen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
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
