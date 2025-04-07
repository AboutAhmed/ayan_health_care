import 'package:ayan_healthcare/app/models/doctot_list_model.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorListCard extends StatelessWidget {
  final DoctorList doctorModel;

  const DoctorListCard({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: (doctorModel.profilePicture?.isNotEmpty == true)
                      ? Image.network(
                          doctorModel.profilePicture!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              MyImages.imageNotFound,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          MyImages.imageNotFound,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 8), // Space between image and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctorModel.name ?? S.of(context).unknown,
                          style: regularText),
                      Text(
                        doctorModel.specialityName ?? S.of(context).unknown_specialty,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: smallText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            1.kH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoColumn(
                    S.of(context).fee,
                    doctorModel.fee != null
                        ? '${doctorModel.fee} PKR'
                        : 'N/A'),
                _buildInfoColumn(
                    S.of(context).experience,
                    doctorModel.workingSince != null
                        ? _calculateExperience(doctorModel.workingSince!)
                        : 'N/A'),
                // Uncomment and implement wait time if needed
                // _buildInfoColumn(S.of(context).wait_time, 'N/A'),
              ],
            ),
            const SizedBox(height: 8), // Space between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  S.of(context).view_profile,
                  onTap: () {
                    Get.toNamed(AppRoutes.viewDoctor, arguments: doctorModel.username);
                  },
                  color: AppColors.whiteColor,
                  textColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                ),
                4.kW,
                _buildActionButton(
                  S.of(context).book_appointment,
                  onTap: () {
                    Get.toNamed(AppRoutes.bookAppointment, arguments: doctorModel);
                  },
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(title, style: subTitles),
          Text(value, style: smallText),
        ],
      ),
    );
  }

  // Helper method to build action buttons
  Widget _buildActionButton(String label,
      {VoidCallback? onTap,
      Color? color,
      Color? textColor,
      Color? borderColor}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: color ?? AppColors.whiteColor, // Default color if none provided
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  color: textColor ?? Colors.black), // Default text color
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to calculate experience in years and months
  String _calculateExperience(String workingSince) {
    try {
      final DateFormat formatter = DateFormat('MM/dd/yyyy HH:mm:ss');
      final DateTime startDate = formatter.parse(workingSince);
      final DateTime currentDate = DateTime.now();

      final int totalMonths = (currentDate.year - startDate.year) * 12 +
          currentDate.month -
          startDate.month;

      final int years = totalMonths ~/ 12;
      final int months = totalMonths % 12;

      return '$years ${S.of(Get.context!).years} $months ${S.of(Get.context!).months}'; // Use localization for years and months
    } catch (e) {
      return 'N/A';
    }
  }
}
