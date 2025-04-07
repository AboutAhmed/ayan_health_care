import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';

class MyDecorations {
  static BoxDecoration dropdownDecoration = BoxDecoration(
      border: Border.all(width: 1.0, color: Colors.grey),
      borderRadius: const BorderRadius.all(Radius.circular(4)));

  static BoxDecoration textFieldRadius = BoxDecoration(
      color: AppColors.fillColor, borderRadius: BorderRadius.circular(30.0));
}
