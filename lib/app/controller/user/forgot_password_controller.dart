import 'package:ayan_healthcare/app/models/forgot_password_model.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;

  Future<void> forgotPassword(String email) async {
    isLoading.value = true;
    try {
      final response = await ApiFetch.forgotPassword({
        "UserEmail": email,
        "FromEmail": Constant.fromEmail,
        "MasterUsername": Constant.masterUsername,
        "SenderName": Constant.senderName,
        "AppName": Constant.appName,
      });

      // Convert response to ForgotPasswordModel
      ForgotPasswordModel result = response;

      if (result.meta.status == 200) {
        Get.snackbar("Success", "Reset email sent successfully!");
      } else {
        Get.snackbar("Error", result.meta.message);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to send reset email");
    } finally {
      isLoading.value = false;
    }
  }
}
