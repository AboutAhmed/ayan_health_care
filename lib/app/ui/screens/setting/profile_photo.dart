import 'dart:io';

import 'package:ayan_healthcare/app/controller/setting/profile_setting.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayan_healthcare/generated/l10n.dart'; // Import your localization file

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a controller to manage the image path
    final ProfileSettingController controller =
        Get.find<ProfileSettingController>();

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          margin: const EdgeInsets.only(
            top: 8.0,
            bottom: 16.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.3,
              color: Colors.white,
            ),
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(80.0),
            ),
            child: Obx(() {
              // Display the selected image or a placeholder
              return controller.imagePath.value.isNotEmpty
                  ? Image.file(
                      File(controller.imagePath.value),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      MyImages.user,
                      fit: BoxFit.cover,
                    );
            }),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 0,
          child: GestureDetector(
            onTap: () {
              _showImagePickerOptions(controller);
            },
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 22.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showImagePickerOptions(ProfileSettingController controller) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(color: AppColors.whiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(Get.context!).profile_photo, // Use localization
              style: Get.textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text(S.of(Get.context!).camera), // Use localization
              onTap: () {
                controller.cameraTap();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: Text(S.of(Get.context!).gallery), // Use localization
              onTap: () {
                controller.galleryTap();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: Text(S.of(Get.context!).remove_photo), // Use localization
              onTap: () {
                controller.removePhoto();
                Get.back();
              },
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () => Get.back(),
              child: Text(S.of(Get.context!).cancel), // Use localization
            ),
          ],
        ),
      ),
    );
  }
}
