import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleWidgetSmall extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const TitleWidgetSmall({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: Colors.grey.shade800),
        ),
        if (onTap != null)
          GestureDetector(
              onTap: onTap,
              child: Text(
                "View All",
                style: Get.theme.textTheme.titleSmall!.copyWith(
                  color: AppColors.primaryColor,
                ),
              )),
      ],
    );
  }
}
