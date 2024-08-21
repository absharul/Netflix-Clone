import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlix_clone/Model/movierecommendation_model.dart';
import 'package:netlix_clone/widgets/moviedetail_screen.dart';

import '../Common/utils.dart';

class RecommedationMovies extends StatelessWidget {

  final Future<MovieRecommendationModel> Moviesfuture;
  const RecommedationMovies({
    super.key,
    required this.Moviesfuture
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieRecommendationModel>(
        future: Moviesfuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                         ListView.builder(
                           shrinkWrap: true,
                           padding: const EdgeInsets.all(3),
                           physics: const NeverScrollableScrollPhysics(),
                           itemCount: data!.length,
                           itemBuilder: (context, index) {
                             return Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: InkWell(
                                 onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => MoviedetailScreen(movieId: data[index].id)));
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 10.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       CachedNetworkImage(
                                         imageUrl: "$imageUrl${data[index].posterPath}",
                                         imageBuilder: (context, imageProvider) => Container(
                                           height: 170,
                                           width: 110,
                                           decoration: BoxDecoration(
                                             borderRadius: const BorderRadius.all(Radius.circular(10),),
                                             image: DecorationImage(
                                               image: imageProvider,
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                         ),
                                       ),
                                      const SizedBox(width: 10.0,),
                                      Text(snapshot.data!.results[index].originalTitle)
                                     ]
                                   ),
                                 ),
                               ),
                             );
                           },
                         ),
                  ]
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
