// To parse this JSON data, do
//
//     final popularTvData = popularTvDataFromJson(jsonString);

import 'dart:convert';

PopularTvData popularTvDataFromJson(String str) => PopularTvData.fromJson(json.decode(str));

String popularTvDataToJson(PopularTvData data) => json.encode(data.toJson());

class PopularTvData {
    PopularTvData({
        this.page,
        this.resultsTv,
        this.totalPages,
        this.totalResults,
    });

    int page;
    List<ResultsTv> resultsTv;
    int totalPages;
    int totalResults;

    factory PopularTvData.fromJson(Map<String, dynamic> json) => PopularTvData(
        page: json["page"] == null ? null : json["page"],
        resultsTv: json["results"] == null ? null : List<ResultsTv>.from(json["results"].map((x) => ResultsTv.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults: json["total_results"] == null ? null : json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": resultsTv == null ? null : List<dynamic>.from(resultsTv.map((x) => x.toJson())),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
    };
}

class ResultsTv {
    ResultsTv({
        this.backdropPath,
        // this.firstAirDate,
        this.genreIds,
        this.id,
        this.name,
        this.originCountry,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.voteAverage,
        this.voteCount,
    });

    String backdropPath;
    // DateTime firstAirDate;
    List<int> genreIds;
    int id;
    String name;
    List<OriginCountry> originCountry;
    OriginalLanguage originalLanguage;
    String originalName;
    String overview;
    double popularity;
    String posterPath;
    double voteAverage;
    int voteCount;

    factory ResultsTv.fromJson(Map<String, dynamic> json) => ResultsTv(
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        // firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null ? null : List<OriginCountry>.from(json["origin_country"].map((x) => originCountryValues.map[x])),
        originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
        originalName: json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        // "first_air_date": firstAirDate == null ? null : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds.map((x) => x)),
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => originCountryValues.reverse[x])),
        "original_language": originalLanguage == null ? null : originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName == null ? null : originalName,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
    };
}

enum OriginCountry { US, ES, JP, MX }

final originCountryValues = EnumValues({
    "ES": OriginCountry.ES,
    "JP": OriginCountry.JP,
    "MX": OriginCountry.MX,
    "US": OriginCountry.US
});

enum OriginalLanguage { EN, ES, JA }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "es": OriginalLanguage.ES,
    "ja": OriginalLanguage.JA
});

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
