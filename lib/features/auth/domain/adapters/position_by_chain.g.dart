// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_by_chain.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PositionByChainAdapter extends TypeAdapter<PositionByChain> {
  @override
  final int typeId = 4;

  @override
  PositionByChain read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PositionByChain(
      crypts: (fields[0] as List).cast<Crypt>(),
    );
  }

  @override
  void write(BinaryWriter writer, PositionByChain obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.crypts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PositionByChainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
