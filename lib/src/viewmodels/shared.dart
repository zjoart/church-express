import 'package:shared_preferences/shared_preferences.dart';

class Shared{
  Future<bool> setmode (bool authmode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("_authmode", authmode);
  return authmode;
}

Future<bool> getmode () async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool authmode = prefs.getBool("_authmode");
  return authmode;
}
}