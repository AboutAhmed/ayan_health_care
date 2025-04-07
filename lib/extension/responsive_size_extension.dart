import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get _mediaQueryData => MediaQuery.of(this);

  double get height => _mediaQueryData.size.height;
  double get width => _mediaQueryData.size.width;

  double responsiveHeight(double percentage) => height * percentage / 100;
  double responsiveWidth(double percentage) => width * percentage / 100;
}
