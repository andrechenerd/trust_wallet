// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_currency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomCurrencyAdapter extends TypeAdapter<CustomCurrency> {
  @override
  final int typeId = 20;

  @override
  CustomCurrency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomCurrency(
      name: fields[0] as String,
      rate: fields[3] as double,
      symbol: fields[1] as String,
      isChoose: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CustomCurrency obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(3)
      ..write(obj.rate)
      ..writeByte(4)
      ..write(obj.isChoose);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomCurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
