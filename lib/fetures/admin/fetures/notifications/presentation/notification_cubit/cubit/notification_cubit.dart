import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopi/core/services/graphql/api_check_result.dart';
import 'package:shopi/core/services/hive/hive_database.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/models/add_notification_model.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/repos/notifaction_repos.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notifactionRepos) : super(NotificationInitial());
  List<NotificationModel> notificationList = [];
  final NotifactionRepos _notifactionRepos;

  // create notification

  Future<void> createNotification(NotificationModel notificationModel) async {
    emit(CreateNotificationLoading());
    try {
      await HiveDatabase().notificationBox!.add(
        NotificationModel(
          body: notificationModel.body,
          createAt: notificationModel.createAt,
          productId: notificationModel.productId,
          title: notificationModel.title,
        ),
      );

      emit(CreateNotificationSuccess());
      // await getAllNotifications();
    } catch (error) {
      emit(CreateNotificationError(error.toString()));
    }
  }

  // get all notifications

  FutureOr<void> getAllNotifications() {
    emit(GetAllNotificationLoading());

    try {
      notificationList = HiveDatabase().notificationBox!.values.toList();
      if (notificationList.isEmpty) {
        emit(GetAllNotificationEmpty());
      } else {
        emit(GetAllNotificationSuccess(notificationList: notificationList));
      }
    } catch (error) {
      emit(GetAllNotificationError(error.toString()));
    }
  }

  // delete notification

  Future<void> deleteNotification(int index) async {
    emit(DeleteNotificationLoading());
    try {
      await HiveDatabase().notificationBox!.deleteAt(index);
      emit(DeleteNotificationSuccess());
      // await getAllNotifications();
    } catch (error) {
      emit(DeleteNotificationError(error.toString()));
    }
  }

  //edit notification

  Future<void> editNotification(
    int index,
    NotificationModel notificationModel,
  ) async {
    emit(EditNotificationLoading());
    try {
      await HiveDatabase().notificationBox!.putAt(
        index,
        NotificationModel(
          body: notificationModel.body,
          createAt: notificationModel.createAt,
          productId: notificationModel.productId,
          title: notificationModel.title,
        ),
      );
      emit(EditNotificationSuccess());
      // await getAllNotifications();
    } catch (error) {
      emit(EditNotificationError(error.toString()));
    }
  }

  //send notification

  Future<void> sendNotification({
    required NotificationModel notificationModel,
  }) async {
    emit(SendNotificationLoading());
    try {
      final response = await _notifactionRepos.sendNotification(
        body: notificationModel.body,
        title: notificationModel.title,
        productId: notificationModel.productId,
      );
      response.when(
        success: (data) {
          log("✅ sendNotification success => $data");
          emit(SendNotificationSuccess());
        },
        failure: (error) {
          log("❌ sendNotification error => $error");
          emit(SendNotificationError(error));
        },
      );
    } catch (error) {
      emit(SendNotificationError(error.toString()));
    }
  }
}
