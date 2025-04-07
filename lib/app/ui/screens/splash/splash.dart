import 'package:ayan_healthcare/app/controller/splash_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashController controller = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    // The controller will handle navigation
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          // Centered content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  "assets/logo/ayan_logo.png",
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(height: 20), // Space between logo and text
              ],
            ),
          ),
          // Positioned version text at the bottom
          const Positioned(
            bottom: 10, // 10 pixels from the bottom
            left: 0,
            right: 0,
            child: Text(
              "Version 1.0.0", // Replace with your version
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors
                    .textSecondary, // Use a color that fits your design
              ),
            ),
          ),
        ],
      ),
    );
  }
}
