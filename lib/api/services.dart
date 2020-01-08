import 'dart:convert';
import 'package:cinema_app/api/urls.dart';
import 'package:http/http.dart' as http;
import 'package:cinema_app/models/results.dart';
import 'package:cinema_app/models/trend.dart';

class Services {
  static Future<Trend> getTrendingMovies() async {
    try {
      final response = await http.get(Urls.trending_movies_url);
      if (isResponceOk(response)) {
        return parseTrendingMovies(response.body);
      }
      return Trend();
    } catch (e) {
      return Trend();
    } 
  } 

  static Trend parseTrendingMovies(String responseBody) {
    final parsed =
        json.decode(responseBody)["results"].cast<Map<String, dynamic>>();
    List<Results> movies =
        parsed.map<Results>((json) => Results.fromJson(json)).toList();
    Trend t = Trend();
    t.results = movies;
    return t;
  }

  static bool isResponceOk(http.Response response) {
    if (200 != response.statusCode) {
      return false;
    }
    return true;
  }
}