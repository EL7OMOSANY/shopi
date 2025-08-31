import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

part 'category_nums_response.g.dart';

@JsonSerializable()
class CategoryNumsResponse {
  final CategoryData data;

  CategoryNumsResponse({required this.data});

  String get categoryNumbers {
    if (data.categoryList.isEmpty) {
      log('category list is empty');
      return '0';
    }
    log('category list is not empty');
    return data.categoryList.length.toString();
  }

  factory CategoryNumsResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryNumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryNumsResponseToJson(this);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: 'categories')
  final List<CategoryInfo> categoryList;

  CategoryData({required this.categoryList});

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}

@JsonSerializable()
class CategoryInfo {
  final String? name;

  CategoryInfo({required this.name});

  factory CategoryInfo.fromJson(Map<String, dynamic> json) =>
      _$CategoryInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryInfoToJson(this);
}
