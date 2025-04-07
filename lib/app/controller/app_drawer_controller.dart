import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/assets/styles/strings/app_constants.dart';
import 'package:ayan_healthcare/helper/preferences.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawerController extends GetxController {
  var username = ''.obs;
  var name = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var mrNo = ''.obs;
  var image = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    final preferences = Get.find<Preferences>();
    username.value = preferences.getString(Keys.username) ?? '';
    name.value = preferences.getString(Keys.name) ?? '';
    phone.value = preferences.getString(Keys.phone) ?? '';
    email.value = preferences.getString(Keys.email) ?? '';
    mrNo.value = preferences.getString(Keys.mrNo) ?? '';
    image.value = preferences.getString(Keys.image) ?? '';
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
