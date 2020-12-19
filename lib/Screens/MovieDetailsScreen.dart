import 'package:GPmovies/Backend/Favourite.dart';
import 'package:GPmovies/Backend/MovieDetails.dart';

import 'package:GPmovies/Constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsScreen({Key key, @required this.id}) : super(key: key);
  final int id;

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Dio dio = Dio();

  MVdetails movieDetails;
  IconData icons = Icons.favorite_border;
  List<String> list;

  @override
  void initState() {
    super.initState();
    list = Favourites.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          list.add("https://api.themoviedb.org/3/tv/" +
              widget.id.toString() +
              "?api_key=1a97f3b8d5deee1d649c0025f3acf75c");
          Favourites.addFvrt(list);
          setState(() {
            icons = Icons.favorite;
          });
        },
        child: Icon(
          icons,
          color: Colors.white,
          size: ScrnSize.width * .1,
        ),
      ),
      body: FutureBuilder(
        future: dio.get("https://api.themoviedb.org/3/movie/" +
            widget.id.toString() +
            "?api_key=1a97f3b8d5deee1d649c0025f3acf75c"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            movieDetails = mVdetailsFromJson(snapshot.data.toString());
            String imgLink = "https://image.tmdb.org/t/p/original/" +
                    movieDetails.backdropPath ??
                movieDetails.posterPath;
            return Container(
              height: ScrnSize.height,
              width: ScrnSize.width,
              child: Stack(
                children: [
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      child: CachedNetworkImage(
                        imageUrl: imgLink,
                        memCacheWidth: ScrnSize.width.toInt(),
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
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      width: ScrnSize.width,
                      child: Text(snapshot.data.toString()))
                ],
              ),
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
