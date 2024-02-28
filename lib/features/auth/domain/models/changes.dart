// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'changes.g.dart';

@JsonSerializable()
class ChangesEntity implements DTO {
  @JsonKey(name: 'absolute_1d')
  final double absoluteId;

  @JsonKey(name: 'percent_1d')
  final double? percentId;

  const ChangesEntity({
    required this.absoluteId,
    this.percentId,
  });

  factory ChangesEntity.fromJson(Map<String, dynamic> json) =>
      _$ChangesEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ChangesEntityToJson(this);
}
