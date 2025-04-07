import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettingController extends GetxController {
  var imagePath = ''.obs; // Observable to hold the image path
  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from the camera
  Future<void> cameraTap() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path; // Update the image path
    }
  }

  // Method to pick an image from the gallery
  Future<void> galleryTap() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path; // Update the image path
    }
  }

  // Method to remove the photo
  void removePhoto() {
    imagePath.value = ''; // Clear the image path
  }
}