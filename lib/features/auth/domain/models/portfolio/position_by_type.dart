// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'position_by_type.g.dart';

@JsonSerializable()
class PositionByTypeEntity implements DTO {
  final double wallet;

  final double deposited;

  final double borrowed;

  final double locked;

  final double staked;

  const PositionByTypeEntity({
    required this.wallet,
    required this.deposited,
    required this.borrowed,
    required this.locked,
    required this.staked,
  });

  factory PositionByTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$PositionByTypeEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PositionByTypeEntityToJson(this);
}
