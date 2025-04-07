import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationsManager {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  PushNotificationsManager() {
    _initialize();
  }

  void _initialize() {
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {
      print("Firebase Messaging Token: $token");
    });

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotifications(String token, String title, String body,
      {Map<String, dynamic>? payload}) {
    _firebaseMessaging.sendMessage(
      to: token,
      // data: payload ?? {},
      // notification: RemoteMessageNotification(
      //   title: title,
      //   body: body,
      // ),
    );
  }
}