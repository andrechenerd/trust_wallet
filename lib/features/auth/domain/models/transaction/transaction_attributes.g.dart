// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionAttributesEntity _$TransactionAttributesEntityFromJson(
        Map<String, dynamic> json) =>
    TransactionAttributesEntity(
      operationType: json['operation_type'] as String,
      minedAt: json['mined_at'] as String,
      sendFrom: json['sent_from'] as String,
      sendTo: json['sent_to'] as String,
      status: json['status'] as String,
      transfers: (json['transfers'] as List<dynamic>)
          .map((e) => TransferEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionAttributesEntityToJson(
        TransactionAttributesEntity instance) =>
    <String, dynamic>{
      'operation_type': instance.operationType,
      'mined_at': instance.minedAt,
      'sent_from': instance.sendFrom,
      'sent_to': instance.sendTo,
      'status': instance.status,
      'transfers': instance.transfers,
    };
