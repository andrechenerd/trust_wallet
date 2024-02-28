import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'position_attributes.dart';

part 'position.g.dart';

@JsonSerializable(createFactory: true)
class PositionEntity implements DTO {
  final String type;

  final PositionAttributesEntity attributes;

  const PositionEntity({
    required this.type,
    required this.attributes,
  });

  factory PositionEntity.fromJson(Map<String, dynamic> json) =>
      _$PositionEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PositionEntityToJson(this);
}
