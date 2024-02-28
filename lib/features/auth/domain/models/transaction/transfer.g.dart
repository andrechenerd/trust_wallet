// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferEntity _$TransferEntityFromJson(Map<String, dynamic> json) =>
    TransferEntity(
      fungibleInfo: json['fungible_info'] == null
          ? null
          : FungibleInfoEntity.fromJson(
              json['fungible_info'] as Map<String, dynamic>),
      quantity:
          QuantityEntity.fromJson(json['quantity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransferEntityToJson(TransferEntity instance) =>
    <String, dynamic>{
      'fungible_info': instance.fungibleInfo,
      'quantity': instance.quantity,
    };
