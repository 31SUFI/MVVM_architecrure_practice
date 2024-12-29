import 'package:mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture/data/network/NetworkApiServices.dart';
import 'package:mvvm_architecture/models/movies_list_model.dart';
import 'package:mvvm_architecture/resource/Components/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = Networkapiservices();
  Future<MoviesListModel> getHomeData() async {
    try {
      final response = await _apiServices.get(
        AppUrl.MOVIES_LIST_ENDPOINT,
      );
      return MoviesListModel.fromJson(response);
    } catch (e) {
      // Handle the error appropriately here
      print('Error during fetching th data: $e');
      rethrow;
    }
  }
}
