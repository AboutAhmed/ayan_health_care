// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../assets/styles/my_colors.dart';
// import '../../../../assets/styles/my_images.dart';
// import '../../../models/doctors/find_doctor_response_model.dart';
// import '../../../routes/routes.dart';
// import 'doctor_cache_image.dart';

// class LocationCardWidget extends StatelessWidget {
//   final MedicalCenterShortModel medicalCenter;
//   final bool isTelemedicineProvider;

//   const LocationCardWidget({
//     Key? key,
//     required this.medicalCenter,
//     this.isTelemedicineProvider = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         if (!GetUtils.isNullOrBlank(medicalCenter.md?.first.videoCharges)! &&
//             isTelemedicineProvider)
//           Container(
//             width: Get.width * .75,
//             padding: const EdgeInsets.only(left: 8.0),
//             child: ListTile(
//               dense: true,
//               minVerticalPadding: 0.0,
//               enabled: false,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//               ),
//               tileColor: Colors.grey.shade100,
//               leading: Container(
//                 width: 35,
//                 height: 35,
//                 decoration: const BoxDecoration(
//                   color: MyColors.lightBlue,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.video_call_outlined,
//                   size: 25,
//                   color: Colors.white,
//                 ),
//               ),
//               title: Text(
//                 "Online Consultation",
//                 softWrap: false,
//                 overflow: TextOverflow.ellipsis,
//                 style: Get.textTheme.titleSmall,
//               ),
//               subtitle: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (medicalCenter.md?.first.online ?? false)
//                     Text(
//                       "Available Today",
//                       style: Get.theme.textTheme.bodyMedium!.copyWith(
//                         color: Colors.green,
//                       ),
//                     ),
//                   Text(
//                     "PKR ${medicalCenter.md?.first.videoCharges ?? 0}",
//                     style: Get.textTheme.titleSmall,
//                   ),
//                 ],
//               ),
//               // isThreeLine: true,
//             ),
//           ),
//         Container(
//           width: Get.width * .75,
//           padding: const EdgeInsets.only(left: 8.0),
//           child: GestureDetector(
//             onTap: () {
//               Get.toNamed(
//                 AppRoutes.hospitalProfile,
//                 arguments: medicalCenter.medSlug,
//               );
//             },
//             child: ListTile(
//               dense: true,
//               minVerticalPadding: 0.0,
//               enabled: false,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//               ),
//               tileColor: Colors.grey.shade100,
//               leading: DoctorCacheImage(
//                 path: medicalCenter.image,
//                 width: 34,
//                 height: 34,
//                 placeHolder: MyImages.hospital,
//               ),
//               title: Text(
//                 "${medicalCenter.medName} (${medicalCenter.medAddress?.trim().split(',')[1].trim()})",
//                 softWrap: false,
//                 overflow: TextOverflow.ellipsis,
//                 style: Get.textTheme.titleSmall,
//               ),
//               subtitle: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (medicalCenter.md?.first.online ?? false)
//                     Text(
//                       "Available Today",
//                       style: Get.theme.textTheme.bodyMedium!.copyWith(
//                         color: Colors.green,
//                       ),
//                     ),
//                   Text(
//                     "PKR ${medicalCenter.md?.first.regularCharges ?? 0}",
//                     style: Get.textTheme.titleSmall,
//                   ),
//                 ],
//               ),
//               // isThreeLine: true,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
