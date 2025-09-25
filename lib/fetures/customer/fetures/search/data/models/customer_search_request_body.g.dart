// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_search_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerSearchRequestBody _$SearchRequestBodyFromJson(
  Map<String, dynamic> json,
) => CustomerSearchRequestBody(
  searchName: json['searchName'] as String?,
  priceMin: json['priceMin'] as double?,
  priceMax: json['priceMax'] as double?,
);

Map<String, dynamic> _$SearchRequestBodyToJson(
  CustomerSearchRequestBody instance,
) => <String, dynamic>{
  'searchName': instance.searchName,
  'priceMin': instance.priceMin,
  'priceMax': instance.priceMax,
};
