import 'package:ayan_healthcare/app/ui/widgets/custom_button.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayan_healthcare/app/routes/routes.dart'; // Adjust if necessary
import 'package:ayan_healthcare/assets/styles/my_colors.dart'; // Adjust if necessary

class SignupSuccess extends StatelessWidget {
  const SignupSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Success Image
                Image.asset(
                  'assets/images/success.png', // Make sure to replace with your success image
                  height: 150,
                  width: 150,
                ),

                // Heading Text
                const SizedBox(height: 20),
                Text(
                  s.account_registered,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor, // Adjust color as needed
                  ),
                  textAlign: TextAlign.center,
                ),

                // Hint Text
                const SizedBox(height: 10),
                Text(
                  s.can_login,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),

                // Custom Button to Navigate to Login
                const SizedBox(height: 30),
                CustomButton(
                  text: s.login,
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.rating);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
