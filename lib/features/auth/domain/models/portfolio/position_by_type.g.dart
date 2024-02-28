// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_by_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionByTypeEntity _$PositionByTypeEntityFromJson(
        Map<String, dynamic> json) =>
    PositionByTypeEntity(
      wallet: (json['wallet'] as num).toDouble(),
      deposited: (json['deposited'] as num).toDouble(),
      borrowed: (json['borrowed'] as num).toDouble(),
      locked: (json['locked'] as num).toDouble(),
      staked: (json['staked'] as num).toDouble(),
    );

Map<String, dynamic> _$PositionByTypeEntityToJson(
        PositionByTypeEntity instance) =>
    <String, dynamic>{
      'wallet': instance.wallet,
      'deposited': instance.deposited,
      'borrowed': instance.borrowed,
      'locked': instance.locked,
      'staked': instance.staked,
    };
