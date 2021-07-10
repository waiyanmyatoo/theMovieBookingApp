import 'package:shared_preferences/shared_preferences.dart';

const String DEF_ACCESS_TOKEN = "ACCESS_TOKEN";

class SharedPreferenceUtils {
  static final SharedPreferenceUtils _singleton =
      SharedPreferenceUtils._internal();

  factory SharedPreferenceUtils() {
    return _singleton;
  }

  SharedPreferenceUtils._internal();

  /// save access token
  Future saveAccessToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(DEF_ACCESS_TOKEN, token);
  }

  /// get access token
  Future getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(DEF_ACCESS_TOKEN);
  }

  /// clear access token
  Future clearAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
