import 'package:flutter/material.dart';

class PKRWidget extends StatelessWidget {
  final String? amount;
  final TextStyle? style;
  final TextAlign? align;

  /// Set to true when you want to show minus sign with amount.
  final bool isRemove;

  const PKRWidget({
    super.key,
    required this.amount,
    this.style,
    this.align,
    this.isRemove = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${isRemove ? "-" : ""}Rs. ${amount.toString()}',
      textAlign: align,
      style: style,
    );
  }
}
