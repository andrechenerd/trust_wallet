import 'package:hive/hive.dart';

part 'diagram_model.g.dart';

@HiveType(typeId: 24)
class DiagramModel {
  @HiveField(0)
  double? min;
  @HiveField(1)
  double? max;
  @HiveField(2)
  double? last;
  @HiveField(3)
  List<List<double>>? points;

  DiagramModel({
    required this.max,
    required this.min,
    required this.last,
    required this.points,
  });
}
