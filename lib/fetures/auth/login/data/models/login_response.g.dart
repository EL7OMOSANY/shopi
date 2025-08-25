// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  loginData: json['login'] == null
      ? null
      : LoginData.fromJson(json['login'] as Map<String, dynamic>?),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'login': instance.loginData,
};

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
  accessToken: json['access_token'] as String?,
  refreshToken: json['refresh_token'] as String?,
);

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
};
