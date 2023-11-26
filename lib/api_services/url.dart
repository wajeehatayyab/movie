import 'package:get/get.dart';

import '../modules/dashboard_screen/logic.dart';

const String baseUrl="https://api.themoviedb.org/3/";
const String apiKey="3320052741eb1bee6a34b7f869524ddd";
String authentication = "${baseUrl}authentication/token/new";
String accountId = "${baseUrl}account";
String movieData = "${baseUrl}account/${Get.find<DashboardLogic>().accountId}/lists";
