import 'package:hive/hive.dart';

import '../../../crypt/domain/crypt.dart';

part 'position_by_chain.g.dart';

@HiveType(typeId: 4)
class PositionByChain {
  @HiveField(0)
  List<Crypt> crypts;
  // @HiveField(0)
  // Crypt arbitrum;

  // @HiveField(1)
  // Crypt aurora;

  // @HiveField(2)
  // Crypt avalanche;

  // @HiveField(3)
  // Crypt binanceSmartChain;

  // @HiveField(4)
  // int ethereum;

  // @HiveField(5)
  // Crypt fantom;

  // @HiveField(6)
  // Crypt loopring;

  // @HiveField(7)
  // int optimism;

  // @HiveField(8)
  // int polygon;

  // @HiveField(9)
  // int solana;

  // @HiveField(10)
  // int xdai;

  PositionByChain({
    required this.crypts,
    // required this.arbitrum,
    // required this.aurora,
    // required this.avalanche,
    // required this.binanceSmartChain,
    // required this.ethereum,
    // required this.fantom,
    // required this.loopring,
    // required this.optimism,
    // required this.polygon,
    // required this.solana,
    // required this.xdai,
  });
}
