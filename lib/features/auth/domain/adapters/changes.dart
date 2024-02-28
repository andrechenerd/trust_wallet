import 'package:hive/hive.dart';

part 'changes.g.dart';

@HiveType(typeId: 7)
class Changes {
  @HiveField(0)
  double? absoluteId;

  @HiveField(1)
  double? percentId;
  Changes({
    this.absoluteId = 0,
    this.percentId = 0,
  });
}
