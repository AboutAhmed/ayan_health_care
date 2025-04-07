import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: [
          const Icon(Icons.water_outlined),
          // Image.asset(
          //   MyImages.loadingWhiteGif,
          //   height: 40.0,
          // ),
          widgetSpacerHorizontally(),
          Text(
            "Please Wait...",
            style: Get.theme.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
