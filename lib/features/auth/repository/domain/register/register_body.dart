// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable(createFactory: false)
class RegisterBody {
  final String data;

  const RegisterBody({
    required this.data,
  });

  Map<String, dynamic> toJson() => _$RegisterBodyToJson(this);
}
