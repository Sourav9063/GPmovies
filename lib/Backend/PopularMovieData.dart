// To parse this JSON data, do
//
//     final popularMoviesData = popularMoviesDataFromJson(jsonString);

import 'dart:convert';

PopularMoviesData popularMoviesDataFromJson(String str) =>
    PopularMoviesData.fromJson(json.decode(str));

String popularMoviesDataToJson(PopularMoviesData data) =>
    json.encode(data.toJson());

class PopularMoviesData {
  PopularMoviesData({
    this.page,
    this.resultsMovies,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<ResultsMovie> resultsMovies;
  int totalPages;
  int totalResults;

  factory PopularMoviesData.fromJson(Map<String, dynamic> json) =>
      PopularMoviesData(
        page: json["page"] == null ? null : json["page"],
        resultsMovies: json["results"] == null
            ? null
            : List<ResultsMovie>.from(
                json["results"].map((x) => ResultsMovie.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": resultsMovies == null
            ? null
            : List<dynamic>.from(resultsMovies.map((x) => x.toJson())),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
      };
}

class ResultsMovie {
  ResultsMovie({
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

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  int voteAverage;
  int voteCount;

  factory ResultsMovie.fromJson(Map<String, dynamic> json) => ResultsMovie(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? null
            : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        releaseDate: json["release_date"] == null ? null : json["release_date"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds.map((x) => x)),
        "id": id == null ? null : id,
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "release_date": releaseDate == null ? null : releaseDate,
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}
