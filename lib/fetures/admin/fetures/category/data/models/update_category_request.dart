import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_category_request.g.dart';

@JsonSerializable()
class UpdateCategoryRequest {
  UpdateCategoryRequest({
    required this.name,
    required this.image,
    required this.id,
  });

  final String name;
  final String image;
  final String id;

  Map<String, dynamic> toJson() => _$UpdateCategoryRequestToJson(this);

  factory UpdateCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryRequestFromJson(json);
}
