import 'package:json_annotation/json_annotation.dart';

part 'users_nums_response.g.dart';

@JsonSerializable()
class UsersNumsResponse {
  final UsersData data;

  UsersNumsResponse({required this.data});

  String get usersNumbers {
    if (data.usersList.isEmpty) {
      return '0';
    }
    return data.usersList.length.toString();
  }

  factory UsersNumsResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersNumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersNumsResponseToJson(this);
}

@JsonSerializable()
class UsersData {
  @JsonKey(name: 'users')
  final List<UserInfo> usersList;

  UsersData({required this.usersList});

  factory UsersData.fromJson(Map<String, dynamic> json) =>
      _$UsersDataFromJson(json);

  Map<String, dynamic> toJson() => _$UsersDataToJson(this);
}

@JsonSerializable()
class UserInfo {
  final String? name;

  UserInfo({required this.name});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
