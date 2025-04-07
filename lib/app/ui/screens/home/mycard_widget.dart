import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  final String? imagePath; // Optional image path
  final IconData? icon; // Optional icon
  final String text; // Text to display
  final double height; // Height of the card
  final double width; // Width of the card
  final Color borderColor; // Border color
  final double elevation; // Elevation for shadow effect
  final VoidCallback? onTap;

  // Constructor
  const MyCardWidget({
    super.key,
    this.imagePath,
    this.icon,
    required this.onTap,
    required this.text,
    this.height = 100.0,
    this.width = 100.0,
    this.borderColor = AppColors.whiteColor, // Default border color
    this.elevation = 4.0, // Default elevation
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: borderColor),
            ),
            child: Material(
              elevation: elevation,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display image if imagePath is provided
                  if (imagePath != null)
                    Image.asset(
                      imagePath!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  // Display icon if icon is provided
                  if (icon != null)
                    ClipOval(
                      child: Container(
                        height: 60,
                        width: 60,
                        color: AppColors.bgColor
                            .withOpacity(0.9), // Set background color
                        child: Icon(
                          icon,
                          size: 20, // Set icon size to 24
                          color:
                              AppColors.primaryColor, // Optional: Set icon color
                        ),
                      ),
                    ),
                  const SizedBox(height: 8), // Space between image/icon and text
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // Space between card and text
        Text(
          text,
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
