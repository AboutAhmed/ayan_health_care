import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoFound extends StatelessWidget {
  final String message;

  const NoFound({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Get.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
