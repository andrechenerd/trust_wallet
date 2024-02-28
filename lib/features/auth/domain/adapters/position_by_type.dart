import 'package:hive/hive.dart';

part 'position_by_type.g.dart';

@HiveType(typeId: 5)
class PositionByType {
  @HiveField(0)
  double wallet;

  @HiveField(1)
  double deposited;

  @HiveField(2)
  double borrowed;

  @HiveField(3)
  double locked;

  @HiveField(4)
  double staked;

  PositionByType({
    required this.wallet,
    required this.deposited,
    required this.borrowed,
    required this.locked,
    required this.staked,
  });
}
