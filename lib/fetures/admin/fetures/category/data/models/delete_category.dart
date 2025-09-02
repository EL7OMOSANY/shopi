import 'package:json_annotation/json_annotation.dart';

part 'delete_category.g.dart';

@JsonSerializable()
class DeleteCategoryRequest {
  final String id;

  DeleteCategoryRequest({required this.id});

  factory DeleteCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCategoryRequestToJson(this);
}
