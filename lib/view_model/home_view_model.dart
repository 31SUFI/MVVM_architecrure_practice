import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/response.dart';
import 'package:mvvm_architecture/models/movies_list_model.dart';
import 'package:mvvm_architecture/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myrepo = HomeRepository();
  ApiResponse<MoviesListModel>? moviesList = ApiResponse.loading('Loading');
  void setMoviesList(ApiResponse<MoviesListModel> value) {
    moviesList = value;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading('Loading'));

    _myrepo.getHomeData().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
