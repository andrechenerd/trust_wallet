// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'empty.g.dart';

@JsonSerializable()
class EmptyEntity implements DTO {
  const EmptyEntity();

  factory EmptyEntity.fromJson(Map<String, dynamic> json) =>
      _$EmptyEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EmptyEntityToJson(this);
}
