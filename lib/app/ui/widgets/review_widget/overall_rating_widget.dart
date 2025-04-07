import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class OverAllRatingWidget extends StatelessWidget {
  final String? rattingAvg;
  final int? numberOfReviews;
  final List<int>? rattingProgress;

  const OverAllRatingWidget(
      {super.key, this.rattingAvg, this.numberOfReviews, this.rattingProgress});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MyTextStyle.height80,
          padding: const EdgeInsets.only(
            top: 6.0,
            left: 4 + 6.0,
            right: 4 + 6.0,
            bottom: (4 + 6.0) / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(
                0.3,
              ),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              Text(
                "${rattingAvg?.length}",
                style: Get.theme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.star,
                size: MyTextStyle.height30,
                color: AppColors.subColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${numberOfReviews.toString()} Reviews",
                style: Get.theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 12,
                ),
                softWrap: false,
              )
            ],
          ),
        ),
        widgetSpacerHorizontally(),
        Expanded(
          child: Column(
            children: [
              LinearPercentIndicator(
                progressColor: AppColors.primaryLight,
                percent: (rattingProgress![0]) * (rattingProgress![1] / 100),
                leading: const Text('5'),
                lineHeight: 10.0,
                barRadius: const Radius.circular(5),
              ),
              const SizedBox(
                height: 4,
              ),
              LinearPercentIndicator(
                progressColor: AppColors.primaryLight,
                percent: 0.8,
                leading: const Text('4'),
                lineHeight: 10.0,
                barRadius: const Radius.circular(5),
              ),
              const SizedBox(
                height: 4,
              ),
              LinearPercentIndicator(
                progressColor: AppColors.primaryLight,
                percent: 0.6,
                leading: const Text('3'),
                lineHeight: 10,
                barRadius: const Radius.circular(5),
              ),
              const SizedBox(
                height: 4,
              ),
              LinearPercentIndicator(
                progressColor: AppColors.primaryLight,
                percent: 0.4,
                leading: const Text('2'),
                lineHeight: 10.0,
                barRadius: const Radius.circular(5),
              ),
              const SizedBox(
                height: 4,
              ),
              LinearPercentIndicator(
                progressColor: AppColors.primaryLight,
                percent: 0.2,
                leading: const Text('1'),
                lineHeight: 10.0,
                barRadius: const Radius.circular(5),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// class OverAllRatingListTileWidget extends StatelessWidget {
//   final String? title;
//   final double? rating;
//
//   const OverAllRatingListTileWidget({Key? key, this.title, this.rating}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title!, style: Get.theme.textTheme.subtitle2!.copyWith(fontWeight:FontWeight.w700, fontSize: 12),),
//         RatingWithTrailing(rating: rating,),
//       ],);
//   }
// }
