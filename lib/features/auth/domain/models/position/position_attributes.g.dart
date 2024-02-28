// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionAttributesEntity _$PositionAttributesEntityFromJson(
        Map<String, dynamic> json) =>
    PositionAttributesEntity(
      positionType: json['position_type'] as String,
      quantity:
          QuantityEntity.fromJson(json['quantity'] as Map<String, dynamic>),
      value: (json['value'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      changes: ChangesEntity.fromJson(json['changes'] as Map<String, dynamic>),
      fungibleInfo: FungibleInfoEntity.fromJson(
          json['fungible_info'] as Map<String, dynamic>),
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PositionAttributesEntityToJson(
        PositionAttributesEntity instance) =>
    <String, dynamic>{
      'position_type': instance.positionType,
      'quantity': instance.quantity,
      'value': instance.value,
      'price': instance.price,
      'changes': instance.changes,
      'fungible_info': instance.fungibleInfo,
      'updated_at': instance.updatedAt,
    };
