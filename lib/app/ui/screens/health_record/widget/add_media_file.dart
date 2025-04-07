import 'dart:io';
import 'package:ayan_healthcare/app/controller/media/media_file_controller.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_button.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart'; // Add this package for full-screen image view

class AddMediaScreen extends StatelessWidget {
  const AddMediaScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final MediaController mediaController = Get.put(MediaController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text("Add Media File"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomCard(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onTap: () => _getImage(
                                  ImageSource.camera, mediaController),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                    color: AppColors.primaryColor,
                                  ),
                                  SizedBox(height: size.height * 0.005),
                                  const Text("From Camera"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      4.kW,
                      Expanded(
                        child: CustomCard(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onTap: () => _getImage(
                                  ImageSource.gallery, mediaController),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.drive_folder_upload_outlined,
                                    color: AppColors.primaryColor,
                                    size: 30,
                                  ),
                                  SizedBox(height: size.height * 0.005),
                                  const Text("From Files"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  4.kH,
                  Container(
                    height: size.height * 0.14,
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          mediaController.selectedImages.length,
                          (index) => Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigate to PhotoView screen
                                  Get.to(
                                    () => PhotoViewScreen(
                                      imageFile:
                                          mediaController.selectedImages[index],
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.bgColor, width: 2),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Image.file(
                                    mediaController.selectedImages[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    mediaController.selectedImages
                                        .removeAt(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.lightBorderColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned Save Button 10 units above the bottom
            Positioned(
              bottom: 10, // 10 units above the bottom
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    text: "Save",
                    onPressed: () {
                      // Add your save functionality here
                    },
                  ),
                ),
              ),
            ),
            Obx(
              () => mediaController.isUploading.value
                  ? Container(
                      color: Colors.black54, // Slightly darkened background
                      child: const Center(
                        child: CupertinoActivityIndicator(
                          color: AppColors.darkBorderColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  void _getImage(ImageSource source, MediaController mediaController) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      mediaController.selectedImages.add(File(pickedFile.path));
    }
  }
}

// PhotoView Screen
class PhotoViewScreen extends StatelessWidget {
  final File imageFile;

  const PhotoViewScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: const Text("Photo View"),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: FileImage(imageFile),
        ),
      ),
    );
  }
}
