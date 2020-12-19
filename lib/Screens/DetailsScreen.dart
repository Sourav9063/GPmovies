import 'package:GPmovies/Backend/MovieDetails.dart';

import 'package:GPmovies/Constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsScreen({Key key, @required this.id})
      : super(key: key);
  final int id;

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Dio dio = Dio();

  MVdetails movieDetails;
  // String getLink() {
  //   return widget.movieOrTV == 0
  //       ? "https://api.themoviedb.org/3/movie/" +
  //           widget.id.toString() +
  //           "?api_key=1a97f3b8d5deee1d649c0025f3acf75c"
  //       : "https://api.themoviedb.org/3/tv/" +
  //           widget.id.toString() +
  //           "?api_key=1a97f3b8d5deee1d649c0025f3acf75c";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: dio.get("https://api.themoviedb.org/3/movie/" +
            widget.id.toString() +
            "?api_key=1a97f3b8d5deee1d649c0025f3acf75c"),
        builder: (context, snapshot) {
          movieDetails = mVdetailsFromJson(snapshot.data.toString());

          if (snapshot.hasData) {
            return Stack(
              children: [
                Positioned(
                    child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/original/" +
                          movieDetails.backdropPath ??
                      movieDetails.posterPath,
                ))
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Icon(
                Icons.error,
                size: ScrnSize.width * .20,
                color: Colors.red,
              ),
            );
          } else
            Center(
              child: CircularProgressIndicator(),
            );
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
