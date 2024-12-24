import 'package:http/http.dart' as http;

abstract class BaseApiServices {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, dynamic body);
  dynamic _returnResponse(http.Response response);
}
