import 'dart:io';

import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Connectivity {
  static Future<bool> isOnline() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return [];
      });
      Debug.log('connection checking...');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Debug.log('connected');
        return true;
      }
    } on SocketException catch (_) {
      Debug.log('not connected');
    }

    return false;
  }

  static Future<void> internetErrorDialog() {
    return Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_off,
              size: 60.0,
            ),
            widgetSpacerVertically(),
            const Text(
              'No Internet Connection',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            otherSpacerVertically(),
            const Text(
              'Internet access is required \nto use this feature.',
              textAlign: TextAlign.center,
            ),
            widgetSpacerVertically(),
            SizedBox(
              width: 120.0,
              child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Cancel")),
            )
          ],
        ),
      ),
    );
  }
}
