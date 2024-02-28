// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttributesAdapter extends TypeAdapter<Attributes> {
  @override
  final int typeId = 3;

  @override
  Attributes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attributes(
      positionsDistributionByType: fields[0] as PositionByType,
      positionsDistributionByChain: fields[1] as PositionByChain,
      total: fields[2] as Total,
      changes: fields[3] as Changes,
    );
  }

  @override
  void write(BinaryWriter writer, Attributes obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.positionsDistributionByType)
      ..writeByte(1)
      ..write(obj.positionsDistributionByChain)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.changes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
