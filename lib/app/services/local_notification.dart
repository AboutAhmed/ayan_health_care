import 'package:ayan_healthcare/assets/styles/strings/app_constants.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  static late FlutterLocalNotificationsPlugin localNotification;

  Future<bool?> initialize() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    localNotification = FlutterLocalNotificationsPlugin();
    return await localNotification.initialize(initializationSettings);
  }



  static void showDaily(
      {required int id,
      String? title,
      String? body,
      required DateTime notificationTime}) async {
    Debug.log(notificationTime.toIso8601String());
    Debug.log(tz.local.name);
    Debug.log(tz.local.currentTimeZone);

    await localNotification.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(notificationTime, tz.local),
      getPlatForm(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static showNotification({String? title, String? body}) async {
    var android = const AndroidNotificationDetails(
        Keys.reminderChannelId, Keys.reminderChannel,
        channelDescription: "", styleInformation: BigTextStyleInformation(""));
    var ios = const DarwinNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);

    await localNotification.show(0, title, body, platform);
  }

  static NotificationDetails getPlatForm({String? id, String? name}) {
    var android = AndroidNotificationDetails(
      id ?? Keys.healthAlertId,
      name ?? Keys.healthAlert,
      channelDescription: "",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      enableLights: true,
    );

    var ios = const DarwinNotificationDetails();
    return NotificationDetails(android: android, iOS: ios);
  }

  static void cancel(int id) {
    localNotification.cancel(id);
  }
}
