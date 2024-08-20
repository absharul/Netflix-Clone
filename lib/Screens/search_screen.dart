import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:netlix_clone/Common/utils.dart';
import 'package:netlix_clone/Model/movierecommendation_model.dart';
import 'package:netlix_clone/Model/searchmovie_model.dart';
import 'package:netlix_clone/Services/app_services.dart';
import 'package:netlix_clone/widgets/recommedation_movies.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchControlller = TextEditingController();
  ApiServices apiServices = ApiServices();
  late Future<MovieRecommendationModel> moviesfuture;

  SearchMovieModel? searchMovieModel;

  @override
  void initState() {
    // TODO: implement initState
    moviesfuture = apiServices.getRecommedationMovies();
    super.initState();
  }

  void Search(String query){
    apiServices.searchMovies(query).then((results){
      setState(() {
        searchMovieModel = results;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Kbackgroundcolor,
        body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: SearchBar(
                     controller: searchControlller,
                     leading: const Icon(Icons.search, color: Colors.white),
                     backgroundColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.3)),
                     trailing: [
                       if (searchControlller.text.isNotEmpty)
                         IconButton(
                           onPressed: () {
                             searchControlller.clear();
                             setState(() {}); // Trigger a rebuild to hide the cancel button
                           },
                           icon: const Icon(Icons.cancel, color: Colors.white),
                         ),
                     ],
                     textStyle: WidgetStateProperty.all(const TextStyle(
                       color: Colors.white,
                       fontSize: 20.0,
                     )),
                     onChanged: (value) {
                       if (value.isNotEmpty) {
                         Search(searchControlller.text);
                       }
                     },
                   ),
                 ),
                 searchControlller.text.isEmpty ?
                 RecommedationMovies(Moviesfuture: moviesfuture)
                 : searchMovieModel == null || searchMovieModel?.results.isEmpty == true
                     ? const SizedBox.shrink()
                 :GridView.builder(
                     physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: searchMovieModel!.results.length,
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                       crossAxisSpacing: 5,
                       mainAxisSpacing: 5,
                       childAspectRatio: 1.2
                     ),
                     itemBuilder: (context, index){
                       final movie = searchMovieModel!.results[index];
                       return Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          searchMovieModel!.results[index].backdropPath == null ?
                              Image.asset("assets/netflix_logo.jpg",)
                          :   CachedNetworkImage(
                              imageUrl: "$imageUrl${movie.backdropPath}",
                              imageBuilder: (context, imageProvider) => Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10),),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ) ,
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                          const SizedBox(height: 5.0,),
                          SizedBox(
                            width: 100,
                            child: Text(
                              movie.originalTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                          )
                        ],
                      );
                     }),
                  ],
              ),
          ),
      ),
    );
  }
}
