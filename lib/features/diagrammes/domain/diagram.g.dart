// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagram.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiagramEntity _$DiagramEntityFromJson(Map<String, dynamic> json) =>
    DiagramEntity(
      attributes: DiagramAttributesEntity.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiagramEntityToJson(DiagramEntity instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
    };
