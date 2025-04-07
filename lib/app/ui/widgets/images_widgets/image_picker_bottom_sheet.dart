import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tools_widget.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final VoidCallback? onCameraTap;
  final VoidCallback? onGalleryTap;
  final VoidCallback? viewPhoto;
  final VoidCallback? removePhoto;
  final bool? isShow;
  final String? title;

  const ImagePickerBottomSheet({
    super.key,
    this.onCameraTap,
    this.onGalleryTap,
    this.isShow,
    this.viewPhoto,
    this.removePhoto,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              8.0,
            ),
            topRight: Radius.circular(
              8.0,
            ),
          ),
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Container(
            height: 4.0,
            width: 38.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 16.0,
                    ),
                    child: Text(
                      title ?? 'Choose Action',
                      style: Get.theme.textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              if (isShow == true)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                        top: 8.0,
                      ),
                      child: IconButton(
                        onPressed: removePhoto,
                        color: Colors.grey,
                        tooltip: "Remove photo",
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          GridView.count(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 1.0,
            // childAspectRatio: Get.height / 450,
            children: [
              if (isShow == true)
                ToolsWidget(
                  title: 'View Profile',
                  icon: 'assets/icons/view_picture.svg',
                  backColor: Colors.transparent,
                  border: Border.all(
                    width: 0.3,
                    color: Colors.grey,
                  ),
                  onTap: viewPhoto,
                ),
              ToolsWidget(
                title: 'Camera',
                icon: 'assets/icons/on_camera.svg',
                backColor: Colors.transparent,
                border: Border.all(
                  width: 0.3,
                  color: Colors.grey,
                ),
                onTap: onCameraTap,
              ),
              ToolsWidget(
                title: 'Gallery',
                icon: 'assets/icons/on_gallery.svg',
                backColor: Colors.transparent,
                border: Border.all(
                  width: 0.3,
                  color: Colors.grey,
                ),
                onTap: onGalleryTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
