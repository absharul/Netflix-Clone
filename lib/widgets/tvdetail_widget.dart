import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlix_clone/Model/tvdetailinfo_model.dart';

import '../Common/utils.dart';
import '../Services/app_services.dart';

class TvdetailWidget extends StatefulWidget {
  final tvshowid;
  const TvdetailWidget({super.key, required this.tvshowid});

  @override
  State<TvdetailWidget> createState() => _TvdetailWidgetState();
}

class _TvdetailWidgetState extends State<TvdetailWidget> {

  ApiServices apiServices = ApiServices();

  late Future<TvShowDetailInfo?> tvdetailfuture;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    tvdetailfuture = apiServices.getDetailTVnfo(widget.tvshowid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.tvshowid);
    return Scaffold(
      backgroundColor: Kbackgroundcolor,
      body: FutureBuilder(
          future: tvdetailfuture,
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
                        child: Text(movieD.name,
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
                          const Text('Popularity',style: TextStyle(color: Colors.grey,),),
                          const SizedBox(width: 10.0,),
                          Text(movieD.popularity,style: const TextStyle(fontSize: 18.0)),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Type',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Flexible(
                          child: Text(
                            movieD.genres.map((genre) => genre.name).join(', '),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                            overflow: TextOverflow.ellipsis, // Truncates the text with "..." if it overflows
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Status',style: TextStyle(color: Colors.grey,),),
                          const SizedBox(width: 10.0,),
                          Text(movieD.status,style: const TextStyle(fontSize: 18.0)),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Country',style: TextStyle(color: Colors.grey,),),
                          const SizedBox(width: 10.0,),
                          Text(movieD.originCountry.join(', '),style: const TextStyle(fontSize: 18.0)),
                        ]
                    ),
                  ),

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
