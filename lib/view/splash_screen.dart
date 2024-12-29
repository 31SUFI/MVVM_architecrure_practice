import 'package:flutter/material.dart';
import 'package:mvvm_architecture/view/home_screen_view.dart';
import 'package:mvvm_architecture/view_model/SplashServices/splash_services.dart'; // Adjust the import according to your project structure

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  SplashServices splashServices = SplashServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
