import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {

  static String moviedb=dotenv.env["THE_MOVIEDB_KEY"] ?? "no hay api key";
  static String movieToken=dotenv.env["THE_MOVIEDB_TOKEN"] ?? "no hay Token key";
}
