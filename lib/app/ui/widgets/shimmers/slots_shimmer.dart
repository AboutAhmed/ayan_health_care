import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SlotsShimmer extends StatelessWidget {
  const SlotsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: AppColors.shimmerHighlightColor,
      baseColor: AppColors.shimmerBaseColor,
      child: Column(
        children: [
          ListTile(
            leading: Container(
              height: 26.0,
              width: 26.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.lightBorderColor),
                shape: BoxShape.circle,
              ),
            ),
            title: Row(
              children: [
                Container(
                  height: 16.0,
                  width: Get.width * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.lightBorderColor),
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: Get.height / 320,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 6.0,
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              children: List.generate(
                3,
                (index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.lightBorderColor),
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                ),
              )
              // [
              //   Container(
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: MyColors.lightBorderColor),
              //         borderRadius: BorderRadius.circular(4)),
              //   ),
              //   Container(
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: MyColors.lightBorderColor),
              //         borderRadius: BorderRadius.circular(4)),
              //   ),
              //   Container(
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: MyColors.lightBorderColor),
              //         borderRadius: BorderRadius.circular(4)),
              //   ),
              // ],
              ),
        ],
      ),
    );
  }
}
