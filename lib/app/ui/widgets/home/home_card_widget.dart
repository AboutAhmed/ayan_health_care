import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../assets/app_theme_info.dart';
import '../custom_card.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.assetPath,
  });

  final VoidCallback onTap;
  final String title;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomCard(
        onPressed: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  AppThemeInfo.borderRadius,
                ),
              ),
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              child: Text(
                title,
                style: Get.theme.textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
