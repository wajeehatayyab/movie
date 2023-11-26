import 'package:flutter/material.dart';
import 'package:movie/modules/home_screen/widget/home_screen_list_view.dart';
import 'package:movie/modules/home_screen/widget/home_screen_slider.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

    return  SizedBox(
      width: size.width *1,
      height: size.height *0.8,

      child:  Column(
        children: [
          DashboardSlider(sliderWidth: size.width*0.9,),
           MovieListWidget(),


        ],
      ),

    );
  }
}
