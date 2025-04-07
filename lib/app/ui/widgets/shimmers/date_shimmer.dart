import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../assets/styles/text_styles/text_styles.dart';

class DateShimmer extends StatelessWidget {
  const DateShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: MyTextStyle.width58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
      ),
    );
  }
}
