import 'dart:io';

import 'package:GPmovies/Constant.dart';
import 'package:flutter/material.dart';

import 'Screens/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPmovie',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff141A32),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NetConnection(),
    );
  }
}

class NetConnection extends StatelessWidget {
  const NetConnection({Key key}) : super(key: key);
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    ScrnSize.media = MediaQuery.of(context);
    ScrnSize.height = MediaQuery.of(context).size.height;
    ScrnSize.width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: checkConnection(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return MyHomePage();
        }

        return NoInterNet();
      },
    );
  }
}

class NoInterNet extends StatelessWidget {
  const NoInterNet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: ScrnSize.width * .25,
            ),
            Text(
              "No Internet!",
              textScaleFactor: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Try again"),
            ),
            IconButton(
                icon: Icon(
                  Icons.refresh,
                  size: ScrnSize.width * .10,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => NetConnection()));
                })
          ],
        ),
      ),
    );
  }
}
