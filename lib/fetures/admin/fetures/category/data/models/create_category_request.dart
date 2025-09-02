import 'package:json_annotation/json_annotation.dart';

part 'create_category_request.g.dart';

@JsonSerializable()
class CreateCategoryRequest {
  final String? name;
  final String? image;

  CreateCategoryRequest({required this.name, required this.image});

  Map<String, dynamic> toJson() => _$CreateCategoryRequestToJson(this);

  factory CreateCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryRequestFromJson(json);
}
