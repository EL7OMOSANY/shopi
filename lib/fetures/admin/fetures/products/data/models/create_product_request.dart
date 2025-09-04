import 'package:json_annotation/json_annotation.dart';

part 'create_product_request.g.dart';

@JsonSerializable()
class CreateProductRequest {
  final String title;
  final double price;
  final List<String> images;
  final String description;
  final double categoryId;

  CreateProductRequest({
    required this.title,
    required this.price,
    required this.images,
    required this.description,
    required this.categoryId,
  });

  factory CreateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductRequestToJson(this);
}
