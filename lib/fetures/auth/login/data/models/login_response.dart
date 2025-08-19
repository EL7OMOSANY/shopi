import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final Data? data;

  LoginResponse({this.data});

  factory LoginResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('JSON is null');
    }
    return _$LoginResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'login')
  final LoginData? loginData;

  Data({this.loginData});

  factory Data.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Data JSON is null');
    }
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class LoginData {
  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  LoginData({this.accessToken, this.refreshToken});

  factory LoginData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('LoginData JSON is null');
    }
    return _$LoginDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
