import 'package:flutter/material.dart';
import 'package:mvvm_architecture/util/routes/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Container(
        child: Center(
          child: InkWell(
              onTap: () {
                Utils.toastMessage('This is a toast message!');
                Utils.flushBarErrorMessage("LMAO Error", context);
              },
              child: const Text('Click here to show toast && flusbar!')),
        ),
      ),
    );
  }
}
