import 'package:cocuisinage_app_mobile_pro/models/profile.dart';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';

class Globals {
  // static String baseUrl = "https://371b-41-230-15-255.eu.ngrok.io/api";
  // static String baseUrl = "http://15.236.5.125:8008/api";
  static String baseUrl = "http://15.236.5.125:8888/api";

  static late Profile profile;
  static late String token;

  static late Params params = Params();
  static late Config config = Config(roles: [], permissions: []);
}
