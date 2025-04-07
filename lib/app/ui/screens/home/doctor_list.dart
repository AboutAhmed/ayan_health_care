import 'package:ayan_healthcare/app/controller/home/home_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/screens/home/doctor_card.dart';
import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() {
      final doctorList =
          controller.doctorListModel.value.response?.response?.doctorList;

      if (doctorList == null || doctorList.isEmpty) {
        return const Center(child: Text("No doctors available"));
      }

      return SizedBox(
        height: 175,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: doctorList.length > 4
              ? 4
              : doctorList.length, // Show only 4 doctors
          itemBuilder: (context, index) {
            final doctor = doctorList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // Rounded corners
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.viewDoctor,
                        arguments: doctor.username);
                  },
                  child: DoctorCard(
                    imagePath: MyImages.imageNotFound,
                    // imagePath: doctor.profilePicture ?? MyImages.imageNotFound,
                    name: doctor.name ?? 'Unknown',
                    subtitle: doctor.specialityName ?? 'No specialty',
                    fee: "${doctor.fee ?? '0'} PKR",
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
