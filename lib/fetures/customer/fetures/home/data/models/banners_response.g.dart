// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(BannersData.fromJson(json['data'] as Map<String, dynamic>));

BannersData _$BannersDataFromJson(Map<String, dynamic> json) => BannersData(
  (json['products'] as List<dynamic>)
      .map((e) => BannersModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

BannersModel _$BannersModelFromJson(Map<String, dynamic> json) => BannersModel(
  (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  json['title'] as String?,
);
