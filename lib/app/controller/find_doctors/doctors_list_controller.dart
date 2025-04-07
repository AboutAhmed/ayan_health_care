import 'package:ayan_healthcare/app/models/doctot_list_model.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:get/get.dart';

class FindDoctorController extends GetxController {
  var doctors = <DoctorList>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchDoctorsList() async {
    try {
      DoctotListModel? doctorModelResponse = await ApiFetch.doctorsList(
        {'MasterUsername': Constant.masterUsername},
      );

      if (doctorModelResponse != null &&
          doctorModelResponse.meta?.status == "200") {
        doctors.value =
            doctorModelResponse.response?.response?.doctorList ?? [];
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle exception
    }
  }

  List<DoctorList> get filteredDoctors {
    if (searchQuery.value.isEmpty) {
      return doctors;
    } else {
      return doctors
          .where((doctor) =>
              (doctor.name != null &&
                  doctor.name!
                      .toLowerCase()
                      .contains(searchQuery.value.toLowerCase())) ||
              (doctor.specialityName != null &&
                  doctor.specialityName!
                      .toLowerCase()
                      .contains(searchQuery.value.toLowerCase())))
          .toList();
    }
  }
}
