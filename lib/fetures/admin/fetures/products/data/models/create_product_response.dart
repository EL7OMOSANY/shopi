import 'package:json_annotation/json_annotation.dart';

part 'create_product_response.g.dart';

@JsonSerializable()
class CreateProductResponse {
  final ProductResponseData data;

  CreateProductResponse({required this.data});

  factory CreateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductResponseToJson(this);
}

@JsonSerializable()
class ProductResponseData {
  @JsonKey(name: 'addProduct')
  final Product product;

  ProductResponseData({required this.product});

  factory ProductResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseDataToJson(this);
}

@JsonSerializable()
class Product {
  final String? title;

  Product({this.title});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductCategoryData {
  final String? name;
  final String? id;

  ProductCategoryData({this.name, this.id});

  factory ProductCategoryData.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryDataToJson(this);
}
