import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';


part 'fungible_info.g.dart';

@JsonSerializable(createFactory: true)
class FungibleInfoEntity implements DTO {
  final String name;

  final String symbol;

  const FungibleInfoEntity({
    required this.name,
    required this.symbol,
  });

  factory FungibleInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$FungibleInfoEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FungibleInfoEntityToJson(this);
}
