// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsEntity _$StatsEntityFromJson(Map<String, dynamic> json) => StatsEntity(
      max: (json['max'] as num).toDouble(),
      min: (json['min'] as num).toDouble(),
      last: (json['last'] as num).toDouble(),
    );

Map<String, dynamic> _$StatsEntityToJson(StatsEntity instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'last': instance.last,
    };
