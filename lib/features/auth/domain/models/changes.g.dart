// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangesEntity _$ChangesEntityFromJson(Map<String, dynamic> json) =>
    ChangesEntity(
      absoluteId: (json['absolute_1d'] as num).toDouble(),
      percentId: (json['percent_1d'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ChangesEntityToJson(ChangesEntity instance) =>
    <String, dynamic>{
      'absolute_1d': instance.absoluteId,
      'percent_1d': instance.percentId,
    };
