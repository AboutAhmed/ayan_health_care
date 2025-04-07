import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class ToolsWidget extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? backColor;

  const ToolsWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.border,
    this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: MyTextStyle.height100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: border,
                color: backColor ??
                    const Color(0xffB8E3FF).withOpacity(
                      0.4,
                    ),
              ),
              child: SvgPicture.asset(
                icon,
                height: 28,
                width: 28,
              ),
            ),
            widgetSpacerVertically(),
            Text(
              title,
              style: Get.theme.textTheme.bodySmall?.copyWith(
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
