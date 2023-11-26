import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/modules/dashboard_screen/logic.dart';

import '../../../widgets/custom_card.dart';

class MovieListWidget extends StatelessWidget {
   MovieListWidget({Key? key}) : super(key: key);

   String? starEmoji=  ' \u{2728}  ';
  @override
  Widget build(BuildContext context) {
    final   size= MediaQuery.of(context).size;

    return  Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

           Padding(padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 10),child: Text("Movies $starEmoji",style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),),

          (Get.find<DashboardLogic>().movie.results??[]).isEmpty?SizedBox(height: size.height*0.15,child: Image.asset("assets/images/noDataFound.png"),)
          :Expanded(child: ListView.builder(itemBuilder: (context,index){
            return CustomCard( movieResults: Get.find<DashboardLogic>().movie.results![index],);
          },itemCount:( Get.find<DashboardLogic>().movie.results??[]).isEmpty?0:Get.find<DashboardLogic>().movie.results?.length,))
        ],
      ),
    );
  }
}
