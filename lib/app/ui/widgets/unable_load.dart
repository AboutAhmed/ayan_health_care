
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnableLoadData extends StatelessWidget {
  final Function? onPressed;

  const UnableLoadData({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Unable to load",
          style: Get.theme.textTheme.bodyLarge!.copyWith(
            color: Colors.grey,
          ),
        ),
        TextButton(
            onPressed: onPressed as void Function()?,
            child: const Text('Try Again'))
      ],
    );
  }
}
