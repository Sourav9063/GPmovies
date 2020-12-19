
import 'package:GPmovies/Backend/TrendingData.dart';
import 'package:GPmovies/Constant.dart';
import 'package:flutter/material.dart';

class CardTrending extends StatelessWidget {
  const CardTrending({Key key,@required this.result}) : super(key: key);
  final Result result;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: Container(
        height: ScrnSize.height*.25,
        width: ScrnSize.width,
        child: Stack(children: [
          Image.network("",
          
          )

        ],),
      ),
    );
  }
}