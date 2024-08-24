import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlix_clone/Common/utils.dart';
import 'package:netlix_clone/Services/app_services.dart';

import '../Model/moviedetailinfo_model.dart';

class MoviedetailScreen extends StatefulWidget {
  final movieId;
  const MoviedetailScreen({super.key, required this.movieId});

  @override
  State<MoviedetailScreen> createState() => _MoviedetailScreenState();
}

class _MoviedetailScreenState extends State<MoviedetailScreen> {

  ApiServices apiServices = ApiServices();

  late Future<MovieDetailInfo?> moviedetailfuture;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    moviedetailfuture = apiServices.getDetailmovieinfo(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body: FutureBuilder(
        future: moviedetailfuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final movieD = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("$imageUrl${movieD!.posterPath}",),
                          ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(.0),
                    child: Center(
                      child: Text(movieD.originalTitle,
                        style: const TextStyle(fontSize: 25.0),
                      ),
                    )),
                const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                   child: Text('Description',style: TextStyle(color: Colors.grey),),
                ),
                Padding(padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text(movieD.overview, style: const TextStyle(
                  fontSize: 14.0,
                ),
                  textAlign: TextAlign.justify,
                )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Popularity',style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                      const SizedBox(width: 10.0,),
                      Text(movieD.popularity,style: const TextStyle(fontSize: 15.0)),
                    ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Type',style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                        const SizedBox(width: 10.0,),
                        Text(movieD.genres.map((genre) => genre.name).join(' , '),style: const TextStyle(fontSize: 15.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Status',style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                        const SizedBox(width: 10.0,),
                        Text(movieD.status,style: const TextStyle(fontSize: 15.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Country',style: TextStyle(color: Colors.grey,fontSize: 15.0),),
                        const SizedBox(width: 10.0,),
                        Text(movieD.originCountry.join(', '),style: const TextStyle(fontSize: 15.0)),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                  child: Text(
                    'More Like This', style: TextStyle(
                     color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                // GridView.builder(
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 5,
                //     mainAxisSpacing: 5,
                //     childAspectRatio: 1.2
                //      ),
                //     itemBuilder: (context, index){
                //
                //     })
              ],
            );
          } else {
            return const SizedBox();
          }
        }
      ),
    );
  }
}
