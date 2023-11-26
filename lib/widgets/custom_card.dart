import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie/modules/dashboard_screen/logic.dart';


import '../modules/dashboard_screen/model/movie_model.dart';

class CustomCard extends StatefulWidget {
   const CustomCard({Key? key, required this.movieResults}) : super(key: key);

   final Results movieResults;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

    final box = GetStorage();
    void addItemToFavList(int itemId) {
      Results? movieToAdd = Get.find<DashboardLogic>().movie.results?.firstWhere((item) => item.id == itemId,);
      if (movieToAdd != null) {
        Get.find<DashboardLogic>().favoriteMovies.add(movieToAdd);
        saveFavoriteListToStorage();
      }
    }

    void removeItemFromFavList(int itemId) {

      Get.find<DashboardLogic>().favoriteMovies.removeWhere((item) => item.id == itemId);
      saveFavoriteListToStorage();
      removeFromStorage(itemId);
    }

    void saveFavoriteListToStorage() {
      final box = GetStorage();
      box.write('secondList', Get.find<DashboardLogic>().favoriteMovies.toList());
    }

    void removeFromStorage(int itemId) {
      final box = GetStorage();
      final List<Map<String, dynamic>>? storedList = box.read<List<Map<String, dynamic>>>('secondList');

      if (storedList != null) {

        storedList.removeWhere((map) => map['id'] == itemId);

        box.write('secondList', storedList);
      }
    }


   @override
  Widget build(BuildContext context) {
    final   size= MediaQuery.of(context).size;

    return Card(
      elevation: 3,shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),

    ),
      child: Container(

       height: size.height*0.15,
        width: size.width*0.9,
        decoration: BoxDecoration(color:Colors.white, borderRadius: BorderRadius.circular(17)),
        child: Row(
          children: [
            Container(
              height: size.height*0.14, decoration: BoxDecoration(image:widget.movieResults.posterURL==null ? const DecorationImage(
        image: AssetImage("assets/images/noDataFound.png",), // Use the first movie's poster
          fit: BoxFit.contain,
        ):DecorationImage(fit: BoxFit.cover,image: NetworkImage(widget.movieResults.posterURL!)), borderRadius: BorderRadius.circular(17)),
           width:size.width*0.3,
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(

                        child: Card(

                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child:   Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(widget.movieResults.isFavorite ? Icons.favorite : Icons.favorite_border,size: 20,),
                        ),),onTap: () async {
                        widget.movieResults.isFavorite = !widget.movieResults.isFavorite;
                        if(widget.movieResults.isFavorite==true){
                          setState(() {
                            addItemToFavList(widget.movieResults.id!);
                          });
                        }else{
                          setState(() {
                         removeItemFromFavList(widget.movieResults.id!);

                          });
                        }




                      },),
                    ],
                  ),







                  Expanded(
                    child: Text(
                      widget.movieResults.title??"N/A",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color:Colors.black,  overflow: TextOverflow.ellipsis,fontSize: 12),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.movieResults.overview??"N/A",
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle( color:Colors.black,  overflow: TextOverflow.ellipsis,fontSize: 12),
                    ),
                  ) ,   Expanded(
                    child: Text(
                      widget.movieResults.releaseDate??"N/A",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color:Colors.black,  overflow: TextOverflow.ellipsis,fontSize: 12),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );

  }
}
