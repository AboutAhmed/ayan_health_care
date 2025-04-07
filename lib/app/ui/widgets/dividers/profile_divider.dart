import 'package:flutter/material.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Divider(
        height: 12.0,
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}
