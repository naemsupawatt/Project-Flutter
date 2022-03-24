import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initilize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) {
      print(payload);
    });
  }

  static void showNotificationOnForeground() {
    final notificationDetail = NotificationDetails(
        android: AndroidNotificationDetails(
            "com.example.basicflutter", "basicflutter",
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker'));

    _notificationsPlugin.show(
      DateTime.now().microsecond,
      'แจ้งเตือน',
      'ทดสอบ',
      notificationDetail,
    );
  }
}
