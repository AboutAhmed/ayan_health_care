import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});


  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.0,
      color: Colors.grey.withOpacity(0.5),
    );
  }
}
