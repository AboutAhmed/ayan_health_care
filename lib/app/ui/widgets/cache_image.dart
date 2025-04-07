import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImageWidget extends StatelessWidget {
  final double height, width;
  final String? path;
  final EdgeInsetsGeometry? padding;
  final bool isHealthTip;

  const CacheImageWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.path,
      this.padding,
      this.isHealthTip = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(8),
      child: CachedNetworkImage(
        imageUrl: path ?? "",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
        placeholder: (_, __) {
          if (isHealthTip) {
            return const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return Image.asset(
            MyImages.file,
            color: Colors.grey,
          );
        },
        errorWidget: (_, __, ___) => const Icon(
          Icons.error,
          color: Colors.grey,
        ),
      ),
    );
  }
}
