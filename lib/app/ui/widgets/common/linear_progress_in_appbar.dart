import 'package:flutter/material.dart';

class LinearProgressInAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const LinearProgressInAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Row(
          children: [
            Icon(Icons.sync),
            SizedBox(
              width: 16,
            ),
            Text("Syncing data..."),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(33);
}
