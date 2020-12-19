// To parse this JSON data, do
//
//     final trendingData = trendingDataFromJson(jsonString);

import 'dart:convert';

TrendingData trendingDataFromJson(String str) =>
    TrendingData.fromJson(json.decode(str));

String trendingDataToJson(TrendingData data) => json.encode(data.toJson());

class TrendingData {
  TrendingData({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory TrendingData.fromJson(Map<String, dynamic> json) => TrendingData(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.video,
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.voteCount,
    this.adult,
    this.backdropPath,
    this.title,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.popularity,
    this.mediaType,
    this.originalName,
    this.originCountry,
    this.firstAirDate,
    this.name,
  });

  bool video;
  double voteAverage;
  String overview;
  DateTime releaseDate;
  int voteCount;
  bool adult;
  String backdropPath;
  String title;
  List<int> genreIds;
  int id;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String posterPath;
  double popularity;
  MediaType mediaType;
  String originalName;
  List<String> originCountry;
  DateTime firstAirDate;
  String name;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        voteCount: json["vote_count"],
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"],
        title: json["title"] == null ? null : json["title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        posterPath: json["poster_path"],
        popularity: json["popularity"].toDouble(),
        mediaType: mediaTypeValues.map[json["media_type"]],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "video": video == null ? null : video,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "vote_count": voteCount,
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath,
        "title": title == null ? null : title,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "poster_path": posterPath,
        "popularity": popularity,
        "media_type": mediaTypeValues.reverse[mediaType],
        "original_name": originalName == null ? null : originalName,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry.map((x) => x)),
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "name": name == null ? null : name,
      };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, JA }

final originalLanguageValues =
    EnumValues({"en": OriginalLanguage.EN, "ja": OriginalLanguage.JA});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
