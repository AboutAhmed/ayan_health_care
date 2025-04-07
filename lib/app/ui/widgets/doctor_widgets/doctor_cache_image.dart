import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DoctorCacheImage extends StatelessWidget {
  final double? height, width;
  final String? path;
  final bool? isVideo;
  final String? placeHolder;

  const DoctorCacheImage({super.key, this.height, this.width, this.path, this.placeHolder,  this.isVideo,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: path??"",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
          ),
        ),
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(placeHolder ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(placeHolder??""),
              fit: BoxFit.cover,
            ),
          ),
        ),

      ),
    );
  }
}
