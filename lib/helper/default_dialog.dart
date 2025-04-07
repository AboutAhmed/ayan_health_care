import 'package:ayan_healthcare/helper/toaster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class GetDefaultDialog {
  void showDialog({String? message, Widget? content}) async {
    Get.defaultDialog(
      barrierDismissible: false,
      confirmTextColor: Colors.white,
      title: '',
      titleStyle: const TextStyle(
        height: 0,
        fontSize: 0,
      ),
      buttonColor: Colors.green,
      actions: [
        TextButton(
          onPressed: () async {
            try {
              final link = WhatsAppUnilink(
                phoneNumber: '+923116124245',
                text: message,
              );
              await launchUrlString("$link",
                  mode: LaunchMode.externalApplication);
            } catch (e) {
              Toaster.showToast('whatsapp not installed');
            }
          },
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(
                Colors.green,
              ),
              shape: WidgetStateProperty.all(const StadiumBorder()),
              side: WidgetStateProperty.all(
                const BorderSide(
                  color: Colors.green,
                ),
              )),
          child: const Text(
            'Support',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
            // Get.offAllNamed(AppRoutes.home);
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          child: const Text(
            'Ok',
          ),
        ),
      ],
      content: content,
    );
  }
}
