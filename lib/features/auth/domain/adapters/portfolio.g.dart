// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PortfolioAdapter extends TypeAdapter<Portfolio> {
  @override
  final int typeId = 2;

  @override
  Portfolio read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Portfolio(
      type: fields[0] as String,
      id: fields[1] as String,
      attributes: fields[2] as Attributes,
    );
  }

  @override
  void write(BinaryWriter writer, Portfolio obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.attributes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PortfolioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
