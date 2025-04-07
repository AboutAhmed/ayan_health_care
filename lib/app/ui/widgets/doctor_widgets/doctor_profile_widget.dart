// import 'package:ayan_healthcare/app/ui/screens/doctors/doctor_model.dart';
// import 'package:ayan_healthcare/app/ui/widgets/dividers/profile_divider.dart';
// import 'package:ayan_healthcare/assets/styles/my_colors.dart';
// import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../widgets/full_image_network.dart';

// class DoctorProfileWidget extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   final DoctorModel? doctorProfileModel;
//   final bool isMbbs;

//   DoctorProfileWidget({
//     required this.expandedHeight,
//     required this.doctorProfileModel,
//     required this.isMbbs,
//   });

//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.passthrough,
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           color: AppColors.primaryColor,
//         ),
//         AppBar(
//           centerTitle: true,
//           title: Opacity(
//               opacity: shrinkOffset / expandedHeight,
//               child: Text(doctorProfileModel?.doctorDetail.name ?? "")),
//           actions: [
//             if (doctorProfileModel?.selectedCity != null &&
//                 doctorProfileModel?.doctorDetail.slug != null)
//               IconButton(
//                 icon: const Icon(Icons.share),
//                 onPressed: () {
//                   String? speciality = doctorProfileModel?.selectedSpeciality
//                       .trim()
//                       .replaceAll(' ', '-')
//                       .toLowerCase();
//                   String url =
//                       "https://instacare.pk/doctors/${doctorProfileModel?.selectedCity}/$speciality/${doctorProfileModel?.doctorDetail.slug}";
//                   try {
//                     // Share.share(url);
//                   } catch (_) {}
//                 },
//               )
//           ],
//         ),
//         Positioned(
//           top: expandedHeight / 3.0 - shrinkOffset,
//           width: Get.width,
//           height: Get.height,
//           child: Opacity(
//             opacity: 1 - shrinkOffset / expandedHeight,
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 50.0,
//                   left: 14.0,
//                   right: 14.0,
//                   child: Card(
//                     elevation: 2,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(12.0),
//                       ),
//                     ),
//                     child: Stack(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                             top: MyTextStyle.height60,
//                           ),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "${doctorProfileModel?.doctorDetail.name}",
//                                 style: Get.textTheme.titleMedium,
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 doctorProfileModel?.selectedSpeciality.toUpperCase() ?? "",
//                               ),
//                               const ProfileDivider(),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                                 child: Text(
//                                   doctorProfileModel?.doctorDetail.qualifications ?? "N/A",
//                                   maxLines: 2,
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               const ProfileDivider(),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   _buildInfoColumn("Fee", doctorProfileModel?.medicalCenters.isNotEmpty == true
//                                       ? "${doctorProfileModel?.medicalCenters.first.regularCharges.replaceAll("PKR/- ", "")} PKR"
//                                       : "N/A"),
//                                   _buildInfoColumn("Experience", "${doctorProfileModel?.doctorDetail.experience} Yrs"),
//                                   _buildInfoColumn("Wait Time", "Under 15 min"),
//                                 ],
//                               ),
//                               const SizedBox(height: 8.0),
//                             ],
//                           ),
//                         ),
//                         if (doctorProfileModel?.doctorDetail.onboard != null)
//                           Positioned(
//                             top: 0.0,
//                             right: 0.0,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.green.shade50,
//                                 borderRadius: const BorderRadius.only(
//                                   topRight: Radius.circular(12.0),
//                                   bottomLeft: Radius.circular(8.0),
//                                 ),
//                               ),
//                               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
//                               child: Row(
//                                 children: [
//                                   const Icon(Icons.check, size: 14, color: MyColors.greenColor),
//                                   const SizedBox(width: 6),
//                                   Text(
//                                     "${isMbbs ? "PMC" : ""} Verified",
//                                     style: Get.textTheme.bodySmall!.copyWith(
//                                       color: Colors.green,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 10.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 0,
//                   width: Get.width,
//                   child: Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.to(
//                           () => FullImageNetwork(
//                             imagePath: doctorProfileModel?.doctorDetail.image,
//                             tag: doctorProfileModel?.doctorDetail.image,
//                           ),
//                         );
//                       },
//                       child: ImageWithVideoIcon(
//                         imagePath: doctorProfileModel?.doctorDetail.image,
//                         width: MyTextStyle.height105,
//                         videoIconRight: 12.0,
//                         videoIconTop: 4,
//                                                 height: MyTextStyle.height105,
//                         isVideo: doctorProfileModel?.doctorDetail.provideTeleConsultation ?? false,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Helper method to build info columns
//   Widget _buildInfoColumn(String title, String value) {
//     return Expanded(
//       child: Column(
//         children: [
//           Text(
//             title,
//             style: const TextStyle(color: Colors.grey),
//           ),
//           Text(
//             value,
//             style: MyTextStyle.styleSubTile2,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   double get maxExtent => expandedHeight;

//   @override
//   double get minExtent => kToolbarHeight;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }