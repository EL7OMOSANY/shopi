// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductResponse _$CreateProductResponseFromJson(
  Map<String, dynamic> json,
) => CreateProductResponse(
  data: ProductResponseData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateProductResponseToJson(
  CreateProductResponse instance,
) => <String, dynamic>{'data': instance.data.toJson()};

ProductResponseData _$ProductResponseDataFromJson(Map<String, dynamic> json) =>
    ProductResponseData(
      product: Product.fromJson(json['addProduct'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseDataToJson(
  ProductResponseData instance,
) => <String, dynamic>{'addProduct': instance.product.toJson()};

Product _$ProductFromJson(Map<String, dynamic> json) =>
    Product(title: json['title'] as String?);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'title': instance.title,
};

ProductCategoryData _$ProductCategoryDataFromJson(Map<String, dynamic> json) =>
    ProductCategoryData(
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProductCategoryDataToJson(
  ProductCategoryData instance,
) => <String, dynamic>{'name': instance.name, 'id': instance.id};
