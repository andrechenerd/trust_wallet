import 'package:hive/hive.dart';

import 'attributes.dart';

part 'portfolio.g.dart';

@HiveType(typeId: 2)
class Portfolio {
  @HiveField(0)
  String type;

  @HiveField(1)
  String id;

  @HiveField(2)
  Attributes attributes;

  Portfolio({
    required this.type,
    required this.id,
    required this.attributes,
  });
}
