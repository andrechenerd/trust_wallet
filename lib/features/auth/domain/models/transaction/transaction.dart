// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'transaction_attributes.dart';

part 'transaction.g.dart';

@JsonSerializable(createFactory: true)
class TransactionEntity implements DTO {
  final String id;

  final TransactionAttributesEntity attributes;

  const TransactionEntity({
    required this.id,
    required this.attributes,
  });

  factory TransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$TransactionEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TransactionEntityToJson(this);
}
