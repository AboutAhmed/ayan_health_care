import 'package:ayan_healthcare/app/ui/widgets/custom_button.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';

class BookingSuccess extends StatelessWidget {
  const BookingSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Success Image
                Image.asset(
                  'assets/images/success.png', 
                  height: 120,
                  width: 120,
                ),

                // Heading Text
                6.kH,
                const Text(
                  "Appointment Placed Successfully!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor, // Adjust color as needed
                  ),
                  textAlign: TextAlign.center,
                ),

                // Hint Text
                const SizedBox(height: 12),
                Text(
                  "You will receive a confirmation \nmessage shortly.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),

                // Custom Button to Navigate to Home
                6.kH,
                CustomButton(
                  text: "Continue ",
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.home);
                  },
                ),
                2.kH,
                // InkWell(
                //     onTap: () {
                //       Get.toNamed(AppRoutes.home)
                //     },
                //     child: Text(
                //       "Continue",
                //       style: mainHeadings,
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
