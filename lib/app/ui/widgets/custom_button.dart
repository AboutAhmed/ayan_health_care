import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final bool isLoading;

  const BaseButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.height = 47,
    this.width = double.infinity,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: regularText.copyWith(color: textColor),
                ),
        ),
      ),
    );
  }
}

class CustomButton extends BaseButton {
  const CustomButton({
    super.key,
    required super.text,
    required super.onPressed,
    super.color,
    super.textColor,
    super.height,
    super.width,
    super.isLoading,
  });
}

class CheckButton extends BaseButton {
  const CheckButton({
    super.key,
    required super.text,
    required super.onPressed,
    super.color,
    super.textColor,
    super.height = 40,
    super.width = 200,
    super.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text,
                  style: regularText,
                ),
        ),
      ),
    );
  }
}
