import 'package:json_annotation/json_annotation.dart';

part 'products_nums_response.g.dart';

@JsonSerializable()
class ProductsNumsResponse {
  final ProductsData data;

  ProductsNumsResponse({required this.data});

  String get productsNumbers {
    if (data.productList.isEmpty) {
      return '0';
    }
    return data.productList.length.toString();
  }

  factory ProductsNumsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsNumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsNumsResponseToJson(this);
}

@JsonSerializable()
class ProductsData {
  @JsonKey(name: 'products')
  final List<ProductInfo> productList;

  ProductsData({required this.productList});

  factory ProductsData.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDataToJson(this);
}

@JsonSerializable()
class ProductInfo {
  final String? title;

  ProductInfo({required this.title});

  factory ProductInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoToJson(this);
}
