import 'package:ayan_healthcare/app/controller/app_drawer_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../widgets/social_icons/social_icon_widget.dart';
import 'drawer_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDrawerController controller = Get.put(AppDrawerController());

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
      ),
      child: Drawer(
        child: Column(
          children: [
            // Profile Header Section
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              margin: EdgeInsets.zero,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align to the center
                  children: [
                    // Profile Image and Name
                    Obx(() => ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: controller.image.isNotEmpty
                                ? controller.image
                                    .value // Use .value to access the Rx variable
                                : MyImages.imageNotFound,
                            // Default image if not available
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Image.asset(MyImages.imageNotFound),
                            // Placeholder while loading
                            errorWidget: (context, url, error) => Image.asset(
                                MyImages
                                    .imageNotFound), // Show default image on error
                          ),
                        )),
                    const SizedBox(height: 10),
                    // User Name
                    Obx(() => Text(
                          controller.name.isNotEmpty
                              ? controller.name.value
                              : "Guest", // Default name if not available
                          style: Get.theme.textTheme.titleSmall!
                              .copyWith(color: Colors.white),
                        )),
                    const SizedBox(height: 4),
                    // MR No. or Email
                    Obx(() => Text(
                          controller.mrNo.isNotEmpty
                              ? controller.mrNo.value
                              : "N/A", // Default MR No. if not available
                          style: Get.theme.textTheme.bodySmall!
                              .copyWith(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
            // Drawer Options
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12.0),
                children: <Widget>[
                  DrawerList(
                    title: S.of(context).my_booking,
                    iconData: Icons.calendar_today_outlined,
                    onTap: () => Get.toNamed(
                        AppRoutes.myBooking), // Add appropriate route
                  ),
                  DrawerList(
                    title: S.of(context).health_record,
                    iconData: Icons.health_and_safety,
                    onTap: () => Get.toNamed(
                        AppRoutes.healthRecord), // Add appropriate route
                  ),
                  // DrawerList(
                  //   title: S.of(context).find_doctors,
                  //   iconData: Icons.article_outlined,
                  //   onTap: () => Get.toNamed(
                  //       AppRoutes.findDoctors), // Add appropriate route
                  // ),
                  // DrawerList(
                  // title: S.of(context).my_chat,
                  // iconData: Icons.chat,
                  // onTap: () => {
                  //       Get.toNamed(
                  //           AppRoutes.chatRoom), // Add appropriate route
                  //     }),
                  DrawerList(
                    title: S.of(context).settings,
                    iconData: Icons.settings,
                    onTap: () =>
                        Get.toNamed(AppRoutes.setting), // Add appropriate route
                  ),
                  DrawerList(
                    title: S.of(context).logout,
                    iconData: Icons.logout,
                    onTap: () {
                      _showLogoutConfirmationDialog(context, controller);
                    },
                  ),
                ],
              ),
            ),
            // Version Info & Social Links Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      S.of(context).follow_us_on,
                      // Display the version number dynamically if required
                      style: Get.theme.textTheme.titleSmall,
                    ),
                  ),
                  widgetSpacerVertically(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        size: 50.0,
                        icon: "assets/icons/facebook.svg",
                        onTap: () async {
                          await _launchURL(
                              "https://www.facebook.com/share/1UaKB4EP6a/",
                              "https://www.facebook.com/share/1UaKB4EP6a/");
                        },
                      ),
                      const SizedBox(width: 12),
                      SocialCard(
                        size: 50.0,
                        icon: "assets/icons/whatsapp.svg",
                        onTap: () async {
                          await _launchURL(
                              "whatsapp://send?phone=+923116124245",
                              "https://wa.me/923116124245");
                        },
                      ),
                      const SizedBox(width: 12),
                      SocialCard(
                        size: 50.0,
                        icon: "assets/icons/instagram.svg",
                        onTap: () async {
                          await _launchURL(
                            "https://www.instagram.com/ayaanhealthcenter?igsh=MWpoanIxd2lvaWRoMA==",
                            "https://www.instagram.com/ayaanhealthcenter?igshid=MWpoanIxd2lvaWRoMA==",
                          );
                        },
                      ),
                    ],
                  ),
                  widgetSpacerVertically(),
                  // Version Information
                  Text("Version 1.0.0",
                      // Display the version number dynamically if required
                      style: Get.theme.textTheme.titleSmall!),
                  const SizedBox(height: 10),
                  // Follow Us on Social Media
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String primaryUrl, String fallbackUrl) async {
    try {
      bool launched = await launchUrlString(primaryUrl);
      if (!launched) {
        await launchUrlString(fallbackUrl);
      }
    } catch (e) {
      await launchUrlString(fallbackUrl);
    }
  }

  void _showLogoutConfirmationDialog(
      BuildContext context, AppDrawerController controller) {
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
                await controller
                    .logout(); // Call the logout method from the controller
              },
              child: Text(S.of(context).logout),
            ),
          ],
        );
      },
    );
  }
}
