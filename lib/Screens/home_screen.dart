import 'package:flutter/material.dart';
import 'package:netlix_clone/Common/utils.dart';
import 'package:netlix_clone/widgets/movie_card_widget.dart';

import '../Model/upcoming_model.dart';
import '../Services/app_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<UpcomingMovieModel> upcomingFuture;
  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kbackgroundcolor,
        appBar: AppBar(
          backgroundColor: Kbackgroundcolor,
          title: Image.asset("assets/main_logo.jpg",
            height: 100,
            width: 150,
          ),
          actions: [
            Padding(padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.search,color: Colors.white,
                size: 30,
              ),
              tooltip: "Search",
            ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                height: 27,
                width: 27,
              ),
            ),
            const SizedBox(width: 20.0)
          ],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 220,
                child: MovieCardWidget
                  (future: upcomingFuture,
                    headlineText: "Upcoming Movies",
                )
            ),
          ],
        ),
      ),
    );
  }
}
