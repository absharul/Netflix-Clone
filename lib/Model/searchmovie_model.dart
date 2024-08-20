class SearchMovieModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  SearchMovieModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) {
    return SearchMovieModel(
      page: json['page'] ?? 0,
      results: List<Result>.from(json['results']?.map((x) => Result.fromJson(x)) ?? []),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': List<dynamic>.from(results.map((x) => x.toJson())),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}

class Result {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle; // Changed from enum to String
  String overview;
  double popularity;
  String? posterPath;
  String releaseDate;
  String title; // Changed from enum to String
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: json['id'] ?? 0,
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '', // Changed here
      overview: json['overview'] ?? '',
      popularity: json['popularity']?.toDouble() ?? 0.0,
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '', // Changed here
      video: json['video'] ?? false,
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': List<dynamic>.from(genreIds.map((x) => x)),
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle, // Changed here
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title, // Changed here
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
