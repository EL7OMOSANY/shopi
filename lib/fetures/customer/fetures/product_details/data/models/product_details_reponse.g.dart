// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerProductDetailsResponse _$ProductDetailsResponseFromJson(
  Map<String, dynamic> json,
) => CustomerProductDetailsResponse(
  ProductDetailsData.fromJson(json['data'] as Map<String, dynamic>),
);

ProductDetailsData _$ProductDetailsDataFromJson(Map<String, dynamic> json) =>
    ProductDetailsData(
      ProductDetailsModel.fromJson(json['product'] as Map<String, dynamic>),
    );

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      json['description'] as String?,
      json['category'] == null
          ? null
          : CategoryDateilaModel.fromJson(
              json['category'] as Map<String, dynamic>,
            ),
      json['id'] as String?,
    );

CategoryDateilaModel _$CategoryDateilaModelFromJson(
  Map<String, dynamic> json,
) => CategoryDateilaModel(json['name'] as String);
