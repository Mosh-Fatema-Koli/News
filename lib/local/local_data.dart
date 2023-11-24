import 'package:shared_preferences/shared_preferences.dart';

class MyPrefarance{

   static SharedPreferences? preferences;

  static setThemeData(bool value)async{
    preferences=await SharedPreferences.getInstance();

    preferences!.setBool(Constence.themeStatus, value);

  }

  static Future<bool> getTheme()async{
    preferences=await SharedPreferences.getInstance();
    return preferences!.getBool(Constence.themeStatus)??false;
  }



}

class Constence{

static String themeStatus="ThemeStatus";


}