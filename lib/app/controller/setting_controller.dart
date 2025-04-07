import 'dart:ui';

import 'package:ayan_healthcare/assets/styles/strings/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  final RxString currentLanguage = 'en'.obs;
  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'ar', 'name': 'العربية'},
  ];

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  void loadSavedLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    String? savedLang = preferences.getString(Keys.language);
    if (savedLang != null && savedLang.isNotEmpty) {
      currentLanguage.value = savedLang;
      updateLocale(savedLang);
    }
  }

  void changeLanguage(String langCode) {
    currentLanguage.value = langCode;
    updateLocale(langCode);
    saveLanguagePreference(langCode);
  }

  void updateLocale(String langCode) {
    Get.updateLocale(Locale(langCode));
  }

  void saveLanguagePreference(String langCode) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(Keys.language, langCode);
  }
}
