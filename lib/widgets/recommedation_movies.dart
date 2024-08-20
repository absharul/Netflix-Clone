import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:netlix_clone/Model/movierecommendation_model.dart';

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
                               child: Row(
                                 children: [
                                 //  Container(
                                 //    height: 170,
                                 //    width:  110,
                                 //   decoration: BoxDecoration(
                                 //       borderRadius: BorderRadius.circular(0),
                                 //       image: ,
                                 //       border: Border.all(
                                 //         color: const Color(0xffffffff),
                                 //         width: 2.0,
                                 //         style: BorderStyle.solid,
                                 //         strokeAlign: BorderSide.strokeAlignCenter,
                                 //       )
                                 //   ),
                                 //   child: Image.network(
                                 //     '$imageUrl${data[index].posterPath}',
                                 //     fit: BoxFit.fitHeight,
                                 //   ),
                                 // ),
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
