import 'dart:io';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class MediaController extends GetxController {
  RxList<File> selectedImages = <File>[].obs;
  RxBool isUploading = false.obs;

  Future<String> _compressImage(File image) async {
    // Get the application's documents directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;

    // Decode and compress the image
    final originalImage = img.decodeImage(await image.readAsBytes());
    final compressedImage = img.copyResize(originalImage!, width: 800);
    final compressedPath =
        '$appDocPath/${DateTime.now().millisecondsSinceEpoch}.jpg';
    File(compressedPath).writeAsBytesSync(img.encodeJpg(compressedImage));
    return compressedPath;
  }

  Future<void> selectImages() async {
    for (File image in selectedImages) {
      await _compressImage(image);
    }
  }

  void clearSelectedImages() {
    selectedImages.clear();
  }
}
