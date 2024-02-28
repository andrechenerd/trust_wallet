// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quantity.g.dart';

@JsonSerializable()
class QuantityEntity implements DTO {
  final String? int;

  final double? decimals;
  final double float;

  final String numeric;

  const QuantityEntity({
    this.int,
    this.decimals,
    required this.float,
    required this.numeric,
  });

  factory QuantityEntity.fromJson(Map<String, dynamic> json) =>
      _$QuantityEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$QuantityEntityToJson(this);
}
