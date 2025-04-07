import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFilterChip extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final bool enable;

  const MyFilterChip({
    super.key,
    this.title,
    this.onTap,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    if (enable) {
      return CustomCard(
        radius: 20.0,
        margin: const EdgeInsets.symmetric(
          vertical: 2.0,
        ),
        onPressed: onTap,
        color: Get.theme.primaryColor, // Fill color when enabled
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            8.0,
            6.0,
            8.0,
            6.0,
          ),
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.bodySmall!.copyWith(
              color: Colors.white, // Text color when enabled
            ),
          ),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 3.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        border: Border.all(
          color: Get.theme.focusColor, // Border color when disabled
          width: 1.0,
        ),
      ),
      child: Material(
        color: AppColors.fillColor, // Background color when disabled
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        type: MaterialType.button,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              8.0,
              4.0,
              8.0,
              4.0,
            ),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.titleSmall!.copyWith(
                color: AppColors.textSecondary, // Text color when disabled
              ),
            ),
          ),
        ),
      ),
    );
  }
}
