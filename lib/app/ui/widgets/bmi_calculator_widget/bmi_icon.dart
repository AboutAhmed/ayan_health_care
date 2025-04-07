import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const CustomIcon({
    super.key,
    required this.icon,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
          color: selected ? Colors.white : Colors.black,
        ),
        const SizedBox(height: 15.0),
        Text(
          label,
          style: Get.theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
