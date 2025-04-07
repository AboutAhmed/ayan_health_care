
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderInvoiceWidget extends StatelessWidget {
  final String? label, status;
  final TextStyle? style;

  const OrderInvoiceWidget({super.key, this.label, this.status, this.style});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label!,
          style: Get.theme.textTheme.titleMedium!.copyWith(fontSize: 14),
        ),
        Text(status!, style: style ?? Get.theme.textTheme.titleMedium!.copyWith(fontSize: 14)),
      ],
    );
  }
}
