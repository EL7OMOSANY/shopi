import 'package:json_annotation/json_annotation.dart';

part 'error_create_product_model.g.dart';

@JsonSerializable()
class ErrorCreateProductModel {
  final List<GraphqlError>? errors;
  final dynamic data;

  ErrorCreateProductModel({this.errors, this.data});

  factory ErrorCreateProductModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorCreateProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorCreateProductModelToJson(this);
}

@JsonSerializable()
class GraphqlError {
  final String? message;
  final List<GraphqlErrorLocation>? locations;
  final List<String>? path;
  final GraphqlErrorExtensions? extensions;

  GraphqlError({this.message, this.locations, this.path, this.extensions});

  factory GraphqlError.fromJson(Map<String, dynamic> json) =>
      _$GraphqlErrorFromJson(json);

  Map<String, dynamic> toJson() => _$GraphqlErrorToJson(this);
}

@JsonSerializable()
class GraphqlErrorLocation {
  final int? line;
  final int? column;

  GraphqlErrorLocation({this.line, this.column});

  factory GraphqlErrorLocation.fromJson(Map<String, dynamic> json) =>
      _$GraphqlErrorLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GraphqlErrorLocationToJson(this);
}

@JsonSerializable()
class GraphqlErrorExtensions {
  final String? code;
  final GraphqlOriginalError? originalError;

  GraphqlErrorExtensions({this.code, this.originalError});

  factory GraphqlErrorExtensions.fromJson(Map<String, dynamic> json) =>
      _$GraphqlErrorExtensionsFromJson(json);

  Map<String, dynamic> toJson() => _$GraphqlErrorExtensionsToJson(this);
}

@JsonSerializable()
class GraphqlOriginalError {
  final List<String>? message;
  final String? error;
  final int? statusCode;

  GraphqlOriginalError({this.message, this.error, this.statusCode});

  factory GraphqlOriginalError.fromJson(Map<String, dynamic> json) =>
      _$GraphqlOriginalErrorFromJson(json);

  Map<String, dynamic> toJson() => _$GraphqlOriginalErrorToJson(this);
}
