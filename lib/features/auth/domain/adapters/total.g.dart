// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TotalAdapter extends TypeAdapter<Total> {
  @override
  final int typeId = 6;

  @override
  Total read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Total(
      positions: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Total obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.positions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
