import 'package:get/get.dart';


class ApiLogic extends GetxController {



  ///-------------------------------internet-check
  bool internetChecker = true;
  changeInternetCheckerState(bool value){
    internetChecker = value;
    update();
  }

}