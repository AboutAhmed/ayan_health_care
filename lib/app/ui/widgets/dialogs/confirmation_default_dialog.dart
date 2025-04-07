import 'package:flutter/material.dart';
import 'package:get/get.dart';

showDefaultDialog({
  required String text,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
}) async {
  Get.defaultDialog(
    barrierDismissible: false,
    title: "Confirmation",
    middleText: text,
    onConfirm: onConfirm,
    confirmTextColor: Colors.white,
    textCancel: "Keys.deleteDialogCancel",
    textConfirm:" Keys.deleteDialogConfirm",
    onCancel: onCancel,
  );
}
