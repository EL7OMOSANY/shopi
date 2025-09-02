// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryResponse _$CreateCategoryResponseFromJson(
  Map<String, dynamic> json,
) => CreateCategoryResponse(
  data: CreateData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateCategoryResponseToJson(
  CreateCategoryResponse instance,
) => <String, dynamic>{'data': instance.data};

CreateData _$CreateDataFromJson(Map<String, dynamic> json) => CreateData(
  categoryModel: CategoryModel.fromJson(
    json['addCategory'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CreateDataToJson(CreateData instance) =>
    <String, dynamic>{'addCategory': instance.categoryModel};

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
