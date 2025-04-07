import 'dart:io';

import 'package:ayan_healthcare/app/controller/healthrecord/health_record_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/app/ui/screens/health_record/widget/image_preview.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/app/ui/widgets/dialogs/loading_progress.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MyHealthRecord extends StatelessWidget {
  const MyHealthRecord({super.key});

  @override
  Widget build(BuildContext context) {
    final MyHealthRecordController controller =
        Get.put(MyHealthRecordController());

    // Fetch prescriptions and files when the screen is initialized
    controller.fetchPrescriptions();
    controller.fetchFiles();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          S.of(context).my_health_record,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: DefaultTabController(
          length: 2, // Number of tabs
          child: Column(
            children: [
              // Custom TabBar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: AppColors.bgColor, // Fill color for selected tab
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                  ),
                  labelColor:
                      AppColors.textPrimary, // Text color for selected tab
                  unselectedLabelColor:
                      Colors.black54, // Text color for unselected tabs
                  tabs: [
                    Tab(
                      text: S.of(context).prescription,
                    ),
                    Tab(
                      text: S.of(context).files,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Space between TabBar and content
              Expanded(
                child: TabBarView(
                  children: [
                    // Content for "Prescriptions" tab
                    _buildPrescriptionsTab(controller),
                    // Content for "Files" tab
                    _buildFilesTab(context, controller),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrescriptionsTab(MyHealthRecordController controller) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.prescriptions.isEmpty) {
        return const Center(
          child: Text(
            "No prescriptions found.",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: controller.prescriptions.length,
        itemBuilder: (BuildContext context, int index) {
          final prescription = controller.prescriptions[index];

          String dateStr = prescription["DateTime"] as String;
          DateTime date = DateFormat("dd MMM yyyy | hh:mm a").parse(dateStr);
          String day = DateFormat("EE").format(date);
          String finalDate = DateFormat("dd-MM-yyyy").format(date);

          return CustomCard(
            onPressed: () {
              Get.toNamed(AppRoutes.billsDetail, arguments: prescription);
            },
            radius: 12.0,
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              title: Text(
                prescription["Title"] as String,
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(prescription["DoctorName"] as String,
                      style: const TextStyle(fontSize: 12.0)),
                  const SizedBox(height: 4.0),
                  Text("$day, $finalDate",
                      style: const TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void _pickImage(
      ImageSource source, MyHealthRecordController controller) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      _uploadImage(file, controller);
    }
  }

  void _uploadImage(File file, MyHealthRecordController controller) async {
    controller.isLoading.value = true;

    String? uploadedPath = await ApiFetch.fileUploading(file, (progress) {
      controller.uploadProgress.value = progress;
    });

    Debug.log("Uploaded File Path: $uploadedPath");

    if (uploadedPath != null) {
      final newFile = {
        "FilePath": uploadedPath.startsWith("http")
            ? uploadedPath
            : "https://instacare.pk/api/documents/savetocloud?$uploadedPath",
        "FileName": "Uploaded File",
        "UploadedAt": DateTime.now().toString()
      };
      controller.files.insert(0, newFile);
      controller.files.refresh();
      await controller.saveUploadedFiles();

      Debug.log("Updated files list: ${controller.files}");

      Get.snackbar("Upload Successful", "File uploaded!",
          backgroundColor: Colors.green);
    } else {
      Debug.log("File upload failed!");
      Get.snackbar("Upload Failed", "Something went wrong!",
          backgroundColor: Colors.red);
    }

    controller.isLoading.value = false;
  }

  Widget _buildFilesTab(
      BuildContext context, MyHealthRecordController controller) {
    return Stack(
      children: [
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Map<String, dynamic>> allFiles = [...controller.files];
          if (allFiles.isEmpty) {
            return const Center(
              child: Text("No files found.",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: allFiles.length,
            itemBuilder: (BuildContext context, int index) {
              final file = allFiles[index];
              final filePath = file["FilePath"];
              final fileName = file["FileName"];

              if (filePath == null || fileName == null) {
                return const SizedBox.shrink();
              }

              return CustomCard(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ImageFullPreview(image: filePath, name: fileName),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: filePath,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const LoadingProgress(),
                    errorWidget: (context, url, error) => Center(
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey.shade100,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                                "assets/images/file_placeholder.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: SpeedDial(
            icon: Icons.add,
            activeIcon: Icons.close,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            activeBackgroundColor: AppColors.primaryColor,
            activeForegroundColor: AppColors.whiteColor,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.image, color: AppColors.whiteColor),
                backgroundColor: AppColors.primaryColor,
                label: "Gallery",
                labelStyle: regularText,
                onTap: () => _pickImage(ImageSource.gallery, controller),
              ),
              SpeedDialChild(
                child:
                    const Icon(Icons.camera_alt, color: AppColors.whiteColor),
                backgroundColor: AppColors.primaryColor,
                label: "Camera",
                labelStyle: regularText,
                onTap: () => _pickImage(ImageSource.camera, controller),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
