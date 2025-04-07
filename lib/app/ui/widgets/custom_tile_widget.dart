import 'package:flutter/material.dart';

class CustomTileWidget extends StatelessWidget {
  final String titleNo, title;
  final Widget child;

  const CustomTileWidget({
    super.key,
    required this.titleNo,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
            text: "$titleNo- ",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 12.0,
            ),
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
      ),
      subtitle: child,
    );
  }
}
