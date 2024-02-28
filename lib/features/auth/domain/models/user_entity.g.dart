// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      address: json['address'] as String,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TransactionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      positions: (json['positions'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PositionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      nft: json['nft'] as Map<String, dynamic>?,
      portfolio:
          PortfolioEntity.fromJson(json['portfolio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'address': instance.address,
      'transactions': instance.transactions,
      'positions': instance.positions,
      'nft': instance.nft,
      'portfolio': instance.portfolio,
    };
