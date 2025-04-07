import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const FilterWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          8.0,
          4.0,
          8.0,
          4.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1.0,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          type: MaterialType.button,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 12.0,
                  color: AppColors.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
