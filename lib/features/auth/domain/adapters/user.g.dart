// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      address: fields[0] as String,
      transactions: (fields[1] as List?)?.cast<Transaction>(),
      nft: (fields[3] as List?)?.cast<String>(),
      portfolio: fields[4] as Portfolio,
      currencies: (fields[2] as List).cast<CustomCurrency>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.transactions)
      ..writeByte(2)
      ..write(obj.currencies)
      ..writeByte(3)
      ..write(obj.nft)
      ..writeByte(4)
      ..write(obj.portfolio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
