// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributesEntity _$AttributesEntityFromJson(Map<String, dynamic> json) =>
    AttributesEntity(
      positionByType: PositionByTypeEntity.fromJson(
          json['positions_distribution_by_type'] as Map<String, dynamic>),
      positionByChain: json['positions_distribution_by_chain'] == null
          ? null
          : PositionByChainEntity.fromJson(
              json['positions_distribution_by_chain'] as Map<String, dynamic>),
      total: TotalEntity.fromJson(json['total'] as Map<String, dynamic>),
      changes: ChangesEntity.fromJson(json['changes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttributesEntityToJson(AttributesEntity instance) =>
    <String, dynamic>{
      'positions_distribution_by_type': instance.positionByType,
      'positions_distribution_by_chain': instance.positionByChain,
      'total': instance.total,
      'changes': instance.changes,
    };
