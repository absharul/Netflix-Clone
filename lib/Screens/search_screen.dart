import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlix_clone/Common/utils.dart';
import 'package:netlix_clone/Model/searchmovie_model.dart';
import 'package:netlix_clone/Services/app_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchControlller = TextEditingController();
  ApiServices apiServices = ApiServices();

  SearchMovieModel? searchMovieModel;

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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: SearchBar(
                   controller: searchControlller,
                   leading: const Icon(Icons.search, color: Colors.white,),
                   backgroundColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.3)),
                   trailing: [
                     if(searchControlller.text.isEmpty)
                     IconButton(
                         onPressed: () {
                           searchControlller.clear();
                           setState(() {
                           });
                         }, icon: const Icon(Icons.cancel,color: Colors.white)),
                   ],
                   textStyle: WidgetStateProperty.all(const TextStyle(
                     color: Colors.white,
                     fontSize: 20.0
                   )),
                   onChanged: (value){
                     if(value.isEmpty){
                     }else{
                       Search(searchControlller.text);
                     }
                   },
                 ),
               ),
               searchMovieModel == null || searchMovieModel?.results.isEmpty == true
                   ? const SizedBox.shrink()
               :GridView.builder(
                   shrinkWrap: true,
                   itemCount: searchMovieModel!.results.length,
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   mainAxisSpacing: 15,
                   crossAxisSpacing: 5,
                   childAspectRatio: 1.2/2),
                   itemBuilder: (context, index){
                     final movie = searchMovieModel!.results[index];
                    return Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "$imageUrl${movie.backdropPath}",
                          height: 170,
                          placeholder: (context, url) => const SizedBox(
                            height: 20, // Set height here
                            width: 20,  // Set width here
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0, // Adjust the thickness if needed
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ],
                    );
                   }),
             ],
            ),
        )
      ),
    );
  }
}
