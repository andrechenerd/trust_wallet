import 'package:hive/hive.dart';

import 'changes.dart';
import 'position_by_chain.dart';
import 'position_by_type.dart';
import 'total.dart';

part 'attributes.g.dart';

@HiveType(typeId: 3)
class Attributes {
  @HiveField(0)
  PositionByType positionsDistributionByType;

  @HiveField(1)
  PositionByChain positionsDistributionByChain;

  @HiveField(2)
  Total total;

  @HiveField(3)
  Changes changes;

  Attributes({
    required this.positionsDistributionByType,
    required this.positionsDistributionByChain,
    required this.total,
    required this.changes,
  });
}
