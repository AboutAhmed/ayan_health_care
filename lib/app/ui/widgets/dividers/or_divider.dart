import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Divider(
            height: 0,
            color: AppColors.darkBorderColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MyTextStyle.height30),
          child: Text(
            "OR",
            style: Get.theme.textTheme.bodySmall,
          ),
        ),
        const Expanded(
          flex: 1,
          child: Divider(
            height: 0,
            color: AppColors.darkBorderColor,
          ),
        ),
      ],
    );
  }
}
