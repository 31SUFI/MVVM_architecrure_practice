import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/util/routes/utils.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepository = AuthRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepository.loginApi(data).then((value) {
      final userprefernces = Provider.of<UserViewModel>(context, listen: false);
      userprefernces.saveUser(UserModel(token: value['token'].toString()));
      print("hello " + value['token'].toString());
      Utils.toastMessage("Login Successful");
      Navigator.pushNamed(context, 'home_screen');
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.toastMessage("Login Unsuccessful due to $error");
      if (kDebugMode) {
        print(error.toString());
      }
    }).whenComplete(() => setLoading(false));
  }

  Future<void> signup(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepository.signupApi(data).then((value) {
      final userprefernces = Provider.of<UserViewModel>(context, listen: false);
      userprefernces.saveUser(UserModel(token: value['token'].toString()));
      Utils.toastMessage("Signup Successful");
      Navigator.pushNamed(context, 'home_screen');
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      Utils.toastMessage("Signup Unsuccessful due to $error");
      if (kDebugMode) {
        print(error.toString());
      }
    }).whenComplete(() => setLoading(false));
  }
}
