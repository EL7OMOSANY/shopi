// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_nums_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersNumsResponse _$UsersNumsResponseFromJson(Map<String, dynamic> json) =>
    UsersNumsResponse(
      data: UsersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersNumsResponseToJson(UsersNumsResponse instance) =>
    <String, dynamic>{'data': instance.data};

UsersData _$UsersDataFromJson(Map<String, dynamic> json) => UsersData(
  usersList: (json['users'] as List<dynamic>)
      .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UsersDataToJson(UsersData instance) => <String, dynamic>{
  'users': instance.usersList,
};

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) =>
    UserInfo(name: json['name'] as String?);

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'name': instance.name,
};
