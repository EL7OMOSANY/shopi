// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsResponse _$GetAllProductsResponseFromJson(
  Map<String, dynamic> json,
) => GetAllProductsResponse(
  data: AllProductsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllProductsResponseToJson(
  GetAllProductsResponse instance,
) => <String, dynamic>{'data': instance.data};

AllProductsData _$AllProductsDataFromJson(Map<String, dynamic> json) =>
    AllProductsData(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllProductsDataToJson(AllProductsData instance) =>
    <String, dynamic>{'products': instance.products};

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: json['id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  price: (json['price'] as num?)?.toDouble(),
  category: json['category'] == null
      ? null
      : ProductCategoryData.fromJson(json['category'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'category': instance.category,
    };

ProductCategoryData _$ProductCategoryDataFromJson(Map<String, dynamic> json) =>
    ProductCategoryData(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductCategoryDataToJson(
  ProductCategoryData instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
