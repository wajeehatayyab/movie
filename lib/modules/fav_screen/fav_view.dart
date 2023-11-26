import 'package:flutter/material.dart';

import '../../widgets/responsive_screen.dart';

import 'fav_movie_list.dart';

class FavView extends StatelessWidget {
  const FavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder:(context, orientation){
      return const Responsive(mobile:FavMovieList(),
        mobileLarge: FavMovieList(),
        tablet: FavMovieList(),

      );

    }

    );

  }
}
