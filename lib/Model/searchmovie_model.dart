import 'dart:convert';

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

  SearchMovieModel copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      SearchMovieModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory SearchMovieModel.fromRawJson(String str) => SearchMovieModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) => SearchMovieModel(
    page: json["page"] ?? 0,
    results: List<Result>.from(json["results"]?.map((x) => Result.fromJson(x)) ?? []),
    totalPages: json["total_pages"] ?? 0,
    totalResults: json["total_results"] ?? 0,
  );


  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  OriginalTitle originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String releaseDate;
  Title title;
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

  Result copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    OriginalTitle? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    Title? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      Result(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"] ?? false,
    backdropPath: json["backdrop_path"] ?? '',
    genreIds: List<int>.from(json["genre_ids"] ?? []),
    id: json["id"] ?? 0,
    originalLanguage: json["original_language"] ?? '',
    originalTitle: originalTitleValues.map[json["original_title"]] ?? OriginalTitle.ANIMAL,
    overview: json["overview"] ?? '',
    popularity: json["popularity"]?.toDouble() ?? 0.0,
    posterPath: json["poster_path"] ?? '',
    releaseDate: json["release_date"] ?? '',
    title: titleValues.map[json["title"]] ?? Title.ANIMAL,
    video: json["video"] ?? false,
    voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
    voteCount: json["vote_count"] ?? 0,
  );


  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitleValues.reverse[originalTitle],
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": releaseDate,
    "title": titleValues.reverse[title],
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum OriginalTitle {
  ANIMAL,
  LE_RGNE_ANIMAL
}

final originalTitleValues = EnumValues({
  "Animal": OriginalTitle.ANIMAL,
  "Le Règne animal": OriginalTitle.LE_RGNE_ANIMAL
});

enum Title {
  ANIMAL,
  THE_ANIMAL_KINGDOM
}

final titleValues = EnumValues({
  "Animal": Title.ANIMAL,
  "The Animal Kingdom": Title.THE_ANIMAL_KINGDOM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
