import 'package:GPmovies/Backend/PopularMovieData.dart';
import 'package:GPmovies/Backend/PopularTVData.dart';
import 'package:GPmovies/Backend/TrendingData.dart';
import 'package:GPmovies/CompoundWidget/CardDesign.dart';
import 'package:GPmovies/Constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Dio dio = Dio();
  TrendingData trendingData;
  PopularMoviesData popularMoviesData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Popular Movies",
              textScaleFactor: 1.6,
            ),
            Container(
              height: ScrnSize.height * .27,
              width: ScrnSize.width,
              child: FutureBuilder(
                  future: dio.get(kPopularMoviesHttp),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot.data.toString());
                      popularMoviesData =
                          popularMoviesDataFromJson(snapshot.data.toString());
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: popularMoviesData.resultsMovies.length,
                        itemBuilder: (context, index) {
                          return CardPopularMovie(
                              result: popularMoviesData.resultsMovies[index]);
                        },
                      );
                    } else if (snapshot.hasError) {}
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
            Text(
              "Popular TV Series",
              textScaleFactor: 1.6,
            ),
            Container(
              height: ScrnSize.height * .27,
              width: ScrnSize.width,
              child: FutureBuilder(
                  future: dio.get(kPopularTVHttp),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      PopularTvData tvData =
                          popularTvDataFromJson(snapshot.data.toString());
                      // print(tvData.resultsTv[2].name);
                      print(snapshot.data.toString());
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: tvData.resultsTv.length,
                        itemBuilder: (context, index) {
                          return CardPopularTV(result: tvData.resultsTv[index]);
                        },
                      );
                    } else if (snapshot.hasError) {}
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
            Text(
              "Trending",
              textScaleFactor: 1.6,
            ),
            Container(
              height: ScrnSize.height * .31,
              width: ScrnSize.width,
              child: FutureBuilder(
                  future: dio.get(kTrendingHttp),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      trendingData =
                          trendingDataFromJson(snapshot.data.toString());
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: trendingData.results.length,
                        itemBuilder: (context, index) {
                          return CardTrending(
                              result: trendingData.results[index]);
                        },
                      );
                    } else if (snapshot.hasError) {}
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

//  FutureBuilder(
//         future: dio.get(kTrendingHttp),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             trendingData = trendingDataFromJson(snapshot.data.toString());
//             return ListView.builder(
//               itemCount: trendingData.results.length,
//               itemBuilder: (context, index) {
//                 return CardTrending(result: trendingData.results[index]);
//               },
//             );
//           } else if (snapshot.hasError) {}
//           return Center(child: CircularProgressIndicator());
//         }),
