// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../position/fungible_info.dart';
import '../quantity.dart';

part 'transfer.g.dart';

@JsonSerializable(createFactory: true)
class TransferEntity implements DTO {
  @JsonKey(name: "fungible_info")
  final FungibleInfoEntity? fungibleInfo;

  final QuantityEntity quantity;
  const TransferEntity({
    required this.fungibleInfo,
    required this.quantity,
  });

  factory TransferEntity.fromJson(Map<String, dynamic> json) =>
      _$TransferEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TransferEntityToJson(this);
}
