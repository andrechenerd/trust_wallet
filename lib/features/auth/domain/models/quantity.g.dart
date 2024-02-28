// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantityEntity _$QuantityEntityFromJson(Map<String, dynamic> json) =>
    QuantityEntity(
      int: json['int'] as String?,
      decimals: (json['decimals'] as num?)?.toDouble(),
      float: (json['float'] as num).toDouble(),
      numeric: json['numeric'] as String,
    );

Map<String, dynamic> _$QuantityEntityToJson(QuantityEntity instance) =>
    <String, dynamic>{
      'int': instance.int,
      'decimals': instance.decimals,
      'float': instance.float,
      'numeric': instance.numeric,
    };
