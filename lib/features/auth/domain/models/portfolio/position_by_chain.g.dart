// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_by_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionByChainEntity _$PositionByChainEntityFromJson(
        Map<String, dynamic> json) =>
    PositionByChainEntity(
      arbitrum: (json['arbitrum'] as num?)?.toDouble(),
      aurora: (json['aurora'] as num?)?.toDouble(),
      avalanche: (json['avalanche'] as num?)?.toDouble(),
      binanceSmartChain: (json['binance-smart-chain'] as num?)?.toDouble(),
      ethereum: (json['ethereum'] as num?)?.toDouble(),
      fantom: (json['fantom'] as num?)?.toDouble(),
      loopring: (json['loopring'] as num?)?.toDouble(),
      optimism: (json['optimism'] as num?)?.toDouble(),
      polygon: (json['polygon'] as num?)?.toDouble(),
      solana: (json['solana'] as num?)?.toDouble(),
      xdai: (json['xdai'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PositionByChainEntityToJson(
        PositionByChainEntity instance) =>
    <String, dynamic>{
      'arbitrum': instance.arbitrum,
      'aurora': instance.aurora,
      'avalanche': instance.avalanche,
      'binance-smart-chain': instance.binanceSmartChain,
      'ethereum': instance.ethereum,
      'fantom': instance.fantom,
      'loopring': instance.loopring,
      'optimism': instance.optimism,
      'polygon': instance.polygon,
      'solana': instance.solana,
      'xdai': instance.xdai,
    };
