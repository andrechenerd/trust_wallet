// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_by_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PositionByTypeAdapter extends TypeAdapter<PositionByType> {
  @override
  final int typeId = 5;

  @override
  PositionByType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PositionByType(
      wallet: fields[0] as double,
      deposited: fields[1] as double,
      borrowed: fields[2] as double,
      locked: fields[3] as double,
      staked: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PositionByType obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.wallet)
      ..writeByte(1)
      ..write(obj.deposited)
      ..writeByte(2)
      ..write(obj.borrowed)
      ..writeByte(3)
      ..write(obj.locked)
      ..writeByte(4)
      ..write(obj.staked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PositionByTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
