import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvm_architecture/data/app_exception.dart';
import 'package:mvvm_architecture/data/network/BaseApiServices.dart';

class Networkapiservices extends BaseApiServices {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic data) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data), // Encode the data to JSON
        headers: {
          'Content-Type': 'application/json', // Set JSON content type
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      ///This exception means if there is not internet
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
