import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class FeeRate extends StatelessWidget {
  final String? title;
  final double rating;
  final ValueChanged<double> onRatingUpdate;

  const FeeRate({
    super.key,
    this.title,
    required this.rating,
    required this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          itemCount: 5,
          itemPadding: const EdgeInsets.only(
            right: 8,
            top: 8,
            bottom: 8,
          ),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: onRatingUpdate,
        ),
        if (title != null)
          Center(
            child: Text(
              title!,
              style: Get.theme.textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
      ],
    );
  }
}
