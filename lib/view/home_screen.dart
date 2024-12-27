import 'package:flutter/material.dart';
import 'package:mvvm_architecture/util/routes/routes-name.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                userPreference.remove().then((value) {
                  Navigator.pushNamed(context, RoutesNames.login);
                });
              },
              child: Text('Logout'),
            ), // InkWell
          ],
        ), // Column
      ), // SafeArea
    ); // Scaffold
  }
}
