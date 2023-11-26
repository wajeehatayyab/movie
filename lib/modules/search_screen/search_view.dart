import 'package:flutter/material.dart';

import 'package:movie/modules/search_screen/search_widget.dart';
import 'package:movie/widgets/responsive_screen.dart';


class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {


  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder:(context, orientation){
      return const Responsive(mobile:SearchWidget(),
        mobileLarge: SearchWidget(),
        tablet: SearchWidget(),

      );

    }

    );
  }

}

