import 'package:json_annotation/json_annotation.dart';

part 'delete_product.g.dart';

@JsonSerializable()
class DeleteProduct {
  final String id;

  DeleteProduct({required this.id});

  factory DeleteProduct.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteProductToJson(this);
}
