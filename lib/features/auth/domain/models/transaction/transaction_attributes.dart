// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'transfer.dart';

part 'transaction_attributes.g.dart';

@JsonSerializable(createFactory: true)
class TransactionAttributesEntity implements DTO {
  @JsonKey(name: "operation_type")
  final String operationType;
  @JsonKey(name: "mined_at")
  final String minedAt;

  @JsonKey(name: "sent_from")
  final String sendFrom;

  @JsonKey(name: "sent_to")
  final String sendTo;

  final String status;

  final List<TransferEntity> transfers;
  const TransactionAttributesEntity({
    required this.operationType,
    required this.minedAt,
    required this.sendFrom,
    required this.sendTo,
    required this.status,
    required this.transfers,
  });

  factory TransactionAttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$TransactionAttributesEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TransactionAttributesEntityToJson(this);
}
