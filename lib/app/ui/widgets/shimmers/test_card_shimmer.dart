import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

class TestCardShimmer extends StatelessWidget {
  const TestCardShimmer({super.key});

  Widget _buildContainer(double height, double width) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(
        12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(),
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.symmetric(
        vertical: 4 / 2,
        horizontal: 4 / 2,
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: ClipOval(
                        child: _buildContainer(
                          MyTextStyle.height40,
                          MyTextStyle.height40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    _buildContainer(
                      14.0,
                      Get.width / 2,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    _buildContainer(
                      10.0,
                      Get.width / 4,
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildContainer(
                          14.0,
                          MyTextStyle.width40,
                        ),
                        _buildContainer(
                          14.0,
                          MyTextStyle.width40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    _buildContainer(
                      12.0,
                      MyTextStyle.width40,
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    _buildContainer(
                      MyTextStyle.height40,
                      Get.width / 2,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
