// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionEntity _$PositionEntityFromJson(Map<String, dynamic> json) =>
    PositionEntity(
      type: json['type'] as String,
      attributes: PositionAttributesEntity.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PositionEntityToJson(PositionEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'attributes': instance.attributes,
    };
