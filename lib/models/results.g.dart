// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results()
    ..id = json['id'] as num
    ..video = json['video'] as bool
    ..vote_count = json['vote_count'] as num
    ..vote_average = json['vote_average'] as num
    ..name = json['name'] as String
    ..title = json['title'] as String
    ..release_date = json['release_date'] as String
    ..original_language = json['original_language'] as String
    ..original_title = json['original_title'] as String
    ..backdrop_path = json['backdrop_path'] as String
    ..adult = json['adult'] as bool
    ..overview = json['overview'] as String
    ..poster_path = json['poster_path'] as String
    ..popularity = json['popularity'] as num
    ..media_type = json['media_type'] as String;
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'video': instance.video,
      'vote_count': instance.vote_count,
      'vote_average': instance.vote_average,
      'name': instance.name,
      'title': instance.title,
      'release_date': instance.release_date,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'backdrop_path': instance.backdrop_path,
      'adult': instance.adult,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'popularity': instance.popularity,
      'media_type': instance.media_type
    };
