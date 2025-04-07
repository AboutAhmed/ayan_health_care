import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../assets/styles/my_colors.dart';

class UploadPrescriptionCard extends StatelessWidget {
  final VoidCallback onTap;

  const UploadPrescriptionCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            12.0,
          ),
        ),
        color: AppColors.primaryColor,
      ),
      child: ListTile(
        leading: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
        title: Text(
          "Upload prescription",
          style: Get.textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: SvgPicture.asset(
          "assets/icons/prescription.svg",
          height: 28,
          width: 28,
        ),
        onTap: onTap,
      ),
    );
  }
}
