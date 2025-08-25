import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final ResData data;

  SignupResponse({required this.data});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class ResData {
  final AddUserData addUser;

  ResData({required this.addUser});

  factory ResData.fromJson(Map<String, dynamic> json) =>
      _$ResDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResDataToJson(this);
}

@JsonSerializable()
class AddUserData {
  final String id;
  final String email;

  AddUserData({required this.email, required this.id});

  factory AddUserData.fromJson(Map<String, dynamic> json) =>
      _$AddUserDataFromJson(json);
  Map<String, dynamic> toJson() => _$AddUserDataToJson(this);
}
