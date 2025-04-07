import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key, this.margin});

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width / 3,
                      height: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: Get.width / 2,
                      height: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
