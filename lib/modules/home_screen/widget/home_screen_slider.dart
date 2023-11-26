
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../dashboard_screen/model/movie_model.dart';

class DashboardSlider extends StatefulWidget {
  const DashboardSlider({Key? key, required this.sliderWidth,  this.list}) : super(key: key);
  final double sliderWidth;
  final List<Results>?  list;

  @override
  State<DashboardSlider> createState() => _DashboardSliderState();
}
int _currentPageIndex = 0;
class _DashboardSliderState extends State<DashboardSlider> {
  @override
  Widget build(BuildContext context) {
    final   size= MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),

      width: widget.sliderWidth,
      height:size.height*0.22,

      child:CarouselSlider.builder(itemCount:( widget.list??[]).isEmpty?1:widget.list?.length, itemBuilder: (BuildContext context, int index, int realIndex) {



        return  Card(
          elevation: 3,shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),

        ),

          child: SizedBox(
            height: size.height*0.20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: _currentPageIndex == index ?  size.height*0.18: size.height*0.14,
                    width: widget.sliderWidth,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(28),
                        image: (widget.list??[]).isEmpty
                            ? const DecorationImage(
                          image: AssetImage("assets/images/noDataFound.png",), // Use the first movie's poster
                          fit: BoxFit.fitHeight,
                        )
                            : DecorationImage(
                          image:NetworkImage(widget.list![index].posterURL!), // Use a placeholder image
                          fit: BoxFit.cover,
                        ),


                        ),

                ),




              ],
            ),
          ),
        );
      }, options: CarouselOptions(

        // autoPlay: true,

        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentPageIndex = index;

          });
        },
      ),

      ),

    );
  }
}
