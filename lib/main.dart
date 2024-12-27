import 'package:flutter/material.dart';
import 'package:mvvm_architecture/util/routes/routes-name.dart';
import 'package:mvvm_architecture/util/routes/routes.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ), // ThemeData
          initialRoute: RoutesNames.splash,

          onGenerateRoute: Routes.generateRoute,
        ));
    // Materi,
  }
}
