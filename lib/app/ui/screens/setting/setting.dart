import 'package:ayan_healthcare/app/controller/setting_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ayan_healthcare/helper/toaster.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            2.kH,
            CustomCard(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(S.of(context).profile),
                onTap: () {
                  Get.toNamed(AppRoutes.profileSetting);
                },
              ),
            ),
            widgetSpacerVertically(),
            CustomCard(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.language),
                title: Text(S.of(context).language),
                trailing: DropdownButton<String>(
                  value: settingsController.currentLanguage.value,
                  items: settingsController.languages
                      .map((Map<String, String> language) {
                    return DropdownMenuItem<String>(
                      value: language['code'],
                      child: Text(language['name']!),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      settingsController.changeLanguage(newValue);
                      final selectedLanguage = settingsController.languages
                          .firstWhere((lang) => lang['code'] == newValue);
                      Toaster.showToast(
                        S
                            .of(context)
                            .language_set_to(selectedLanguage['name']!),
                      );
                    }
                  },
                ),
              ),
            ),
            widgetSpacerVertically(),
            CustomCard(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.info),
                title: Text(S.of(context).about),
                onTap: () {
                  // Navigate to About screen
                  // Get.toNamed(AppRoutes.about);
                },
              ),
            ),
            widgetSpacerVertically(),
            CustomCard(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.delete),
                title: Text(S.of(context).delete_account),
                onTap: () {
                  _showDeleteConfirmationDialog(context);
                },
              ),
            ),
            widgetSpacerVertically(),
            CustomCard(
              color: Colors.white,
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: Text(S.of(context).logout),
                onTap: () {
                  _showLogoutConfirmationDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).language),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("English"),
                onTap: () {
                  Get.back();
                  Toaster.showToast(S.of(context).language_set_to("English"));
                },
              ),
              ListTile(
                title: const Text("Arabic"),
                onTap: () {
                  Get.back();
                  Toaster.showToast(S.of(context).language_set_to("Arabic"));
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(S.of(context).cancel),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).delete_account),
          content: Text(S.of(context).delete_confirmation),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                Toaster.showToast(S.of(context).account_deleted_message);
              },
              child: Text(S.of(context).delete),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).logout),
          content: Text(S.of(context).logout_confirmation),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Get.offAllNamed(AppRoutes.login);
              },
              child: Text(S.of(context).logout),
            ),
          ],
        );
      },
    );
  }
}
