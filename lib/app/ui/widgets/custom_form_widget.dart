import 'package:flutter/material.dart';

import 'custom_card.dart';


class CustomFormWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomFormWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              12.0,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                // color: Colors.grey,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
