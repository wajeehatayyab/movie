import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/api_services/get_service.dart';
import 'package:movie/modules/dashboard_screen/logic.dart';
import 'package:movie/modules/dashboard_screen/repo.dart';

import '../../api_services/url.dart';
import '../fav_screen/fav_view.dart';
import '../home_screen/home_screen.dart';
import '../search_screen/search_view.dart';





class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(DashboardLogic());
    callApi();

  }
  Future callApi()async{
    getMethod(context, authentication, {"api_key":apiKey}, true, getSessionKey);



  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.find<DashboardLogic>().appBarTitle(currentPageIndex),style:  TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.purple.shade400,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon:  Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon:  Icon(Icons.favorite),

            label: 'Favorite',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const HomeScreen(),

        /// Notifications page
        const SearchView(),
        /// Messages page
        FavView()
      ][currentPageIndex],
    );
  }
}
