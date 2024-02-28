// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'position_by_chain.g.dart';

@JsonSerializable()
class PositionByChainEntity implements DTO {
  final double? arbitrum;

  final double? aurora;

  final double? avalanche;

  @JsonKey(name: "binance-smart-chain")
  final double? binanceSmartChain;

  final double? ethereum;

  final double? fantom;

  final double? loopring;

  final double? optimism;

  final double? polygon;

  final double? solana;

  final double? xdai;

  const PositionByChainEntity({
     this.arbitrum,
     this.aurora,
     this.avalanche,
     this.binanceSmartChain,
     this.ethereum,
     this.fantom,
     this.loopring,
     this.optimism,
     this.polygon,
     this.solana,
     this.xdai,
  });

  factory PositionByChainEntity.fromJson(Map<String, dynamic> json) =>
      _$PositionByChainEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PositionByChainEntityToJson(this);
}
