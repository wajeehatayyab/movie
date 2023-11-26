import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/modules/dashboard_screen/logic.dart';
import 'package:movie/modules/home_screen/widget/home_screen_list_view.dart';
import 'package:movie/modules/home_screen/widget/home_screen_slider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
   final size= MediaQuery.of(context).size;

    return  SingleChildScrollView(
      child: SizedBox(
        width: size.width *1,
        height: size.height *0.8,

      child:  Column(
          children: [
            DashboardSlider(sliderWidth: size.width*0.9,list: Get.find<DashboardLogic>().movie.results,),
             MovieListWidget(),
          ],
        ),

      ),
    );
  }
}
