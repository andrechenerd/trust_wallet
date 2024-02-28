import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'stats.dart';

part 'attributes.g.dart';

@JsonSerializable(createFactory: true)
class DiagramAttributesEntity implements DTO {
  List<List<double>> points;

  StatsEntity stats;
  DiagramAttributesEntity({
    required this.points,
    required this.stats,
  });

  factory DiagramAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$DiagramAttributesEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DiagramAttributesEntityToJson(this);
}
