import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/modules/dashboard_screen/logic.dart';
import 'package:movie/modules/dashboard_screen/model/account_data_model.dart';
import 'package:movie/modules/dashboard_screen/model/authentication_model.dart';
import 'package:movie/modules/dashboard_screen/model/movie_model.dart';

import '../../api_services/get_service.dart';
import '../../api_services/url.dart';

getSessionKey(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<DashboardLogic>().authenticationModel =
        AuthenticationModel.fromJson(response);
    Get.find<DashboardLogic>().update();
    if (Get.find<DashboardLogic>().authenticationModel.success.toString() == 'true') {
      Get.find<DashboardLogic>().sessionId=Get.find<DashboardLogic>().authenticationModel.requestToken;
      if(Get.find<DashboardLogic>().sessionId.toString()!="null"){
        getMethod(context, accountId,{"api_key":apiKey,"session_id":Get.find<DashboardLogic>().authenticationModel.requestToken}, false, getAccountId);

        Get.find<DashboardLogic>().updateFormLoaderController(false);
        Get.find<DashboardLogic>().update();
      }

    } else {


          Get.find<DashboardLogic>().updateFormLoaderController(false);
          Get.find<DashboardLogic>().update();
    }
  } else if (!responseCheck) {
   Get.find<DashboardLogic>().updateFormLoaderController(false);
   Get.find<DashboardLogic>().update();
  }
}
getAccountId(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<DashboardLogic>().accountDataModel =
        AccountDataModel.fromJson(response);
    Get.find<DashboardLogic>().update();
    Get.find<DashboardLogic>().accountId= Get.find<DashboardLogic>().accountDataModel.id;
    if(Get.find<DashboardLogic>().accountId !=null){
      getMethod(context, movieData, {"api_key":apiKey,"session_id":Get.find<DashboardLogic>().sessionId}, false, MovieService);

      Get.find<DashboardLogic>().updateFormLoaderController(false);
      Get.find<DashboardLogic>().update();
    }
  } else if (!responseCheck) {

    Get.find<DashboardLogic>().updateFormLoaderController(false);
    Get.find<DashboardLogic>().update();

  }
}
MovieService(
    BuildContext context, bool responseCheck, Map<String, dynamic> response) {
  if (responseCheck) {
    Get.find<DashboardLogic>().movie =
        Movie.fromJson(response);

    Get.find<DashboardLogic>().updateFormLoaderController(false);
    Get.find<DashboardLogic>().update();


  } else if (!responseCheck) {


    Get.find<DashboardLogic>().updateFormLoaderController(false);
    Get.find<DashboardLogic>().update();
  }
}