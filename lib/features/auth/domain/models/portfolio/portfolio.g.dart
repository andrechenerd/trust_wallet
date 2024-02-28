// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioEntity _$PortfolioEntityFromJson(Map<String, dynamic> json) =>
    PortfolioEntity(
      type: json['type'] as String,
      id: json['id'] as String,
      attributes:
          AttributesEntity.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PortfolioEntityToJson(PortfolioEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'attributes': instance.attributes,
    };
