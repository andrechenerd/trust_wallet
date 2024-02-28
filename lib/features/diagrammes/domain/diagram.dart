import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'attributes.dart';

part 'diagram.g.dart';

@JsonSerializable(createFactory: true)
class DiagramEntity implements DTO {
  DiagramAttributesEntity attributes;

  DiagramEntity({
    required this.attributes,
  });

  factory DiagramEntity.fromJson(Map<String, dynamic> json) =>
      _$DiagramEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DiagramEntityToJson(this);
}
