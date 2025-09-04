import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_response.g.dart';

@JsonSerializable()
class GetAllProductsResponse {
  final AllProductsData data;

  GetAllProductsResponse({required this.data});

  Map<String, dynamic> toJson() => _$GetAllProductsResponseToJson(this);

  List<ProductModel> get productGetAllList {
    if (data.products.isEmpty) {
      return [];
    }
    return data.products;
  }

  //from json
  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);
}

@JsonSerializable()
class AllProductsData {
  @JsonKey(name: 'products')
  final List<ProductModel> products;
  AllProductsData({required this.products});

  Map<String, dynamic> toJson() => _$AllProductsDataToJson(this);

  //from json
  factory AllProductsData.fromJson(Map<String, dynamic> json) =>
      _$AllProductsDataFromJson(json);
}

@JsonSerializable()
class ProductModel {
  final String? id;
  final String? title;
  final double? price;
  final String? description;
  final List<String>? images;
  final ProductCategoryData? category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.category,
  });

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  //from json
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@JsonSerializable()
class ProductCategoryData {
  final String? id;
  final String? name;

  ProductCategoryData({required this.id, required this.name});

  Map<String, dynamic> toJson() => _$ProductCategoryDataToJson(this);

  //from json
  factory ProductCategoryData.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryDataFromJson(json);
}
