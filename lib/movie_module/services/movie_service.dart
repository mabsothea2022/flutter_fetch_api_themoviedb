import 'package:flutter/foundation.dart';
import 'package:flutter_fetch_moviewdb/movie_module/models/movie_model.dart';
import 'package:http/http.dart' as http;

const global_api = "5fccb576d21233df785e808470f5998e";

class MovieService {
  static Future<MovieModel> getAPI() async {
    try {
      http.Response responce = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/movie/157336?api_key=$global_api"));
      return compute(movieModelFromMap, responce.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
