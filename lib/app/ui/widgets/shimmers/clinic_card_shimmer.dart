import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ClinicCardShimmer extends StatelessWidget {
  const ClinicCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: AppColors.shimmerHighlightColor,
      baseColor: AppColors.shimmerBaseColor,
      child: Container(
        margin: const EdgeInsets.only(
          top: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 24.0,
              ),
              child: _helperWidget(MyTextStyle.height50, 12.0),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.44),
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                title: _helperWidget(MyTextStyle.height50, 12.0),
                subtitle: _helperWidget(MyTextStyle.width80, 12.0),
                leading:
                    _helperWidget(MyTextStyle.width50, MyTextStyle.height50),
                trailing: _helperWidget(MyTextStyle.width40,
                    MyTextStyle.height50 - MyTextStyle.height30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _helperWidget(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
    );
  }
}
