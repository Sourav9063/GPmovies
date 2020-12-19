import 'package:shared_preferences/shared_preferences.dart';

String key = "StringList";

class Favourites {
  static void addFvrt(List<String> fvrt) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(key, fvrt);
  }

  static getList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(key);
  }
}
