import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopi/core/app/upload_image_cubit/repo/upload_image_repo.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/utils/image_pick.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repo) : super(UploadImageInitial());

  final UploadImageRepo _repo;

  String getImageUrl = '';

  List<String> imageList = ['', '', ''];
  List<String> imageUpdateList = [];

  // pick image and save it in file and upload it to server
  Future<void> uploadImage() async {
    final pickedImage = await ImagePick().setImage(ImageSource.gallery);
    if (pickedImage == null) return;

    emit(UploadImageLoading());
    final result = await _repo.uploadImage(imageFile: pickedImage);

    result.when(
      success: (image) {
        getImageUrl = image.location ?? '';
        emit(UploadImageSuccess());
      },
      failure: (error) {
        emit(UploadImageError(error: error));
      },
    );
  }

  // pick image and save it in file and upload it to server with List
  Future<void> uploadImageList({required int indexId}) async {
    final pickedImage = await ImagePick().setImage(ImageSource.gallery);
    ();
    if (pickedImage == null) return;

    emit(UploadImageLoadingList(indexId: indexId));
    final result = await _repo.uploadImage(imageFile: pickedImage);

    result.when(
      success: (image) {
        imageList
          ..removeAt(indexId)
          ..insert(indexId, image.location ?? '');
        emit(UploadImageSuccess());
      },
      failure: (error) {
        emit(UploadImageError(error: error));
      },
    );
  }

  // Upload update image list
  Future<void> uploadUpdateImageList({
    required int indexId,
    required List<String> productImageList,
  }) async {
    final pickedImage = await ImagePick().setImage(ImageSource.gallery);
    if (pickedImage == null) return;

    emit(UploadImageLoadingList(indexId: indexId));
    final result = await _repo.uploadImage(imageFile: pickedImage);

    result.when(
      success: (image) {
        imageUpdateList = productImageList;
        imageUpdateList
          ..removeAt(indexId)
          ..insert(indexId, image.location ?? '');
        emit(UploadImageSuccess());
      },
      failure: (error) {
        emit(UploadImageError(error: error));
      },
    );
  }

  // remove image
  void removeImage() {
    getImageUrl = '';
    emit(UploadImageRemoved(imageUrl: getImageUrl));
  }
}
