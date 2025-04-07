import 'package:ayan_healthcare/app/controller/home/home_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/screens/home/app_drawer.dart';
import 'package:ayan_healthcare/app/ui/screens/home/banners.dart';
import 'package:ayan_healthcare/app/ui/screens/home/doctor_list.dart';
import 'package:ayan_healthcare/app/ui/screens/home/mycard_widget.dart';
import 'package:ayan_healthcare/app/ui/widgets/common/app_bar_search_widget.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    Get.lazyPut<HomeController>(() => HomeController());
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Get.find<HomeController>(); // Retrieve the controller

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    // final List<Map<String, String>> doctors = [
    //   {
    //     'imagePath': 'assets/images/find-doctor.png',
    //     'name': 'Dr. Arshad',
    //     'subtitle': 'PGD (Dietist), Pharm D (M.Phil Clinical Nutritionist)',
    //     'fee': '5000 PKR',
    //     'rating': '4.8',
    //   },
    //   {
    //     'imagePath': 'assets/images/find-doctor.png',
    //     'name': 'Dr. Sarah',
    //     'subtitle': 'MBBS, MD (Pediatrics)',
    //     'fee': '4500 PKR',
    //     'rating': '4.5',
    //   },
    //   {
    //     'imagePath': 'assets/images/find-doctor.png',
    //     'name': 'Dr. Ali',
    //     'subtitle': 'MBBS, FCPS (Cardiology)',
    //     'fee': '6000 PKR',
    //     'rating': '4.9',
    //   },
    // ];

    // FocusNode to manage focus on the search field
    FocusNode searchFocusNode = FocusNode();

    // Automatically request focus when the page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchFocusNode.requestFocus();
    });

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    return Stack(children: [
                      IconButton(
                          icon: SizedBox(
                              height: 35.0,
                              width: 35.0,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.scaleDown,
                                      imageUrl:
                                          "https://instacare.pk/assets/img/Image-not-found.jpg",
                                      placeholder: (context, url) =>
                                          Image.asset(
                                              "assets/images/user.png")))),
                          onPressed: () => Scaffold.of(context).openDrawer()),
                      Positioned(
                        right: 6.0,
                        bottom: 6.0,
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            border: Border.all(color: Colors.white, width: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.menu, size: 10.0),
                        ),
                      ),
                    ]);
                  },
                ),
                const SizedBox(width: 8), // Adjust spacing
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi ${controller.name} 👋🏼",
                      style: regularText.copyWith(color: AppColors.whiteColor),
                    ),
                    Text(
                      S.of(context).have_nice_day,
                      style: regularText.copyWith(color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Field
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildSearchBar(
                        hintText: S.of(context).search_hint,
                        controller: controller.searchController,
                        // Use the controller
                        onSearch: () {
                          Get.toNamed(AppRoutes
                              .findDoctors); // Navigate to find doctors screen
                        },
                        onClear: () {
                          controller.onClear(); // Call the clear method
                        },
                        showSuffix: controller.showSuffix
                            .value, // Reactive boolean for suffix visibility
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Placeholder for Banners
                    const Banners(),
                    const SizedBox(height: 16.0),
                    // Services Row
                    Row(
                      children: [
                        Expanded(
                          child: MyCardWidget(
                            imagePath: "assets/images/finddoctor.png",
                            text: S.of(context).find_doctors,
                            onTap: () {
                              Get.toNamed(AppRoutes.findDoctors);
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: MyCardWidget(
                            imagePath: "assets/images/booking.png",
                            text: S.of(context).my_booking,
                            onTap: () {
                              Get.toNamed(AppRoutes.myBooking);
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: MyCardWidget(
                            imagePath: "assets/images/hrecord.png",
                            onTap: () {
                              Get.toNamed(AppRoutes.healthRecord);
                            },
                            text: S.of(context).health_record,
                          ),
                        ),
                      ],
                    ),
                    sectionSmallSpacerVertically(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).recommended_doctors,
                          style: mainTitles,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.findDoctors);
                          },
                          child: Text(
                            S.of(context).view_all,
                            style: regularText,
                          ),
                        ),
                      ],
                    ),
                    widgetSpacerVertically(),
                    const DoctorList(),
                    widgetSpacerVertically(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       S.of(context).health_article,
                    //       style: mainTitles,
                    //     ),
                    //     Text(
                    //       S.of(context).view_all,
                    //       style: regularText,
                    //     ),
                    //   ],
                    // ),
                    // widgetSpacerVertically(),
                    // // Placeholder for Health Tips
                    // Container(
                    //   height: 150,
                    //   color: Colors.grey[300],
                    //   child: Center(child: Text(S.of(context).health_article)),
                    // ),
                    // const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () async {
            await _launchURL("whatsapp://send?phone=+923116124245",
                "https://wa.me/923116124245");
          },
          child: SvgPicture.asset(
            "assets/icons/whatsapp.svg",
            height: 24,
            width: 24,
            color: AppColors.whiteColor,
          )),
    );
  }
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
