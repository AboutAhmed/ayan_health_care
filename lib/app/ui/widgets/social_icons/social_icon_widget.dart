import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIconWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final IconData icon;

  const SocialIconWidget(
      {super.key, this.onPressed, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyTextStyle.height48,
      width: MyTextStyle.height48,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(MyTextStyle.height34)),
      child: FittedBox(
        fit: BoxFit.fill,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: Colors.white,
          iconSize: MyTextStyle.height34,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    super.key,
    required this.icon,
    required this.onTap,
    this.size,
  });

  final String icon;
  final VoidCallback onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size ?? MyTextStyle.height60,
        width: size ?? MyTextStyle.height60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size ?? MyTextStyle.height55),
        ),
        child: Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                size ?? MyTextStyle.height43,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                icon,
                color: AppColors.primaryColor,
              ),
            )),
      ),
    );
  }
}
