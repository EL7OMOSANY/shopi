// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_create_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorCreateProductModel _$ErrorCreateProductModelFromJson(
  Map<String, dynamic> json,
) => ErrorCreateProductModel(
  errors: (json['errors'] as List<dynamic>?)
      ?.map((e) => GraphqlError.fromJson(e as Map<String, dynamic>))
      .toList(),
  data: json['data'],
);

Map<String, dynamic> _$ErrorCreateProductModelToJson(
  ErrorCreateProductModel instance,
) => <String, dynamic>{'errors': instance.errors, 'data': instance.data};

GraphqlError _$GraphqlErrorFromJson(Map<String, dynamic> json) => GraphqlError(
  message: json['message'] as String?,
  locations: (json['locations'] as List<dynamic>?)
      ?.map((e) => GraphqlErrorLocation.fromJson(e as Map<String, dynamic>))
      .toList(),
  path: (json['path'] as List<dynamic>?)?.map((e) => e as String).toList(),
  extensions: json['extensions'] == null
      ? null
      : GraphqlErrorExtensions.fromJson(
          json['extensions'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$GraphqlErrorToJson(GraphqlError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'locations': instance.locations,
      'path': instance.path,
      'extensions': instance.extensions,
    };

GraphqlErrorLocation _$GraphqlErrorLocationFromJson(
  Map<String, dynamic> json,
) => GraphqlErrorLocation(
  line: (json['line'] as num?)?.toInt(),
  column: (json['column'] as num?)?.toInt(),
);

Map<String, dynamic> _$GraphqlErrorLocationToJson(
  GraphqlErrorLocation instance,
) => <String, dynamic>{'line': instance.line, 'column': instance.column};

GraphqlErrorExtensions _$GraphqlErrorExtensionsFromJson(
  Map<String, dynamic> json,
) => GraphqlErrorExtensions(
  code: json['code'] as String?,
  originalError: json['originalError'] == null
      ? null
      : GraphqlOriginalError.fromJson(
          json['originalError'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$GraphqlErrorExtensionsToJson(
  GraphqlErrorExtensions instance,
) => <String, dynamic>{
  'code': instance.code,
  'originalError': instance.originalError,
};

GraphqlOriginalError _$GraphqlOriginalErrorFromJson(
  Map<String, dynamic> json,
) => GraphqlOriginalError(
  message: (json['message'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  error: json['error'] as String?,
  statusCode: (json['statusCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$GraphqlOriginalErrorToJson(
  GraphqlOriginalError instance,
) => <String, dynamic>{
  'message': instance.message,
  'error': instance.error,
  'statusCode': instance.statusCode,
};
