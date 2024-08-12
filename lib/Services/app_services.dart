
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:netlix_clone/Common/utils.dart';
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
}