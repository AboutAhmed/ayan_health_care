import 'dart:convert';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/assets/styles/strings/app_constants.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/helper/preferences.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PushNotificationsManager extends GetxService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin localNotification =
      FlutterLocalNotificationsPlugin();

  Future<PushNotificationsManager> init() async {
    await _messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    // Future<void> navigate(String? type, {Map<String, dynamic>? payload}) async {
    //   if (type == Keys.blogs) {
    //     Get.toNamed(
    //       AppRoutes.webview,
    //       arguments: [payload?['url'], payload?['title']],
    //     );
    //   } else if (type == Keys.testUpdate) {
    //     Get.toNamed(
    //       AppRoutes.testDetail,
    //       arguments: payload == null ? null : Test.fromJson(payload),
    //     );
    //   } else if (type == Keys.labOrder) {
    //     Get.to(
    //       () => const MyBooking(
    //         initialIndex: 0,
    //       ),
    //     );
    //   } else if (type == Keys.labReport) {
    //     Get.toNamed(
    //       AppRoutes.diagnosticsReports,
    //     );
    //   } else if (type == Keys.appointment) {
    //     Get.toNamed(
    //       AppRoutes.appointmentDetails,
    //       arguments: payload?['ID'].toString() ?? payload?['Id'].toString(),
    //     );
    //   } else if (type == Keys.medicine) {
    //     Get.to(
    //       () => const MyBooking(
    //         initialIndex: 2,
    //       ),
    //     );
    //   } else if (type == Keys.prescription) {
    //     Get.toNamed(
    //       AppRoutes.prescriptions,
    //     );
    //   } else if (type == Keys.reviewRequest) {
    //     Get.toNamed(
    //       AppRoutes.rating,
    //     );
    //   } else if (type == Keys.chatMessage) {
    //     var room =
    //         await FirebaseChatCore.instance.room(payload?[Keys.roomId]).first;
    //     Get.toNamed(
    //       AppRoutes.chatRoom,
    //       arguments: room,
    //     );
    //   }
    // }

    await localNotification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (notificationResponse) {
        if (notificationResponse.payload != null) {
          final Map<String, dynamic> payload =
              jsonDecode(notificationResponse.payload!);

          String action = payload[Keys.actionType];
          final data = jsonDecode(payload[Keys.data]);

          // navigate(
          //   action,
          //   payload: data,
          // );
        }
      },
    );

    // foreground
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) =>
          notificationDecide(message, isForeground: true),
    );

    FirebaseMessaging.instance.getToken().then(
      (String? token) async {
        assert(token != null);
        printInfo(info: "Firebase Token: $token");
        Get.find<Preferences>().setString(Keys.firebaseToken, token);
      },
    );

    return this;
  }

  void notificationDecide(RemoteMessage? message, {bool isForeground = false}) {
    if (message == null) return;

    Debug.log("Notification Data::: ${message.data}");

    String? lastMessageID = Get.find<Preferences>().getString(Keys.messageId);

    /// to handle duplicate messages.
    if (lastMessageID == message.messageId) {
      return;
    }
    Get.find<Preferences>().setString(
      Keys.messageId,
      message.messageId,
    );

    RemoteNotification? notification = message.notification;
    String? action = message.data[Keys.actionType];
    Map<String, dynamic>? payload;
    if (!GetUtils.isNullOrBlank(message.data[Keys.data])!) {
      payload = json.decode(message.data[Keys.data]);
    }

    String title = notification?.title ?? "Notification Title";
    String body = notification?.body ?? "Notification Body";

    if (isForeground) {
      if (action == Keys.chatMessage &&
          Get.currentRoute == AppRoutes.chatRoom) {
        return;
      }

      showLocalNotification(
        title: title,
        body: body,
        payload: json.encode(message.data),
      );
    } else {
      // navigate(
      //   action,
      //   payload: payload,
      // );
    }
  }

  /// make sure you initialized [_messaging] and [localNotification] before
  Future<void> backgroundNotificationHandler() async {
    // background
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) => notificationDecide(
        message,
      ),
    );

    // terminate
    _messaging.getInitialMessage().then(
          (RemoteMessage? message) => notificationDecide(message),
        );

    final notificationDetails =
        await localNotification.getNotificationAppLaunchDetails();

    if (notificationDetails?.notificationResponse?.payload != null) {
      final Map<String, dynamic> payload =
          jsonDecode(notificationDetails!.notificationResponse!.payload!);

      String action = payload[Keys.actionType];
      final data = jsonDecode(payload[Keys.data]);
      // navigate(
      //   action,
      //   payload: data,
      // );
    }
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    var android =  AndroidNotificationDetails(
      Keys.channelCriticalId,
      Keys.channelCriticalName,
      channelDescription: "",
      styleInformation: BigTextStyleInformation(""),
    );
    var ios = const DarwinNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: ios);

    await localNotification.show(
      0,
      title,
      body,
      platform,
      payload: payload,
    );
  }

  Future<bool> sendNotification(
    String to,
    String title,
    String body, {
    Map<String, dynamic>? payload,
  }) async {
    final HttpsCallable function =
        FirebaseFunctions.instance.httpsCallable("sendMessage");

    try {
      var results = await function.call(<String, dynamic>{
        "token": to,
        "title": title,
        "body": body,
        "payload": payload
      });

      Get.log(results.data);
      return results.data["successCount"] > 0;
    } catch (e) {
      Debug.log("Error::: $e");
    }
    return false;
  }

  Future<void> sendNotifications(
    String to,
    String title,
    String body, {
    Map<String, dynamic>? payload,
  }) async {
    final Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': Keys.cMsgKey
          },
          body: jsonEncode({
            "to": to,
            "notification": {
              'title': title,
              'body': body,
            },
            "data": payload,
            "priority": "high"
          }));

      if (response.statusCode == 200) {
        Debug.log('Notification sent successfully');
      } else {
        Debug.log(
            'Failed to send notification: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      Debug.log('Error sending notification: $e');
    }
  }
}
