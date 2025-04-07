import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/app/ui/widgets/dialogs/loading_spinner.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/helper/connectivity.dart';
import 'package:ayan_healthcare/helper/toaster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // User Input Fields with TextEditingController
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController genderController = TextEditingController(); // Optional

  final RxBool isLoading = RxBool(false);
  final RxBool isTermsAccepted = false.obs; // Tracks if terms are accepted
  final signUpFormKey = GlobalKey<FormState>();

  // Toggle the terms acceptance
  void toggleTermsAcceptance(bool? value) {
    isTermsAccepted.value = value ?? false;
  }

  @override
  void initState() {
    clearAllField();
  }

  clearAllField() {
    fullNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    cnicController.clear();
    genderController.clear();
  }

  // Method to handle signup
  void signup() async {
    if (!signUpFormKey.currentState!.validate()) return;

    // Access field values directly through controllers
    String fullName = fullNameController.text;
    String email = emailController.text;
    String phoneNumber = phoneNumberController.text;
    String password = passwordController.text;
    String cnic = cnicController.text;
    String gender = genderController.text;

    if (!isTermsAccepted.value) {
      Toaster.showToast("You must accept the terms and conditions.");
      return;
    }

    isLoading.value = true;

    // Check connectivity
    if (!await Connectivity.isOnline()) {
      Connectivity.internetErrorDialog();
      isLoading.value = false;
      return;
    }

    Get.dialog(const LoadingSpinner());

    // Create signup model data
    final data = {
      "Name": fullName,
      "Email": email,
      "Password": password,
      "Gender": gender,
      "CNIC": cnic,
      "Phone": phoneNumber,
      "MasterUsername": Constant.masterUsername,
      "LocationID": Constant.locationID
    };

    try {
      // Call the signup method and get the structured response
      final signupResponse = await ApiFetch.signup(data);
      Get.back();
      isLoading.value = false;

      // Check if the response is null
      final status = signupResponse.meta.status;
      final message = signupResponse.meta.message;

      // Handle different status codes
      if (status == "200" && message == "OK") {
        Toaster.showToast("Signup successful. Redirecting to login...");
        Get.toNamed(AppRoutes.login);
        clearAllField();
      } else if (status == "401") {
        // If the response is null, show the message from the Meta section
        if (signupResponse.response == null) {
          Toaster.showToast(message); // Show the message "User  Already Exists"
        } else {
          Toaster.showToast("Unable to signup, ${signupResponse.meta.message}");
        }
      } else {
        Toaster.showToast("Unable to signup, ${signupResponse.meta.message}");
      }
    } catch (e) {
      Debug.log("Error::: $e");
      Get.back();
      isLoading.value = false;
      Toaster.showToast("An error occurred: ${e.toString()}");
    }
  }

  // Override the onClose method to clear the text fields
  @override
  void onClose() {
    // Clear all text fields
    fullNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    cnicController.clear();
    genderController.clear();
    // Call the superclass method first
  }
}
