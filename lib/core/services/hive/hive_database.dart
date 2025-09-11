import 'package:hive_flutter/adapters.dart';
import 'package:shopi/fetures/admin/fetures/notifications/data/models/add_notification_model.dart';

class HiveDatabase {
  factory HiveDatabase() => _instance;

  HiveDatabase._();

  static final HiveDatabase _instance = HiveDatabase._();

  Box<NotificationModel>? notificationBox;
  // Box<FavoritesModel>? favoritesBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive.registerAdapter(NotificationModelAdapter());
    // ..registerAdapter(FavoritesModelAdapter());

    notificationBox = await Hive.openBox<NotificationModel>('notification_box');

    // favoritesBox = await Hive.openBox<FavoritesModel>('favorites_box');
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
    // await favoritesBox!.clear();
  }
}
