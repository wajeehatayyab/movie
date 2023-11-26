import 'dart:developer';
import 'dart:io';


import 'package:dio/dio.dart' as dio_instance;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/modules/dashboard_screen/logic.dart';


import '../utils/colors.dart';
import '../utils/language_constants.dart';
import '../widgets/custom_dialog.dart';
import 'api_logic.dart';

getMethod(BuildContext context, String apiUrl, dynamic queryData, bool addAuthHeader, Function executionMethod) async {
  dio_instance.Response response;
  dio_instance.Dio dio = dio_instance.Dio();
  Get.put(ApiLogic());

  log('Get Method Api $apiUrl ---->>>>');
  log('queryData $queryData ---->>>>');
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      Get.find<ApiLogic>().changeInternetCheckerState(true);
      try {
        response = await dio.get(apiUrl, queryParameters: queryData);

        if (response.statusCode == 200) {
          log('getApi $apiUrl ---->>>>  ${response.data}');
          executionMethod(context, true, response.data);
          return;
        }
        log('getApi $apiUrl ---->>>>  ${response.data}');
        executionMethod(context, false, {'status': null});
      } on dio_instance.DioError catch (e) {
        log('Dio Error     $apiUrl $queryData ---->>>>${e.response}');
        executionMethod(context, false, {'status': null});

        if (e.response != null) {
        } else {}
      }
    }
  } on SocketException catch (_) {

   Get.find<DashboardLogic>().updateFormLoaderController(false);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: LanguageConstant.failed.tr,
            titleColor: customDialogErrorColor,
            descriptions: '${LanguageConstant.internetNotConnected.tr}!',
            text: LanguageConstant.ok.tr,
            functionCall: () {
              Navigator.pop(context);
            },
            img: 'assets/Icons/dialog_error.svg',
          );
        });
    Get.find<ApiLogic>().changeInternetCheckerState(false);
  }
}
