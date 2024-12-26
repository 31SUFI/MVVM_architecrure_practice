import 'package:mvvm_architecture/data/app_exception.dart';
import 'package:mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture/data/network/NetworkApiServices.dart';
import 'package:mvvm_architecture/resource/Components/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = Networkapiservices();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      final response = await _apiServices.post(
        AppUrl.LOGIN,
        data,
      );
      return response;
    } catch (e) {
      FetchDataException(e.toString());
      // Handle the error appropriately here
      print('Error during login: $e');
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      final response = await _apiServices.post(
        AppUrl.REGISTER,
        {data},
      );
      return response;
    } catch (e) {
      FetchDataException(e.toString());
      // Handle the error appropriately here
      print('Error during login: $e');
      rethrow;
    }
  }
}
