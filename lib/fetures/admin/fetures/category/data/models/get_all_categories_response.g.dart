// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponse _$GetAllCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => GetAllCategoriesResponse(
  data: CategoriesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllCategoriesResponseToJson(
  GetAllCategoriesResponse instance,
) => <String, dynamic>{'data': instance.data};

CategoriesData _$CategoriesDataFromJson(Map<String, dynamic> json) =>
    CategoriesData(
      categoriesList: (json['categories'] as List<dynamic>)
          .map((e) => CategoryContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesDataToJson(CategoriesData instance) =>
    <String, dynamic>{'categories': instance.categoriesList};

CategoryContent _$CategoryContentFromJson(Map<String, dynamic> json) =>
    CategoryContent(
      id: json['id'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryContentToJson(CategoryContent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
    };
