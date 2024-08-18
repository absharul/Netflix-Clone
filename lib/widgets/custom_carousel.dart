import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
          return Placeholder();
          },
          options: CarouselOptions(),
      ),

    );
  }
}
