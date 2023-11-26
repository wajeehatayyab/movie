import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/modules/home_screen/home_large_mobile.dart';
import 'package:movie/modules/home_screen/home_tablet.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../widgets/responsive_screen.dart';
import '../dashboard_screen/logic.dart';
import 'home_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  OrientationBuilder(builder:   (context, orientation) {
      return
      //   Get.find<DashboardLogic>().formLoaderController==true?
      // SkeletonLoader(
      //     period: const Duration(seconds: 2),
      //     highlightColor: Colors.grey,
      //     direction: SkeletonDirection.ltr,
      //     builder: Column(
      //       // crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //
      //         Container(
      //           width: MediaQuery.of(context).size.width * 0.8,
      //           height: 166,
      //           color: Colors.grey,
      //
      //         ),
      //         const SizedBox(height: 20,),
      //         Container(
      //           width: MediaQuery.of(context).size.width * 0.8,
      //           height: 20,
      //           color: Colors.grey,
      //
      //         ),
      //         const SizedBox(height: 10,),
      //         SizedBox(
      //           width: MediaQuery.of(context).size.width,
      //           height: 100,
      //           child: ListView(
      //             scrollDirection: Axis.vertical,
      //             children: List.generate(
      //               5,
      //                   (index) => Column(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 3),
      //                     child: Container(
      //                       height: 10,
      //                       width: 315,
      //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: Colors.grey),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ))
      //:
      //

             const Responsive(
        mobile:HomeMobile() ,
        mobileLarge:HomeLargeMobile() ,
        tablet:HomeTablet() ,



      );

      },
    );
  }
}
