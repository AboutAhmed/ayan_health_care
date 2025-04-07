import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FileCacheImageWidget extends StatelessWidget {
  final String? path;
  final double width, height;
  final BoxFit? boxFit;

  const FileCacheImageWidget(
      {super.key,
      required this.path,
      required this.width,
      required this.height,
      this.boxFit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit ?? BoxFit.cover,
            ),
          ),
        );
      },
      imageUrl: path!,
      width: width,
      height: height,
      errorWidget: (context, url, error) => Container(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          color: Colors.grey.shade100,
        ),
        child: Image.asset(
          MyImages.file,
          color: Colors.grey,
        ),
      ),
      placeholder: (context, url) => Container(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          color: Colors.grey.shade100,
        ),
        child: Image.asset(
          MyImages.file,
          color: Colors.grey,
        ),
      ),
    );
  }
}
