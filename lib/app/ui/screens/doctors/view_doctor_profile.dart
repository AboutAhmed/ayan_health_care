import 'package:ayan_healthcare/app/controller/find_doctors/doctor_profile_controller.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewDoctorProfile extends StatelessWidget {
  final String doctorUsername; // Add a field to hold the username

  const ViewDoctorProfile(
      {super.key,
      required this.doctorUsername}); // Constructor to accept the username

  @override
  Widget build(BuildContext context) {
    final DoctorProfileController doctorProfileController =
        Get.put(DoctorProfileController());

    // Fetch the doctor profile when the widget is built
    doctorProfileController.fetchDoctorProfile(doctorUsername);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(doctorProfileController),
          // Pass the controller to the AppBar method
          _buildDoctorDetails(doctorProfileController),
          // Pass the controller to the details method
        ],
      ),
    );
  }

  // Method to build the AppBar with doctor information
  SliverAppBar _buildAppBar(DoctorProfileController doctorProfileController) {
    return SliverAppBar(
      expandedHeight: 180,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.pop(Get.context!),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: AppColors.primaryColor,
          child: Obx(() {
            if (doctorProfileController.doctors.isEmpty) {
              return const Center(
                  child: CircularProgressIndicator()); // Show loading indicator
            } else {
              final doctor = doctorProfileController
                  .doctors.first; // Get the first doctor profile
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: (doctor.profilePicture.isNotEmpty == true)
                          ? Image.network(
                              doctor.profilePicture,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // If the image fails to load, use the default asset image
                                return Image.asset(
                                  MyImages.imageNotFound,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              MyImages.imageNotFound,
                              // Use the default image if the URL is invalid
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      doctor.name, // Use the fetched doctor's name
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1, // Limit to one line
                      overflow: TextOverflow
                          .ellipsis, // Show ellipsis if the text overflows
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor.specialityName,
                      // Use the fetched doctor's specialty
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            }
          }),
        ),
      ),
      pinned: true,
    );
  }

  // Method to build the doctor details section
  SliverList _buildDoctorDetails(
      DoctorProfileController doctorProfileController) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Obx(() {
            if (doctorProfileController.doctors.isEmpty) {
              return const Center(
                  child: CircularProgressIndicator()); // Show loading indicator
            } else {
              final doctor = doctorProfileController
                  .doctors.first; // Get the first doctor profile
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(S.of(context).about), // Use localization
                    const SizedBox(height: 8),
                    Text(
                      doctor.about,
                      // Use the fetched doctor's about information
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    _buildSectionTitle(
                        S.of(context).experience), // Use localization
                    const SizedBox(height: 8),
                    Text(
                      S.of(context).years_of_experience, // Use localization
                    ),
                    const SizedBox(height: 16),
                    _buildSectionTitle(
                        S.of(context).services), // Use localization
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      children: doctor.services
                          .map((service) => _buildServiceChip(service.name))
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    _buildSectionTitle(
                        S.of(context).reviews), // Use localization
                    const SizedBox(height: 8),
                    // You can loop through reviews if available
                    ...doctor.reviews
                        .map((review) => _buildReview(
                            review.name, review['comment'], review['rating']))
                        .toList(),
                  ],
                ),
              );
            }
          });
        },
        childCount: 1,
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  // Helper method to build service chips
  Widget _buildServiceChip(String service) {
    return Chip(
      label: Text(service),
      backgroundColor: AppColors.primaryColor.withOpacity(0.1),
    );
  }

  // Helper method to build review widgets
  Widget _buildReview(String name, String comment, int rating) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(comment),
            const SizedBox(height: 4),
            Row(
              children: List.generate(
                rating,
                (index) => const Icon(Icons.star, color: AppColors.subColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
