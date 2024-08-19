import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:netlix_clone/Common/utils.dart';
import 'package:netlix_clone/Model/topratedtvseries_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  final TopRatedTvSeries data;
  const CustomCarouselSlider({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
          itemCount: data.results.length,
          itemBuilder: (BuildContext context, int index, int RealIndex){
           var url = data.results[index].backdropPath.toString();

           return GestureDetector(
             child:
             Column(
               children: [
                 CachedNetworkImage(imageUrl: "$imageUrl$url",),
                 const SizedBox(height: 20,),
                 Text(data.results[index].name,
                   style: const TextStyle(
                   fontSize: 20
                 ),)
               ]
             )
           );
          },
          options: CarouselOptions(
            height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
            aspectRatio: 16 / 9,
            reverse: false,
            autoPlay: true,
            initialPage: 0,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enlargeCenterPage: true,
          ),
      ),

    );
  }
}
