// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trend _$TrendFromJson(Map<String, dynamic> json) {
  return Trend()
    ..page = json['page'] as num
    ..results = (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Results.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TrendToJson(Trend instance) =>
    <String, dynamic>{'page': instance.page, 'results': instance.results};
