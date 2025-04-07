// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instacare/app/controllers/home/home_controller.dart';
// import 'package:instacare/app/routes/routes.dart';
// import 'package:instacare/assets/styles/my_colors.dart';

// class PharmacyBanners extends StatelessWidget {
//   const PharmacyBanners({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     RxInt current = RxInt(0);
//     return Padding(
//       padding: const EdgeInsets.only(left: 12.0, right: 12.0,),
//       child: CarouselSlider(
//         options: CarouselOptions(
//           autoPlay: true,
//           onPageChanged: (index, reason) {
//             current(index);
//           },
//           aspectRatio: 14 / 6,
//           autoPlayInterval: const Duration(seconds: 8),
//           autoPlayAnimationDuration: const Duration(seconds: 3),
//           viewportFraction: 1.0,
//         ),
//         items: _imageList.map(
//           (map) {
//             Color color = Color(map['Color']);
//             return GestureDetector(
//               child: Container(
//                 margin: const EdgeInsets.only(
//                   left: 4.0,
//                   right: 4.0,
//                 ),
//                 decoration: BoxDecoration(
//                   color: color,
//                   borderRadius: BorderRadius.circular(
//                     12.0,
//                   ),
//                 ),
//                 child: Image.asset(
//                   map["ImagePath"],
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               onTap: () => navigateCorrespondingBanner(
//                 _imageList.indexOf(map),
//               ),
//             );
//           },
//         ).toList(),
//       ),
//     );
//   }

//   void navigateCorrespondingBanner(int index) {
//     if (index == 0) {
//       if (Get.find<HomeController>().campaigns.isNotEmpty) {
//         Get.toNamed(AppRoutes.onlineDoctorConsultation);
//         MyColors.blueColor;
//       }
//     } else if (index == 2) {
//       Get.toNamed(AppRoutes.labTestHome);
//     } else if (index == 3) {
//       Get.toNamed(AppRoutes.categories);
//     }
//   }

//   List<Map<String, dynamic>> get _imageList => [
//         {
//           "ImagePath": 'assets/images/banners/pharmacy_banner1.png',
//           "Color": 0xFFF7F8F9
//         },
//         {
//           "ImagePath": 'assets/images/banners/pharmacy_banner2.png',
//           "Color": 0xFFA8FCFF
//         },
//         {
//           "ImagePath": 'assets/images/banners/pharmacy_banner3.png',
//           "Color": 0xFFE8E5FD
//         }
//       ];
// }
