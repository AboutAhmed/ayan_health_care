import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class PrescriptionShimmer extends StatelessWidget {
  const PrescriptionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: AppColors.shimmerHighlightColor,
      baseColor: AppColors.shimmerBaseColor,
      child: ListView.builder(
        itemBuilder: (_, __) => ListTile(
          title: Container(
            height: 14,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
          ),
          subtitle: Container(
            height: 12,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
          ),
          leading: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
          ),
        ),
        itemCount: 3,
      ),
    );
  }
}
