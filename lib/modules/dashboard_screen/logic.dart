
import 'package:get/get.dart';

import 'model/account_data_model.dart';
import 'model/authentication_model.dart';
import 'model/movie_model.dart';

class DashboardLogic extends GetxController {

  AuthenticationModel authenticationModel=AuthenticationModel();
  Movie movie=Movie();
  AccountDataModel accountDataModel=AccountDataModel();
  bool formLoaderController = true;

  updateFormLoaderController(bool newValue) {
    formLoaderController = newValue;
    update();
  }
  String? sessionId;
  int? accountId;
  String appBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Favorite';
      default:
        return 'Home';
    }
  }

  List<Results> favoriteMovies = [];



}