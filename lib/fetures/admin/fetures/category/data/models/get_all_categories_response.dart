import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

part 'get_all_categories_response.g.dart';

@JsonSerializable()
class GetAllCategoriesResponse {
  final CategoriesData data;

  GetAllCategoriesResponse({required this.data});

  List<CategoryContent> get getAllCategoriesList {
    if (data.categoriesList.isEmpty) {
      log('category list is empty');
      return [];
    }
    log('categories list is not empty');
    return data.categoriesList.reversed.toList();
  }

  List<String> get categoryDropdownList {
    final list = data.categoriesList.map((e) => e.name ?? '').toList();
    return list;
  }

  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCategoriesResponseToJson(this);
}

@JsonSerializable()
class CategoriesData {
  @JsonKey(name: 'categories')
  final List<CategoryContent> categoriesList;

  CategoriesData({required this.categoriesList});

  factory CategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);
}

@JsonSerializable()
class CategoryContent {
  final String? name;
  final String? id;
  final String? image;

  CategoryContent({required this.id, required this.image, required this.name});

  factory CategoryContent.fromJson(Map<String, dynamic> json) =>
      _$CategoryContentFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryContentToJson(this);
}
