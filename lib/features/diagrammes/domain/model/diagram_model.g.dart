// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagram_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiagramModelAdapter extends TypeAdapter<DiagramModel> {
  @override
  final int typeId = 24;

  @override
  DiagramModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiagramModel(
      max: fields[1] as double?,
      min: fields[0] as double?,
      last: fields[2] as double?,
      points: (fields[3] as List?)
          ?.map((dynamic e) => (e as List).cast<double>())
          ?.toList(),
    );
  }

  @override
  void write(BinaryWriter writer, DiagramModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.min)
      ..writeByte(1)
      ..write(obj.max)
      ..writeByte(2)
      ..write(obj.last)
      ..writeByte(3)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiagramModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
