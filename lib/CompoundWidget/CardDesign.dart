import 'dart:ui';

import 'package:GPmovies/Backend/PopularMovieData.dart';
import 'package:GPmovies/Backend/PopularTVData.dart';

import 'package:GPmovies/Backend/TrendingData.dart';
import 'package:GPmovies/Backend/UsableData.dart';
import 'package:GPmovies/Constant.dart';
import 'package:GPmovies/Screens/MovieDetailsScreen.dart';
import 'package:GPmovies/Screens/TVdetailsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardTrending extends StatelessWidget {
  const CardTrending({Key key, @required this.result}) : super(key: key);
  final Result result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => result.mediaType.index == 0
                  ? MovieDetailsScreen(id: result.id)
                  : TVdetailsScreen(id: result.id),
            ),
          );
        },
        child: Container(
          height: ScrnSize.height * .25,
          width: ScrnSize.width,
          child: Stack(
            children: [
              Positioned(
                top: ScrnSize.height * .05,
                left: 0,
                height: ScrnSize.height * .20,
                width: ScrnSize.width,
                child: Container(
                  color: Color(0xff1E2747),
                ),
              ),
              Positioned(
                  right: 0,
                  width: ScrnSize.width * .5,
                  bottom: 0,
                  height: ScrnSize.height * .20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            result.title ??
                                result.name ??
                                result.originalName ??
                                result.originalTitle ??
                                "Not found",
                            overflow: TextOverflow.fade,
                            textScaleFactor: 1.2,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: RatingBarIndicator(
                                  itemSize: ScrnSize.width * .05,
                                  itemCount: 5,
                                  rating: result.voteAverage / 2,
                                  itemBuilder: (context, index) {
                                    return Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                result.voteAverage.toString(),
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScrnSize.width * .041),
                              )
                            ],
                          ),
                        ),
                        Text(result.mediaType.index == 0
                            ? "Movie"
                            : "TV Series"),
                        Text(result.releaseDate != null
                            ? UsableData.datetimeToString(result.releaseDate)
                            : result.firstAirDate != null
                                ? UsableData.datetimeToString(
                                    result.firstAirDate)
                                : "Not Available")
                      ],
                    ),
                  )),
              Positioned(
                top: 0,
                left: ScrnSize.width * .08,
                height: ScrnSize.height * .23,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/original/" +
                        result.posterPath,
                    fit: BoxFit.cover,
                    // memCacheHeight: 1200,
                    memCacheWidth: 300,
                    errorWidget: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: ScrnSize.width * .2,
                        ),
                      );
                    },
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Align(
                      alignment: Alignment(-.01, .1),
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardPopularMovie extends StatelessWidget {
  const CardPopularMovie({Key key, @required this.result}) : super(key: key);
  final ResultsMovie result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => MovieDetailsScreen(id: result.id)),
          );
        },
        child: Container(
          height: ScrnSize.height * .25,
          width: ScrnSize.width * .7,
          child: Stack(
            children: [
              Positioned(
                top: ScrnSize.height * .025,
                left: 0,
                height: ScrnSize.height * .20,
                width: ScrnSize.width,
                child: Container(
                  color: Color(0xffFE0747),
                ),
              ),
              Positioned(
                  right: 0,
                  width: ScrnSize.width * .38,
                  top: ScrnSize.height * .025,
                  height: ScrnSize.height * .20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            result.title ?? result.originalTitle ?? "Not found",
                            overflow: TextOverflow.fade,
                            textScaleFactor: 1.2,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: RatingBarIndicator(
                                  itemSize: ScrnSize.width * .05,
                                  itemCount: 5,
                                  rating: result.voteAverage / 2,
                                  itemBuilder: (context, index) {
                                    return Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                result.voteAverage.toString(),
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScrnSize.width * .041),
                              )
                            ],
                          ),
                        ),
                        Text(result.releaseDate != null
                            ? result.releaseDate
                            : "Not Available")
                      ],
                    ),
                  )),
              Positioned(
                top: 0,
                left: ScrnSize.width * .0,
                height: ScrnSize.height * .25,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: CachedNetworkImage(
                    imageUrl: "https://image.tmdb.org/t/p/original/" +
                            result.posterPath ??
                        result.backdropPath,
                    fit: BoxFit.cover,
                    // memCacheHeight: 1200,
                    memCacheWidth: 300,
                    errorWidget: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: ScrnSize.width * .2,
                        ),
                      );
                    },
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Align(
                      alignment: Alignment(-.01, .1),
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardPopularTV extends StatelessWidget {
  const CardPopularTV({Key key, @required this.result}) : super(key: key);
  final ResultsTv result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: ScrnSize.height * .25,
        width: ScrnSize.height * .25,
        decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: NetworkImage(
          //   "https://image.tmdb.org/t/p/original/" + result.posterPath ??
          //       result.backdropPath,

          // ))
          color: Color(0xff000C18),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(result.name ?? result.originalName ?? "Not Found"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: RatingBarIndicator(
                      itemSize: ScrnSize.width * .05,
                      itemCount: 5,
                      rating: result.voteAverage / 2,
                      itemBuilder: (context, index) {
                        return Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    result.voteAverage.toString(),
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: ScrnSize.width * .041),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
