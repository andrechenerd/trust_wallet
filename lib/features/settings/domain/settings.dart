import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 18)
class Settings {
  @HiveField(0)
  String? mnemonicSentence;

  @HiveField(1)
  String? privateKey;

  @HiveField(2)
  String? userPassCode;

  @HiveField(3)
  bool? isAutoLock;

  @HiveField(4)
  int? autoLockDuration;

  @HiveField(5)
  bool isLightTheme;

  @HiveField(6)
  bool confirmTransaction;

  @HiveField(7)
  bool isTouchId;

  Settings({
    this.isAutoLock = false,
    this.mnemonicSentence,
    this.privateKey,
    this.userPassCode,
    this.autoLockDuration = 30,
    this.isLightTheme = true,
    this.confirmTransaction = true,
    this.isTouchId = false,
  });
}
