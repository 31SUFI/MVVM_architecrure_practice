import 'package:flutter/material.dart';
import 'package:mvvm_architecture/util/routes/routes-name.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/home_screen'),
              child: Text('click here to move')),
        ),
      ),
    );
  }
}
