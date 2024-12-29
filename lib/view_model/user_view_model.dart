import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    print(
        "Saving token: ${user.token}"); // Log the token to check if it's valid
    sharedPreferences.setString('token', user.token ?? "");
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    print("Retrieved token: $token");
    return UserModel(
      token: token ?? "",
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
