import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String? buttonText;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final bool? subButton;

  const TitleWidget({
    super.key,
    required this.title,
    this.onTap,
    this.padding,
    this.buttonText,
    this.subButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Get.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.black87,
              fontSize: 16.0,
            ),
          ),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: subButton == true
                  ? Container(
                      padding: const EdgeInsets.fromLTRB(
                        6.0,
                        0.0,
                        8.0,
                        0.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          50.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/icons/youtube.svg",
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          const Text(
                            "Subscribe",
                            style: TextStyle(
                              fontSize: 10.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ))
                  : Text(
                      buttonText ?? "View All",
                      style: Get.theme.textTheme.titleSmall!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}
