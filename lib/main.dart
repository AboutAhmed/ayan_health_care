import 'package:ayan_healthcare/app/controller/setting_controller.dart';
import 'package:ayan_healthcare/app/routes/pages.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/services/services.dart';
import 'package:ayan_healthcare/assets/app_theme_info.dart';
import 'package:ayan_healthcare/firebase_options.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Services().initServices();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ChuckerFlutter.showOnRelease = true;

  // Initialize SettingsController and load saved language
  final SettingsController settingsController = Get.put(SettingsController());
  settingsController
      .loadSavedLanguage(); // Await the loading of the saved language

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SettingsController settingsController =
      Get.find(); // Get the instance of SettingsController

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Determine the current locale based on the currentLanguage
      Locale currentLocale = Locale(settingsController.currentLanguage.value);

      return GetMaterialApp(
        initialRoute: AppRoutes.splash,
        locale: currentLocale, // Set the locale based on saved or default
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        // navigatorObservers: [ChuckerFlutter.navigatorObserver, routeObserver],
        theme: AppThemeInfo.themeData,
      );
    });
  }
}
