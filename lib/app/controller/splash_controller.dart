import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/assets/styles/strings/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(Keys.isLoggedIn) ?? false;

    // Check if user data is available
    String? username = prefs.getString(Keys.username);
    String? email = prefs.getString(Keys.email);
    String? phone = prefs.getString(Keys.phone);

    if (isLoggedIn && username != null && email != null && phone != null) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
