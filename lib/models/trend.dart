import 'package:json_annotation/json_annotation.dart';
import "results.dart";
part 'trend.g.dart';

@JsonSerializable()
class Trend {
    Trend();

    num page;
    List<Results> results;
    
    factory Trend.fromJson(Map<String,dynamic> json) => _$TrendFromJson(json);
    Map<String, dynamic> toJson() => _$TrendToJson(this);
}
