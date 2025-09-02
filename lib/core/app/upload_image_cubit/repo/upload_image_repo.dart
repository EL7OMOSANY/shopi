import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopi/core/app/upload_image_cubit/models/upload_image_resourse.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/graphql/api_service.dart';

class UploadImageRepo {
  final ApiService _api;

  UploadImageRepo(this._api);

  Future<ApiCheckResult<UploadImageResourse>> uploadImage({
    required XFile imageFile,
  }) async {
    try {
      final fromData = FormData();

      fromData.files.add(
        MapEntry('file', await MultipartFile.fromFile(imageFile.path)),
      );

      final response = await _api.uploadImage(fromData);

      return ApiCheckResult.success(response);
    } catch (error) {
      return ApiCheckResult.failure(error.toString());
    }
  }
}
