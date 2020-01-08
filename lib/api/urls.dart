
import 'package:cinema_app/constants/constants.dart';

class Urls {
  static const String base_url = "https://api.themoviedb.org/3/";
  static const String image_base_url = "https://image.tmdb.org/t/p/original";
  static const String trending_movies_url = "${base_url}trending/all/day?api_key=${Constants.API_KEY}";

}