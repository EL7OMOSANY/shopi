import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  SignUpRequest({
    required this.email,
    required this.password,
    required this.name,
  });

  final String name;
  final String email;
  final String password;
  final String avatar =
      "com.example.shopi/cache/eeba4ee0-4061-4da1-af56-a4d399dba2f6/1000407625.png";

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
