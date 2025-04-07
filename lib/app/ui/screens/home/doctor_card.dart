import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String imagePath; // Path to the doctor's image
  final String name; // Doctor's name
  final String subtitle; // Doctor's subtitle
  final String fee; // Doctor's fee

  const DoctorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.fee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.bgColor, // Background color
        border: Border.all(
          color: AppColors.fillColor,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            2.kH,
            ClipOval(
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            1.kH,
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4), // Space between name and subtitle
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
              maxLines: 2, // Limit to 2 lines
              overflow: TextOverflow.ellipsis, // Show ellipsis if overflow
            ),
            const SizedBox(height: 8), // Space between subtitle and fee
            Text(
              "Fee: $fee",
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
