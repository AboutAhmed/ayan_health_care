import 'package:ayan_healthcare/debug.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class Toaster {
  static void showToast(String message, {Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      fontSize: 16.0,
    );
  }

  static void showErrorAlertSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      isDismissible: false,
      snackbarStatus: (value) {
        Debug.log(value);
      },
    );
  }

  static void showConfirmAlertSnackBar(String message) {
    Get.snackbar(
      'Confirm',
      message,
      backgroundColor: Colors.green.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      isDismissible: false,
      // snackPosition: SnackPosition.BOTTOM,
      snackbarStatus: (value) {
        Debug.log(value);
      },
    );
  }

  static void showAlertSnackBar(String message) {
    Get.snackbar(
      'Alert!',
      message,
      backgroundColor: Colors.red.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      isDismissible: false,
      snackPosition: SnackPosition.BOTTOM,
      // margin: const EdgeInsets.only(bottom: 12),
      snackbarStatus: (value) {
        Debug.log(value);
      },
    );
  }
}
