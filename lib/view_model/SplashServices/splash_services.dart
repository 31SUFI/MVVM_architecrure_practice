import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/util/routes/routes-name.dart';

import '../user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    getUserData().then((value) {
      if (value.token == null || value.token!.isEmpty) {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesNames.login, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesNames.home, (route) => false);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
