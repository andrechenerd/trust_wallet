// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'portfolio/portfolio.dart';
import 'position/position.dart';
import 'transaction/transaction.dart';

part 'user_entity.g.dart';

@JsonSerializable(createFactory: true)
class UserEntity implements DTO {
  final String address;

  final List<TransactionEntity>? transactions;

  final List<PositionEntity?>? positions;

  final Map<String, dynamic>? nft;

  final PortfolioEntity portfolio;

  const UserEntity({
    required this.address,
    this.transactions,
    this.positions,
    this.nft,
    required this.portfolio,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
