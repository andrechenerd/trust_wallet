// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionEntity _$TransactionEntityFromJson(Map<String, dynamic> json) =>
    TransactionEntity(
      id: json['id'] as String,
      attributes: TransactionAttributesEntity.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionEntityToJson(TransactionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };
