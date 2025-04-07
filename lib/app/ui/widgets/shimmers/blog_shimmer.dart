import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BlogShimmer extends StatelessWidget {
  const BlogShimmer({super.key});

  Widget _shimmerContainer(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(
            12.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: AppColors.shimmerHighlightColor,
      baseColor: AppColors.shimmerBaseColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          12.0,
          10.0,
          12.0,
          12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: _shimmerContainer(60.0, 100.0),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerContainer(14.0, Get.width),
                  const SizedBox(
                    height: 6.0,
                  ),
                  _shimmerContainer(14.0, Get.width),
                ],
              ),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6.0,
                  ),
                  _shimmerContainer(12.0, Get.width * 0.25),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _shimmerContainer(12.0, Get.width),
                const SizedBox(
                  height: 6.0,
                ),
                _shimmerContainer(12.0, Get.width),
                const SizedBox(
                  height: 6.0,
                ),
                _shimmerContainer(12.0, Get.width),
                const SizedBox(
                  height: 6.0,
                ),
                _shimmerContainer(12.0, Get.width),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
