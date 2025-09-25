part of 'share_cubit.dart';

abstract class ShareState {}

class ShareInitial extends ShareState {}

class ShareLoading extends ShareState {
  final int productId;
  ShareLoading(this.productId);
}

class ShareSuccess extends ShareState {}

class ShareError extends ShareState {
  final String message;
  ShareError(this.message);
}
