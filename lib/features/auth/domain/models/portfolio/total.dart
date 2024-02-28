// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'total.g.dart';

@JsonSerializable()
class TotalEntity implements DTO {
  final double positions;

  const TotalEntity({
    required this.positions,
  });

  factory TotalEntity.fromJson(Map<String, dynamic> json) =>
      _$TotalEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TotalEntityToJson(this);
}
