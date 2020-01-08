import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
    Results();

    num id;
    bool video;
    num vote_count;
    num vote_average;
    String name;
    String title;
    String release_date;
    String original_language;
    String original_title;
    String backdrop_path;
    bool adult;
    String overview;
    String poster_path;
    num popularity;
    String media_type;
    
    factory Results.fromJson(Map<String,dynamic> json) => _$ResultsFromJson(json);
    Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
