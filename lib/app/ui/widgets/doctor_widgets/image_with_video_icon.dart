import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../assets/styles/text_styles/text_styles.dart';

class ImageWithVideoIcon extends StatelessWidget {
  final String? imagePath;
  final bool isVideo;
  final double width, height;
  final double? videoIconTop, videoIconRight;

  const ImageWithVideoIcon({
    super.key,
    this.imagePath,
    this.isVideo = false,
    required this.width,
    required this.height,
    this.videoIconRight,
    this.videoIconTop,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          height: height,
          width: width,
          imageUrl: GetUtils.isNullOrBlank(imagePath)!
              ? "Keys.imageNotFound"
              : imagePath!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage(MyImages.imageNotFound),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
          ),
          placeholder: (_, __) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage(MyImages.imageNotFound),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
          ),
        ),
        if (isVideo)
          Positioned(
            top: videoIconTop ?? 0.0,
            right: videoIconRight ?? 0.0,
            height: 16,
            width: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: BorderRadius.circular(MyTextStyle.height30),
                border: Border.all(color: Colors.white),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.3)),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.videocam_rounded,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
