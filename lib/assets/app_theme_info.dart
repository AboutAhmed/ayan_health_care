import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeInfo {
  static double get borderRadius => 16.0;

  // ThemeData to hold all the theme configurations
  static ThemeData get themeData {
    // Defining the primary color as a MaterialColor
    var primaryColor = const MaterialColor(0xFF004238, {
      50: Color(0xff77b3b1), // Lightest shade (for emphasis on hover/focus)
      100: Color(0xff66a59f), // Light shade
      200: Color(0xff548e8a), // Light-medium shade
      300: Color(0xff437673), // Medium shade
      400: Color(0xff325c5d), // Darker shade (for disabled or inactive buttons)
      500: Color(0xFF004238), // Your primary color (dark green)
      600: Color(
          0xff003530), // Darker shade (used in focused state or selected items)
      700: Color(
          0xff002a28), // Even darker shade (used in certain states like pressed buttons)
      800: Color(
          0xff001f1f), // Very dark shade (for shadows or certain UI elements)
      900: Color(0xff001616), // Darkest shade (for deep background elements)
    });

    // Base theme with custom settings for different components
    var baseTheme = ThemeData(
      scaffoldBackgroundColor:
          Colors.white, // Set background color for the scaffold
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        filled: false,
        fillColor: AppColors.fillColor, // Input field background color
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 12,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppThemeInfo.borderRadius),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 0, // Cards with no elevation (flat)
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false, // Title alignment
        elevation: 0.0, // No shadow under AppBar

        // backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppColors.primaryColor, // Background color for ElevatedButton
          foregroundColor: AppColors.whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.textPrimary, // Text color for TextButton
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppThemeInfo.borderRadius),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor, // Background color for FAB
        elevation: 2,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.bgColor, // Text color for OutlinedButton
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          side: const BorderSide(color: AppColors.bgColor), // Border color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.textPrimary, // Cursor color for text input
        selectionHandleColor: AppColors.primaryColor, // Selection handle color
        selectionColor: AppColors.primaryColor
            .withOpacity(0.5), // Selection highlight color
      ),
      tabBarTheme: const TabBarTheme(
        labelStyle: TextStyle(fontSize: 16.0), // Tab label style
        unselectedLabelStyle:
            TextStyle(fontSize: 16.0), // Unselected tab label style
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppThemeInfo.borderRadius),
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.transparent, // Transparent color for BottomAppBar
        elevation: 0,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null; // Disabled state color (default)
          }
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor; // Selected state color
          }
          return null; // Default state color
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null; // Disabled state color
          }
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor; // Selected state color
          }
          return null; // Default state color
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null; // Disabled state color
          }
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor; // Selected state color
          }
          return null; // Default state color
        }),
        trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return null; // Disabled state color
          }
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor; // Selected state color
          }
          return null; // Default state color
        }),
      ),
      primaryColor: primaryColor, // Primary color for the app
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primaryColor, // Custom primary swatch
        accentColor: AppColors.subColorFill, // Accent color for your app
        backgroundColor: Colors.white, // Background color
      ),
      useMaterial3: false, // Use Material 3 (set to false for Material 2)
    );

    // Applying Google Fonts to the text theme globally
    return baseTheme.copyWith(
      textTheme: GoogleFonts.openSansTextTheme(baseTheme.textTheme),
    );
  }
}
