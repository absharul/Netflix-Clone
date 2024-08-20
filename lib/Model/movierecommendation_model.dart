import 'dart:convert';

// MovieRecommendationModel class to parse the JSON response
class MovieRecommendationModel {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieRecommendationModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  // Factory constructor to create an instance of MovieRecommendationModel from JSON
  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) {
    return MovieRecommendationModel(
      page: json['page'],
      results: (json['results'] as List).map((i) => Movie.fromJson(i)).toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  // Method to convert MovieRecommendationModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((movie) => movie.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

// Movie class to parse each movie in the results array
class Movie {
  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  // Factory constructor to create an instance of Movie from JSON
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids']),
      popularity: json['popularity'].toDouble(),
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  // Method to convert Movie to JSON
  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
