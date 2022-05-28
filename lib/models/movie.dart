// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

import 'package:lab3/localdb/DBHelper.dart';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results?.map((x) => x.toJson()) ?? []),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {

  Result({
    //this.id,
    this.overview,
    this.posterPath,
    this.title,
  });
  //String? id;
  String? overview;
  String? posterPath;
  String? title;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
   // id: json["id"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "overview": overview,
    "poster_path": posterPath,
    "title": title,
  };

  Map<String, dynamic> toMap(){
    return {
      //DBHelper.COLUMN_ID:id,
      DBHelper.COLUMN_TITLE:title,
      DBHelper.COLUMN_POSTER:posterPath,
      DBHelper.COLUMN_OVERVIEW:overview,
    };
  }
}

enum OriginalLanguage { EN, FR, ES }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "fr": OriginalLanguage.FR
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap={};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
