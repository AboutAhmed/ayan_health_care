import 'dart:async';

import 'package:ayan_healthcare/app/models/login_model.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/app/ui/widgets/dialogs/loading_spinner.dart';
import 'package:ayan_healthcare/assets/styles/strings/app_constants.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/helper/preferences.dart';
import 'package:ayan_healthcare/helper/toaster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool rememberMe = false.obs;
  final RxBool useBiometricAuth = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final LocalAuthentication auth = LocalAuthentication();
  var isPasswordVisible = false.obs;

  @override
  void onInit() {
    super.onInit();

    Get.put(Preferences());
    _checkRememberMe();
  }

  @override
  void onClose() {
    lockoutTimer?.cancel();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(Keys.isLoggedIn) ?? false;

    // Check if user data is available
    String? username = prefs.getString(Keys.username);
    String? email = prefs.getString(Keys.email);
    String? phone = prefs.getString(Keys.phone);

    if (isLoggedIn && username != null && email != null && phone != null) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Toaster.showToast("Login to continue");
      ;
    }
  }

  // Variables to track biometric authentication attempts
  int biometricAttempts = 0;
  Timer? lockoutTimer;
  final int maxAttempts = 5;
  final Duration lockoutDuration = Duration(minutes: 5);
  bool isLockedOut = false;

  Future<bool?> authenticate() async {
    if (isLockedOut) {
      Toaster.showToast('Too many failed attempts. Please try again later.');
      return null;
    }

    final hasBiometric = await auth.canCheckBiometrics;
    if (hasBiometric) {
      try {
        bool isAuthenticated = await auth.authenticate(
          localizedReason: "Scan fingerprint to authenticate",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true,
          ),
        );

        if (isAuthenticated) {
          Toaster.showToast('Authentication successful');
          biometricAttempts = 0; // Reset attempts on success
          await checkLoginStatus();

          return true;
        } else {
          biometricAttempts++;
          Toaster.showToast('Authentication failed');

          if (biometricAttempts >= maxAttempts) {
            isLockedOut = true;
            Toaster.showToast(
                'Too many failed attempts. Please wait 5 minutes.');
            startLockoutTimer();
          }
          return false;
        }
      } catch (e) {
        Debug.log('Error: $e');
      }
    } else {
      Toaster.showToast('Biometrics not available on this device');
    }
    return null;
  }

  void startLockoutTimer() {
    lockoutTimer = Timer(lockoutDuration, () {
      isLockedOut = false;
      biometricAttempts = 0; // Reset attempts after lockout
      Toaster.showToast('You can try biometric authentication again.');
    });
  }

  Future<void> _checkRememberMe() async {
    final preferences = Get.find<Preferences>();
    if (preferences.getBool(Keys.isLoggedIn) ?? false) {
      await _authenticateWithBiometrics();
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );

      if (authenticated) {
        Get.offAllNamed(AppRoutes.home);
      }
    } catch (e) {
      Debug.log('Error during biometric authentication: ${e.toString()}');
    }
  }

  Future<LoginModel?> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Toaster.showToast('Please enter your email and password.');
      return null;
    }

    // Show loading spinner
    Get.dialog(const LoadingSpinner(), barrierDismissible: false);
    isLoading.value = true;

    try {
      // Call the API to log in using the ApiFetch class
      LoginModel? loginModelResponse = await ApiFetch.login({
        'Email': emailController.text,
        'Password': passwordController.text,
        "MasterUsername": Constant.masterUsername
      });

      Get.back(); // Close the loading dialog

      // Check if the response is valid and contains user data
      if (loginModelResponse.meta?.status == "200") {
        // Access the nested response
        var userResponse = loginModelResponse.response?.response;

        if (userResponse != null) {
          // Extract user data
          User user = userResponse.user!;
          HumanUser humanUser = userResponse.humanUser!;
          Address address = userResponse.address!;
          Patient patient = userResponse.patient!;

          // Create a response object
          ResponseResponse response = ResponseResponse(
              user: user,
              humanUser: humanUser,
              address: address,
              patient: patient);

          // Save user preferences
          setPreferences(response);
          Get.find<Preferences>().setBool(Keys.isLoggedIn, true);

          // Navigate to home
          Get.offAllNamed(AppRoutes.home);
          return loginModelResponse; // Return the user object
        } else {
          // Handle case where user data is not present
          _showLoginFailedDialog();
          return null; // Return null if login fails
        }
      } else {
        // Handle case where API response status is not 200
        _showLoginFailedDialog();
        return null; // Return null if login fails
      }
    } catch (e) {
      Debug.log('Error during login: ${e.toString()}');
      Get.defaultDialog(
        title: 'Error',
        middleText: 'An error occurred during login. Please try again.',
        textCancel: 'OK',
      );
      return null; // Return null on error
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }

  void _showLoginFailedDialog() {
    Get.back(); // Close the loading dialog
    Get.defaultDialog(
      title: 'Login Failed',
      middleText: 'Invalid email or password.',
      textCancel: 'Try Again',
    );
    isLoading.value = false; // Reset loading state
  }

  void setPreferences(ResponseResponse response) {
    final preferences = Get.find<Preferences>();
    try {
      preferences.setString(Keys.username, response.user?.username ?? '');
      preferences.setString(Keys.mrNo, response.patient?.mrNo ?? '');
      preferences.setString(Keys.name, response.user?.name ?? '');
      preferences.setBool(Keys.status, response.user?.status ?? false);
      preferences.setString(Keys.phone, response.user?.phone ?? '');
      preferences.setString(Keys.image, response.user?.imagePath ?? '');
      preferences.setString(Keys.email, response.user?.email ?? '');
      // preferences.setString(
      // Keys.sessionToken, response.patient?.sessionToken ?? '');
      // preferences.setString(Keys.address, response.address?.location ?? '');
    } catch (e) {
      Debug.log('Error setting preferences: ${e.toString()}');
    }
  }

  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }
}
