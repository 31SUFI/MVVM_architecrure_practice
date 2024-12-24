import 'package:flutter/material.dart';
import 'package:mvvm_architecture/util/routes/routes-name.dart';
import 'package:mvvm_architecture/util/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), // ThemeData
      initialRoute: RoutesNames.login,

      onGenerateRoute: Routes.generateRoute,
    ); // MaterialApp
  }
}
