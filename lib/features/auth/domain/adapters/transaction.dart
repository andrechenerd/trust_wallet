import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 10)
class Transaction {
  @HiveField(0)
  String operationType;

  @HiveField(1)
  String minedAt;

  @HiveField(3)
  String sentFrom;

  @HiveField(4)
  String sentTo;

  @HiveField(5)
  String status;

  @HiveField(6)
  double price;

  @HiveField(7)
  String? cryptSymbol;

  Transaction({
    required this.cryptSymbol,
    required this.minedAt,
    required this.operationType,
    required this.price,
    required this.sentFrom,
    required this.sentTo,
    required this.status,
  });
}
