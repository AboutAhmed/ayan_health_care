
import 'package:ayan_healthcare/app/ui/widgets/custom_leading_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SimpleCacheImage extends StatelessWidget {
  final double height, width;
  final String? imagePath, firstLatter;

  const SimpleCacheImage({super.key,required this.height,required this.width, this.imagePath, this.firstLatter});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imagePath??'',
      imageBuilder: (context, imageProvider) => Container(decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imageProvider, fit: BoxFit.cover),
          ),),
      errorWidget: (_,__,___)=> CustomLeadingIcon(title: "$firstLatter"),
    );
  }
}
