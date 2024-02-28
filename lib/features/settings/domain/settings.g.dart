// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 18;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Settings(
      isAutoLock: fields[3] as bool?,
      mnemonicSentence: fields[0] as String?,
      privateKey: fields[1] as String?,
      userPassCode: fields[2] as String?,
      autoLockDuration: fields[4] as int?,
      isLightTheme: fields[5] as bool,
      confirmTransaction: fields[6] as bool,
      isTouchId: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.mnemonicSentence)
      ..writeByte(1)
      ..write(obj.privateKey)
      ..writeByte(2)
      ..write(obj.userPassCode)
      ..writeByte(3)
      ..write(obj.isAutoLock)
      ..writeByte(4)
      ..write(obj.autoLockDuration)
      ..writeByte(5)
      ..write(obj.isLightTheme)
      ..writeByte(6)
      ..write(obj.confirmTransaction)
      ..writeByte(7)
      ..write(obj.isTouchId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
