import 'package:ayan_healthcare/assets/app_theme_info.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_card.dart';

class LabCard extends StatelessWidget {
  final bool? isSelected;
  final String? name, image, discount;

  final VoidCallback? onTap;

  const LabCard(
      {super.key,
      this.isSelected,
      this.name,
      this.image,
      this.onTap,
      this.discount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.56,
      child: GestureDetector(
        onTap: onTap,
        child: CustomCard(
          radius: 12.0,
          color: isSelected! ? Get.theme.primaryColor : Colors.white,
          margin: const EdgeInsets.only(
            top: 4,
            bottom: 6,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (discount != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          AppThemeInfo.borderRadius,
                        ),
                        bottomLeft: Radius.circular(
                          AppThemeInfo.borderRadius,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      "$discount% OFF",
                      style: Get.textTheme.titleSmall?.copyWith(
                        color: AppColors.primaryLight,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 2.0,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected!
                              ? Colors.white
                              : Get.theme.primaryColor,
                          width: 2,
                        ),
                        shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: CachedNetworkImage(
                        imageUrl: image!,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) =>
                            Image.asset("assets/images/hospital.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
