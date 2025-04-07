import 'package:flutter/material.dart';


class BottomButton extends StatelessWidget {
  final double? pLeft, pRight;
  final String? lable;
  final Function? onPressed;

  const BottomButton(
      {super.key, this.pLeft, this.pRight, this.lable, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.only(
          left: pLeft!,
          right: pRight!,
          bottom: 8.0,
          top: 4,
        ),
        child: ElevatedButton(
          onPressed: onPressed as void Function()?,
          child: Text(lable!),
        ),
      ),
    );
  }
}
