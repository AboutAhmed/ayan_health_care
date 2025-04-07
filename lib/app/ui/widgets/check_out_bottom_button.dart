import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../assets/styles/my_colors.dart';
import 'custom_card.dart';

class CheckoutBottomButton extends StatelessWidget {
  final int totalItems;
  final int? totalAmount;
  final VoidCallback onTap;

  const CheckoutBottomButton({
    super.key,
    required this.totalItems,
    this.totalAmount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: CustomCard(
        radius: 12.0,
        color: AppColors.primaryLight,
        onPressed: onTap,
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 8,
        ),
        child: ListTile(
          leading: Container(
            width: 25,
            height: 25,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              "$totalItems",
              style: Get.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            "View your cart",
            style: Get.theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          // trailing: PKRWidget(
          //   amount: totalAmount.toString(),
          //   style: Get.theme.textTheme.titleLarge?.copyWith(
          //     color: Colors.white,
          //   ),
          // ),
        ),
      ),
    );
  }
}
