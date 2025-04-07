import 'package:ayan_healthcare/app/ui/widgets/dialogs/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Loading {
  static build(BuildContext context, bool isDismissible) =>
      Get.dialog(const LoadingSpinner(), barrierDismissible: isDismissible);

  static dismiss() {
    Get.back();
  }
}
