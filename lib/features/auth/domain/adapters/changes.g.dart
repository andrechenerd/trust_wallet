// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChangesAdapter extends TypeAdapter<Changes> {
  @override
  final int typeId = 7;

  @override
  Changes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Changes(
      absoluteId: fields[0] as double?,
      percentId: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Changes obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.absoluteId)
      ..writeByte(1)
      ..write(obj.percentId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
