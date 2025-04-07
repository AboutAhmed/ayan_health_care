import 'package:ayan_healthcare/assets/app_theme_info.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

import '../custom_card.dart';

class LabsShimmer extends StatelessWidget {
  const LabsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.5,
      child: CustomCard(
        margin: const EdgeInsets.only(
          top: 8.0,
          bottom: 6.0,
        ),
        child: Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(AppThemeInfo.borderRadius),
                            bottomLeft:
                                Radius.circular(AppThemeInfo.borderRadius))),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(MyTextStyle.height30),
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                    width: Get.width * 1 / 3,
                    height: 12.0,
                    color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
