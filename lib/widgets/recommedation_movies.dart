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
                                  Container(
                                    height: 150,
                                    width:  100,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20)),
                                   child: Image.network(
                                     '$imageUrl${data[index].posterPath}',
                                     fit: BoxFit.fitHeight,
                                   ),
                                 ),
                                  SizedBox(width: 10.0,),
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
