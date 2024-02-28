import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';
import '../changes.dart';
import '../quantity.dart';
import 'fungible_info.dart';

part 'position_attributes.g.dart';

@JsonSerializable(createFactory: true)
class PositionAttributesEntity implements DTO {
  @JsonKey(name: "position_type")
  final String positionType;

  final QuantityEntity quantity;

  final double value;

  final double price;

  final ChangesEntity changes;

  @JsonKey(name: "fungible_info")
  final FungibleInfoEntity fungibleInfo;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  const PositionAttributesEntity({
    required this.positionType,
    required this.quantity,
    required this.value,
    required this.price,
    required this.changes,
    required this.fungibleInfo,
    required this.updatedAt,
  });

  factory PositionAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$PositionAttributesEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PositionAttributesEntityToJson(this);
}
