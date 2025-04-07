import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';

class CustomDatePicker {
  static Future<DateTime?> showPicker({
    DateTime? firstParams,
    DateTime? lastParams,
    DateTime? initialParams,
  }) async {
    DateTime firstDate = DateTime.now();
    DateTime lastDate = DateTime.now().add(const Duration(days: 10000));
    DateTime initialDate = DateTime.now();

    if (firstParams != null) {
      firstDate = firstParams;
    }
    if (lastParams != null) {
      lastDate = lastParams;
    }
    if (initialParams != null) {
      if (firstDate.isBefore(initialParams)) {
        initialDate = initialParams;
      }
    }

    return await Get.defaultDialog(
      title: "Select Date",
      content: SizedBox(
        width: Get.width,
        child: DatePickerWidget(
          firstDate: firstDate,
          dateFormat: 'MMM-dd-yyyy',
          initialDate: initialDate,
          lastDate: lastDate,
          onChange: (date, _) => initialDate = date,
        ),
      ),
      textCancel: "Cancel",
      onConfirm: () {
        Get.back(result: initialDate);
      },
    );
  }
}
