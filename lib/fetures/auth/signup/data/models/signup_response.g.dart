// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      data: ResData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{'data': instance.data};

ResData _$ResDataFromJson(Map<String, dynamic> json) => ResData(
  addUser: AddUserData.fromJson(json['addUser'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResDataToJson(ResData instance) => <String, dynamic>{
  'addUser': instance.addUser,
};

AddUserData _$AddUserDataFromJson(Map<String, dynamic> json) =>
    AddUserData(email: json['email'] as String, id: json['id'] as String);

Map<String, dynamic> _$AddUserDataToJson(AddUserData instance) =>
    <String, dynamic>{'id': instance.id, 'email': instance.email};
