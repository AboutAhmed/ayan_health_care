import 'package:ayan_healthcare/app/models/doctor_profile_model.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:ayan_healthcare/helper/toaster.dart';
import 'package:get/get.dart';

class DoctorProfileController extends GetxController {
  var doctors =
      <ResponseResponse>[].obs; // Define doctors as an observable list
  var searchQuery = ''.obs;

  Future<void> fetchDoctorProfile(String doctorUsername) async {
    try {
      DoctorProfileModel? doctorModelResponse = await ApiFetch.getDoctorProfile(
        {
          'MasterUsername': Constant.masterUsername,
          'DoctorUsername': doctorUsername,
        },
      );

      if (doctorModelResponse != null &&
          doctorModelResponse.meta.status == "200") {
        // Assuming doctorModelResponse.response.response is a single doctor profile
        doctors.clear(); // Clear previous data if needed
        doctors.add(doctorModelResponse
            .response.response); // Add the fetched doctor profile
      } else {
        // Handle error: You can show a message to the user
        Toaster.showToast("Error, ${doctorModelResponse?.meta.message}");
      }
    } catch (e) {
      // Handle exception: You can show a message to the user
      Toaster.showToast("Error: ${e.toString()}");
    }
  }
}
