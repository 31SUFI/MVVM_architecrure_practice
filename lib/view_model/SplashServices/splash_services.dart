import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/util/routes/routes-name.dart';

import '../user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserDate() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      if (value.token == "null" || value.token == "") {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesNames.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
