import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/app_theme_info.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

class YouTubeCardShimmer extends StatelessWidget {
  const YouTubeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 18 / 9.6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return CustomCard(
            margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: Container(
              width: Get.width * .60,
              height: Get.height * .100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppThemeInfo.borderRadius))),
              child: Shimmer.fromColors(
                baseColor: AppColors.shimmerBaseColor,
                highlightColor: AppColors.shimmerHighlightColor,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 18 / 8.5,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                    AppThemeInfo.borderRadius))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 15,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
