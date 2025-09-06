import 'package:json_annotation/json_annotation.dart';

part 'get_all_users_response.g.dart';

@JsonSerializable()
class GetAllUsersResponse {
  final UsersData data;

  GetAllUsersResponse({required this.data});

  factory GetAllUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllUsersResponseToJson(this);

  //getter for list data
  List<UserModel> get usersList {
    if (data.usersList.isNotEmpty) {
      return data.usersList;
    } else {
      return [];
    }
  }
}

@JsonSerializable()
class UsersData {
  @JsonKey(name: 'users')
  final List<UserModel> usersList;

  UsersData({required this.usersList});

  factory UsersData.fromJson(Map<String, dynamic> json) =>
      _$UsersDataFromJson(json);

  Map<String, dynamic> toJson() => _$UsersDataToJson(this);
}

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
