import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_card.dart';
import '../dashboard_screen/logic.dart';

class FavMovieList extends StatelessWidget {
  const FavMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get.find<DashboardLogic>().favoriteMovies.isEmpty? Center(
      child:  Image.asset("assets/images/noDataFound.png"),
    ) :Expanded(
      child: ListView.builder(
        itemCount:  Get.find<DashboardLogic>().favoriteMovies.length??0,
        itemBuilder: (context, index) {
          final item = Get.find<DashboardLogic>().favoriteMovies[index];
          return CustomCard(movieResults:item ,);
        },
      ),
    );
  }
}
