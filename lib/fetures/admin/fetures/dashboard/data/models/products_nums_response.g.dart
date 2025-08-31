// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_nums_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsNumsResponse _$ProductsNumsResponseFromJson(
  Map<String, dynamic> json,
) => ProductsNumsResponse(
  data: ProductsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductsNumsResponseToJson(
  ProductsNumsResponse instance,
) => <String, dynamic>{'data': instance.data};

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
  productList: (json['products'] as List<dynamic>)
      .map((e) => ProductInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{'products': instance.productList};

ProductInfo _$ProductInfoFromJson(Map<String, dynamic> json) =>
    ProductInfo(title: json['title'] as String?);

Map<String, dynamic> _$ProductInfoToJson(ProductInfo instance) =>
    <String, dynamic>{'title': instance.title};
