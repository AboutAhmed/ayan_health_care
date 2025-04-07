import 'dart:convert';
import 'dart:io';

import 'package:ayan_healthcare/app/models/file_model.dart';
import 'package:ayan_healthcare/app/models/prescription_model.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHealthRecordController extends GetxController {
  var prescriptions = <Map<String, dynamic>>[].obs;
  var files = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var uploadProgress = 0.0.obs;
  final Preferences preferences = Get.find<Preferences>();

  @override
  void onInit() {
    super.onInit();
    fetchFiles();
    loadUploadedFiles();
  }

  /// Fetch medical records (Prescription or File)
  Future<void> fetchMedicalRecords(String recordType) async {
    isLoading.value = true;
    try {
      final requestBody = {
        "PatientUsername": Constant.patientUsername,
        "RecordType": recordType,
        "MasterUsername": Constant.masterUsername
      };

      Debug.log("📢 Request Body: ${requestBody.toString()}");
      final response = await ApiFetch.getMedicalRecord(requestBody);
      Debug.log("📢 Full API Response: ${response.toString()}");

      if (response != null) {
        if (response is PrescriptionModel) {
          prescriptions
              .assignAll(response.response.map((e) => e.toJson()).toList());
          Debug.log(
              "Successfully loaded prescriptions! Count: ${prescriptions.length}");
        } else if (response is FileModel) {
          List<Map<String, dynamic>> apiFiles =
              response.response.response.map((e) => e.toJson()).toList();
          List<Map<String, dynamic>> combinedFiles = [...files, ...apiFiles];
          files.assignAll(combinedFiles.toSet().toList());

          Debug.log("Successfully loaded files! Count: ${files.length}");
        } else {
          Debug.log(
              "'Response' is not a recognized model! Check API structure.");
        }
      } else {
        Debug.log("API response is null");
      }
    } catch (e) {
      Debug.log("Error fetching medical records: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch prescriptions
  Future<void> fetchPrescriptions() async {
    await fetchMedicalRecords("Prescription");
  }

  /// Fetch uploaded files

  Future<void> fetchFiles() async {
    if (isLoading.value) return;

    isLoading.value = true;
    Debug.log("Fetching files from API...");

    try {
      await fetchMedicalRecords("File");
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> fetchFiles() async {
  //   await fetchMedicalRecords("File");
  // }

  /// Upload a file (image)
  Future<void> uploadFile(File file) async {
    isLoading.value = true;
    Debug.log("Uploading file: ${file.path}");

    String? uploadedPath = await ApiFetch.fileUploading(file, (progress) {
      uploadProgress.value = progress;
    });

    if (uploadedPath != null) {
      Debug.log("File uploaded successfully: $uploadedPath");

      Map<String, dynamic> newFile = {
        "FilePath": uploadedPath.startsWith("http")
            ? uploadedPath
            : "https://instacare.pk/api/documents/savetocloud?$uploadedPath",
        "FileName": "Uploaded File",
        "UploadedAt": DateTime.now().toString()
      };
      files.insert(0, newFile);
      files.refresh();
      saveUploadedFiles();
      Debug.log("File added, refreshing UI...");
      await Future.delayed(const Duration(seconds: 2));
      await fetchFiles();

      Get.snackbar("Upload Successful", "File uploaded!",
          backgroundColor: Colors.green);
    } else {
      Debug.log("File upload failed!");
      Get.snackbar("Upload Failed", "Something went wrong!",
          backgroundColor: Colors.red);
    }

    isLoading.value = false;
  }

  /// Save uploaded files in local storage
  Future<void> saveUploadedFiles() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedFiles = files.map((file) => jsonEncode(file)).toList();
    await prefs.setStringList("uploaded_files", savedFiles);
    Debug.log("Saved uploaded files to preferences.");
  }

  /// Load uploaded files from local storage
  Future<void> loadUploadedFiles() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedFiles = prefs.getStringList("uploaded_files");

    if (savedFiles != null) {
      List<Map<String, dynamic>> decodedFiles = savedFiles
          .map((file) => jsonDecode(file) as Map<String, dynamic>)
          .toList();

      files.assignAll(decodedFiles);
      Debug.log("Loaded ${files.length} files from preferences.");
    }
  }
}
