import 'package:flutter/material.dart';

class OrderedInfo extends StatelessWidget {
  final String? label, status;
  final Function? onPressed;

  const OrderedInfo({super.key, this.label, this.status, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              label!,
            ),
          ),
          if (onPressed == null)
            Expanded(
              flex: 1,
              child: Text(
                status ?? "",
              ),
            ),
          if (onPressed != null)
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: onPressed as void Function()?,
                child: Text(
                  status!,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
