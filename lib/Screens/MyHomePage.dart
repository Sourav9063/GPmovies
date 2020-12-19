import 'package:GPmovies/Backend/TrendingData.dart';
import 'package:GPmovies/Constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: dio.get(kTrendingHttp),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              trendingData = trendingDataFromJson(snapshot.data.toString());
              return ListView.builder(
                itemCount: trendingData.results.length,
                itemBuilder: (context, index) {
                  return Text(trendingData.results[index].title ??
                      trendingData.results[index].name ??
                      trendingData.results[index].originalName ??
                      "Not avilable");
                },
              );
            } else if (snapshot.hasError) {}
            return CircularProgressIndicator();
          }),
    );
  }
}
