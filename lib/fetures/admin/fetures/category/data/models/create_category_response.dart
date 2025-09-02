import 'package:json_annotation/json_annotation.dart';
part 'create_category_response.g.dart';

@JsonSerializable()
class CreateCategoryResponse {
  final CreateData data;

  CreateCategoryResponse({required this.data});

  Map<String, dynamic> toJson() => _$CreateCategoryResponseToJson(this);
  // from json
  factory CreateCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryResponseFromJson(json);
}

@JsonSerializable()
class CreateData {
  @JsonKey(name: 'addCategory')
  final CategoryModel categoryModel;

  CreateData({required this.categoryModel});

  Map<String, dynamic> toJson() => _$CreateDataToJson(this);

  factory CreateData.fromJson(Map<String, dynamic> json) =>
      _$CreateDataFromJson(json);
}

@JsonSerializable()
class CategoryModel {
  final String? id;
  final String? name;
  final String? image;

  CategoryModel({required this.id, required this.name, required this.image});

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
