import 'package:flutter/material.dart';

class TVdetailsScreen extends StatefulWidget {
  TVdetailsScreen({Key key, @required this.id}) : super(key: key);
  final int id;
  @override
  _TVdetailsScreenState createState() => _TVdetailsScreenState();
}

class _TVdetailsScreenState extends State<TVdetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("TV"),
      ),
    );
  }
}
