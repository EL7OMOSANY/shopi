// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersResponse _$GetAllUsersResponseFromJson(Map<String, dynamic> json) =>
    GetAllUsersResponse(
      data: UsersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllUsersResponseToJson(
  GetAllUsersResponse instance,
) => <String, dynamic>{'data': instance.data};

UsersData _$UsersDataFromJson(Map<String, dynamic> json) => UsersData(
  usersList: (json['users'] as List<dynamic>)
      .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UsersDataToJson(UsersData instance) => <String, dynamic>{
  'users': instance.usersList,
};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
};
