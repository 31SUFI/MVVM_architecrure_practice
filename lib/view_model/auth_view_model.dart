import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/util/routes/utils.dart';

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
      Utils.toastMessage("Login Successful");
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
}
