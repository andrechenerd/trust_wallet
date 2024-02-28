
import 'package:hive/hive.dart';

import '../../auth/domain/adapters/changes.dart';
import '../../diagrammes/domain/model/diagram_model.dart';

part 'crypt.g.dart';

@HiveType(typeId: 17)
class Crypt {
  @HiveField(0)
  final String iconName;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String shortName;
  @HiveField(3)
  double amount;
  @HiveField(4)
  double amountInCurrency;
  @HiveField(5)
  double priceForOne;
  @HiveField(6)
  bool isChoose;
  @HiveField(7)
  Changes changesCrypt;
  @HiveField(8)
  String tokenAddress;
  @HiveField(9)
  final List<String> swapCrypts;
  @HiveField(10)
  final String walletUrl;
  @HiveField(11)
  final int swapId;
  @HiveField(12)
  String swapTokenAddress;
  @HiveField(13)
  bool isFavorite;
  @HiveField(14)
  DiagramModel? diagramModel;

  Crypt({
    this.amount = 0,
    this.amountInCurrency = 0,
    this.priceForOne = 0,
    required this.changesCrypt,
    required this.iconName,
    required this.name,
    required this.shortName,
    this.isChoose = false,
    required this.tokenAddress,
    required this.swapCrypts,
    required this.walletUrl,
    required this.swapId,
    required this.swapTokenAddress,
    this.isFavorite = false,
    required this.diagramModel,
  });
}
