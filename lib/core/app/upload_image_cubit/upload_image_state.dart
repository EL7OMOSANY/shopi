part of 'upload_image_cubit.dart';

abstract class UploadImageState {}

class UploadImageInitial extends UploadImageState {}

class UploadImageLoading extends UploadImageState {}

class UploadImageIsEmpty extends UploadImageState {}

class UploadImageLoadingList extends UploadImageState {
  final int indexId;
  UploadImageLoadingList({required this.indexId});
}

class UploadImageSuccess extends UploadImageState {}

class UploadImageRemoved extends UploadImageState {
  final String imageUrl;
  UploadImageRemoved({required this.imageUrl});
}

class UploadImageError extends UploadImageState {
  final String error;
  UploadImageError({required this.error});
}
