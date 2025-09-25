import 'package:json_annotation/json_annotation.dart';

part 'customer_search_request_body.g.dart';

@JsonSerializable()
class CustomerSearchRequestBody {
  CustomerSearchRequestBody({
    required this.searchName,
    required this.priceMin,
    required this.priceMax,
  });

  final String? searchName;
  final double? priceMin;
  final double? priceMax;

  Map<String, dynamic> toJson() => _$SearchRequestBodyToJson(this);

  factory CustomerSearchRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestBodyFromJson(json);
}
