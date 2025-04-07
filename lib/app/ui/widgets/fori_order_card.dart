import 'package:flutter/material.dart';
import '../../../assets/styles/my_colors.dart';
import 'custom_card.dart';

class ForiOrderCard extends StatelessWidget {
  final String? stepOne;
  final String? stepTwo;
  final String? stepThree;

  const ForiOrderCard({
    super.key,
    this.stepOne,
    this.stepTwo,
    this.stepThree,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      radius: 12.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.13),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.file_open,
                  color: AppColors.primaryLight,
                ),
              ),
              title: Text(
                stepOne ?? "Upload prescription & add details",
              ),
            ),
            Container(
              height: 40,
              width: 2,
              margin: const EdgeInsets.only(
                left: 40.0,
              ),
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.14),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.phone_callback,
                  color: AppColors.primaryLight,
                ),
              ),
              title: Text(
                stepTwo ?? "Get a confirmation call",
              ),
            ),
            Container(
                height: 40,
                width: 2,
                margin: const EdgeInsets.only(left: 40),
                decoration: const BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.14),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.done,
                  color: AppColors.primaryLight,
                ),
              ),
              title: Text(
                stepThree ?? "Submit your sample & pay in cash.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
