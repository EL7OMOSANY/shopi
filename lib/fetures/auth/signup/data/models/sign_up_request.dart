import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  SignUpRequest({
    required this.email,
    required this.password,
    required this.avatar,
    required this.name,
  });

  final String name;
  final String email;
  final String password;
  final String avatar;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
