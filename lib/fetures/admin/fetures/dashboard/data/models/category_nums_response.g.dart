// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_nums_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryNumsResponse _$CategoryNumsResponseFromJson(
  Map<String, dynamic> json,
) => CategoryNumsResponse(
  data: CategoryData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryNumsResponseToJson(
  CategoryNumsResponse instance,
) => <String, dynamic>{'data': instance.data};

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
  categoryList: (json['categories'] as List<dynamic>)
      .map((e) => CategoryInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{'categories': instance.categoryList};

CategoryInfo _$CategoryInfoFromJson(Map<String, dynamic> json) =>
    CategoryInfo(name: json['name'] as String?);

Map<String, dynamic> _$CategoryInfoToJson(CategoryInfo instance) =>
    <String, dynamic>{'name': instance.name};
