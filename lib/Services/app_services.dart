
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:netlix_clone/Common/utils.dart';
import 'package:netlix_clone/Model/topratedtvseries_model.dart';
import '../Model/upcoming_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key ="?api_key=$apiKey";
late String endPoint;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    try {
      endPoint = "movie/upcoming";
      final url = "$baseUrl$endPoint$key";
      debugPrint(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("Success");

        return UpcomingMovieModel.fromJson(jsonDecode(response.body));

      } else {
        throw Exception("Failed to load upcoming movies: ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
      rethrow;
    }
  }

  Future<UpcomingMovieModel> getNowPlaying() async {
    try {
      endPoint = "movie/now_playing";
      final url = "$baseUrl$endPoint$key";
      debugPrint(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("Success");

        return UpcomingMovieModel.fromJson(jsonDecode(response.body));

      } else {
        throw Exception("Failed to load Now Playing movies: ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
      rethrow;
    }
  }

  Future<TopRatedTvSeries> getTopRatedTvSeries() async {
    try {
      endPoint = "tv/top_rated";
      final url = "$baseUrl$endPoint$key";
      debugPrint(url);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint("Success");

        return TopRatedTvSeries.fromJson(jsonDecode(response.body));

      } else {
        throw Exception("Failed to load TV Series: ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Error occurred: $e");
      rethrow;
    }
  }
}