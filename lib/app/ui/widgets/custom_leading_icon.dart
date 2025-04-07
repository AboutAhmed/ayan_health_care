import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../assets/styles/my_colors.dart';

class CustomLeadingIcon extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? fontWeight;

  const CustomLeadingIcon({
    super.key,
    required this.title,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double avatarSize = constraints.maxWidth * 0.12;
        return SizedBox(
          width: avatarSize,
          height: avatarSize,
          child: CircleAvatar(
            backgroundColor: color ?? AppColors.primaryColor,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  getInitials(title),
                  style:
                      Get.textTheme.titleSmall!.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String getInitials(String title) {
    List<String> words = title.split(" ");
    String initials = '';

    int count = 0;
    for (var word in words) {
      if (word.isNotEmpty && count < 2) {
        initials += word[0].toUpperCase();
        count++;
      }
    }

    return initials;
  }
}
