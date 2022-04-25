import 'dart:convert';

import 'package:movie_gain/core/constants/api_path.dart';

class MovieListModel {
  MovieListModel({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<ResultMovie>? movies;
  final int? totalPages;
  final int? totalResults;

  factory MovieListModel.fromJson(String str) =>
      MovieListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieListModel.fromMap(Map<String, dynamic> json) => MovieListModel(
        page: json["page"],
        movies:
            List<ResultMovie>.from(json["results"].map((x) => ResultMovie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(movies?.map((x) => x.toMap()) ?? []),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class ResultMovie {
  ResultMovie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final OriginalLanguage? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory ResultMovie.fromJson(String str) => ResultMovie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultMovie.fromMap(Map<String, dynamic>? json) => ResultMovie(
        adult: json?["adult"],
        backdropPath: json?["backdrop_path"],
        genreIds: List<int>.from(json?["genre_ids"]?.map((x) => x)??[]),
        id: json?["id"],
        originalLanguage:
            originalLanguageValues.map?[json?["original_language"]],
        originalTitle: json?["original_title"],
        overview: json?["overview"],
        popularity: json?["popularity"]?.toDouble(),
        posterPath: imagesStoragePath + (json?["poster_path"]).toString(),
        releaseDate: DateTime.parse(json?["release_date"] ?? DateTime.now().toString()),
        title: json?["title"],
        video: json?["video"],
        voteAverage: json?["vote_average"]?.toDouble(),
        voteCount: json?["vote_count"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds?.map((x) => x) ?? []),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum OriginalLanguage { EN, KO, SV, FR }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "ko": OriginalLanguage.KO,
  "sv": OriginalLanguage.SV
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map?.map((k, v) =>  MapEntry(v, k));
    return reverseMap!;
  }
}
