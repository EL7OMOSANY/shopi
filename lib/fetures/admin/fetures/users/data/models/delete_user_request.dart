import 'package:json_annotation/json_annotation.dart';

part 'delete_user_request.g.dart';

@JsonSerializable()
class DeleteUserRequest {
  final String id;

  DeleteUserRequest({required this.id});

  factory DeleteUserRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserRequestToJson(this);
}
