// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRequest _$CreateProductRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductRequest(
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  description: json['description'] as String,
  categoryId: (json['categoryId'] as num).toDouble(),
);

Map<String, dynamic> _$CreateProductRequestToJson(
  CreateProductRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'price': instance.price,
  'images': instance.images,
  'description': instance.description,
  'categoryId': instance.categoryId,
};
