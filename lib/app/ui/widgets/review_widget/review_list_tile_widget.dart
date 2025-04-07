import 'package:ayan_healthcare/app/ui/widgets/images_widgets/simple_cache_image.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewListTileWidget extends StatelessWidget {
  final String? name, treatment, review, image;
  final double? rating;

  const ReviewListTileWidget(
      {super.key,
      required this.name,
      this.image,
      required this.treatment,
      this.review,
      this.rating});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SimpleCacheImage(
        height: 40.0,
        width: 40.0,
        firstLatter: name!,
        imagePath: image,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: mainTitles,
          ),
          const SizedBox(
            height: 3.0,
          ),
          if (rating != null)
            RatingBar.builder(
              initialRating: rating ?? 0.0,
              itemSize: 12,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              unratedColor: AppColors.subColor.withOpacity(0.4),
              itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {},
            ),
          const SizedBox(
            height: 3.0,
          ),
          if (review != null)
            Text(
              review!,
              textAlign: TextAlign.justify,
              style: smallText,
            )
        ],
      ),
    );
  }
}
