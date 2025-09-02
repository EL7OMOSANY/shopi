// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCategoryRequest _$UpdateCategoryRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCategoryRequest(
  name: json['name'] as String,
  image: json['image'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$UpdateCategoryRequestToJson(
  UpdateCategoryRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'image': instance.image,
  'id': instance.id,
};
