part of 'notification_cubit.dart';

sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

// create states

final class CreateNotificationLoading extends NotificationState {}

final class CreateNotificationError extends NotificationState {
  final String message;
  CreateNotificationError(this.message);
}

final class CreateNotificationSuccess extends NotificationState {
  CreateNotificationSuccess();
}

//delete states

final class DeleteNotificationLoading extends NotificationState {}

final class DeleteNotificationError extends NotificationState {
  final String message;
  DeleteNotificationError(this.message);
}

final class DeleteNotificationSuccess extends NotificationState {}

//edit states

final class EditNotificationLoading extends NotificationState {}

final class EditNotificationError extends NotificationState {
  final String message;
  EditNotificationError(this.message);
}

final class EditNotificationSuccess extends NotificationState {}

//get all notifications states

final class GetAllNotificationLoading extends NotificationState {}

final class GetAllNotificationError extends NotificationState {
  final String message;
  GetAllNotificationError(this.message);
}

final class GetAllNotificationSuccess extends NotificationState {
  final List<NotificationModel> notificationList;
  GetAllNotificationSuccess({required this.notificationList});
}

final class GetAllNotificationEmpty extends NotificationState {}

//send notification states

final class SendNotificationLoading extends NotificationState {}

final class SendNotificationError extends NotificationState {
  final String message;
  SendNotificationError(this.message);
}

final class SendNotificationSuccess extends NotificationState {}
