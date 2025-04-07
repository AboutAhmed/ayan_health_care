import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThankingDialog extends StatelessWidget {
  final String? description, id;
  final Widget? child;

  const ThankingDialog({super.key, this.description, this.child, this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            // flex: 0,
            child: FlareActor(
              "assets/animation/success.flr",
              alignment: Alignment.center,
              animation: 'Untitled',
              snapToEnd: true,
            ),
          ),
          if (child != null)
            Expanded(
              flex: 2,
              child: child!,
            ),
          if (child == null)
            Expanded(
              // flex: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      // Keys.congratsTitle,
                      "",
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    // if (id != null)
                    const SizedBox(
                      height: 16,
                    ),
                    // if (id != null)
                    Text(
                      'Order ID #: $id',
                      textAlign: TextAlign.center,
                      style: Get.theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
