import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stats.g.dart';

@JsonSerializable(createFactory: true)
class StatsEntity implements DTO {
  double min;

  double max;

  double last;

  StatsEntity({
    required this.max,
    required this.min,
    required this.last,
  });

  factory StatsEntity.fromJson(Map<String, dynamic> json) =>
      _$StatsEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StatsEntityToJson(this);
}
