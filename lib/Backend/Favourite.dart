import 'package:shared_preferences/shared_preferences.dart';

String _linkStringkey = "StringList";

class Favourites {
  static void addFvrt(List<String> fvrt) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await sharedPreferences.setStringList(_linkStringkey, fvrt);
  }

  static Future<List<String>> getList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    return  sharedPreferences.getStringList(_linkStringkey);
  }


}
