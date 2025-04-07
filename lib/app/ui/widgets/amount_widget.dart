import 'package:flutter/material.dart';

class AmountWidget extends StatelessWidget {
  final String amount;
  final double? size;
  final Color? color;

  const AmountWidget({super.key, required this.amount, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$amount ",
        style: TextStyle(
          color: color ?? Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: size ?? 16,
        ),
        children: const [
          TextSpan(
            text: "PKR",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
