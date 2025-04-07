
import 'package:ayan_healthcare/app/services/local_notification.dart';
import 'package:ayan_healthcare/helper/preferences.dart';
import 'package:get/get.dart';

class Services {
  static final Services _instance = Services._();

  Services._();

  factory Services() => _instance;

  Future<void> initServices() async {
    // await Get.putAsync<DatabaseManager>(() => DatabaseManager().initial());
    // await Get.putAsync<RecentlySearchController>(
    //     () => RecentlySearchController().initialize());
    // Get.lazyPut(() => LabTestCartController(), fenix: true);
    // Get.lazyPut(() => RecentBookingController(), fenix: true);
    // Get.lazyPut(() => CategoriesController(), fenix: true);
    // Get.lazyPut(() => InAppReviewController(), fenix: true);
    // Get.putAsync(() => AppsFlyerService().init());
    // Get.lazyPut(() => YouTubeController(), fenix: true);

    await Get.putAsync(() => Preferences().init());

    // try {
    //   await Get.putAsync(() => Firebase.initializeApp(
    //         options: DefaultFirebaseOptions.currentPlatform,
    //       ));
    //   Get.put(AnalyticsService());

    //   await _configureLocalTimeZone();
    // } on Exception catch (e) {
    //   Debug.log("Firebase InitializeApp Error::: $e");
    // }

    await Get.putAsync(
      () => LocalNotification().initialize(),
      permanent: true,
    );
    // await Get.putAsync(
    //   () => PushNotificationsManager().init(),
    //   permanent: true,
    // );

    //   final status = await Permission.appTrackingTransparency.request();
    //   if (status == PermissionStatus.granted) {
    //     await FacebookAuth.i.autoLogAppEventsEnabled(true);
    //     Debug.log(
    //         "isAutoLogAppEventsEnabled:: ${await FacebookAuth.i.isAutoLogAppEventsEnabled}");
    //   }
  }
}
