import 'package:json_annotation/json_annotation.dart';

part 'upload_image_resourse.g.dart';

@JsonSerializable()
class UploadImageResourse {
  UploadImageResourse({this.location});

  factory UploadImageResourse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResourseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResourseToJson(this);

  final String? location;
}
