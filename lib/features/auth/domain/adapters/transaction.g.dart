// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 10;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      cryptSymbol: fields[7] as String?,
      minedAt: fields[1] as String,
      operationType: fields[0] as String,
      price: fields[6] as double,
      sentFrom: fields[3] as String,
      sentTo: fields[4] as String,
      status: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.operationType)
      ..writeByte(1)
      ..write(obj.minedAt)
      ..writeByte(3)
      ..write(obj.sentFrom)
      ..writeByte(4)
      ..write(obj.sentTo)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.cryptSymbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
