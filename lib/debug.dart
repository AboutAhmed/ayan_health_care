import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Debug {
  static log(value) {
    if (kDebugMode) {
      Get.log("$value");
    }
  }
}
