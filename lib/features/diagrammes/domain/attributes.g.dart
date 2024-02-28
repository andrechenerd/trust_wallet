// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiagramAttributesEntity _$DiagramAttributesEntityFromJson(
        Map<String, dynamic> json) =>
    DiagramAttributesEntity(
      points: (json['points'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      stats: StatsEntity.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiagramAttributesEntityToJson(
        DiagramAttributesEntity instance) =>
    <String, dynamic>{
      'points': instance.points,
      'stats': instance.stats,
    };
