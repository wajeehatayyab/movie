import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_card.dart';
import '../dashboard_screen/logic.dart';
import '../dashboard_screen/model/movie_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}
List<Results> searchResults = [];
class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
          child: TextField(
            onChanged: (query) {
              updateSearchResults(query);
            },
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w400,fontSize: 12),
              labelStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),

              labelText: 'Search',
              hintText: 'Enter Movie Name...',
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 3, ), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),

              ), focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 3, ), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),

              ), border: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 3, ), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),

              ),
            ),

          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final item = searchResults[index];
              return CustomCard(movieResults:item ,);
            },
          ),
        ),
      ],
    );
  }
  void updateSearchResults(String query) {
    setState(() {
      searchResults = Get.find<DashboardLogic>().movie.results
      !.where((item) => item.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
