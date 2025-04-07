// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instacare/app/controllers/doctor/find_doctor_controller.dart';
// import 'package:instacare/app/models/doctors/find_doctor_response_model.dart';
// import 'package:instacare/app/routes/routes.dart';
// import 'package:instacare/app/ui/widgets/custom_card.dart';
// import 'package:instacare/app/ui/widgets/dividers/dividers.dart';
// import 'package:instacare/assets/styles/my_colors.dart';
// import 'package:instacare/assets/styles/text_styles/text_styles.dart';

// import '../../../../assets/styles/strings/app_constants.dart';
// import '../../../../helper/preferences.dart';
// import '../../../controllers/home/home_controller.dart';
// import 'image_with_video_icon.dart';
// import 'location_card_widget.dart';

// class DoctorWidget extends StatelessWidget {
//   final DoctorModel doctorModel;

//   const DoctorWidget({
//     Key? key,
//     required this.doctorModel,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isQualification = doctorModel.qualification != null;

//     return CustomCard(
//       radius: 12.0,
//       onPressed: () {
//         Get.toNamed(
//           AppRoutes.doctorProfile,
//           arguments: {'doctor': doctorModel},
//         );
//       },
//       margin: const EdgeInsets.symmetric(
//         horizontal: 16.0,
//         vertical: 6.0,
//       ),
//       child: Stack(
//         children: [
//           Column(
//             children: <Widget>[
//               ListTile(
//                 isThreeLine: isQualification,
//                 leading: ImageWithVideoIcon(
//                   imagePath: doctorModel.imagePath,
//                   width: 55,
//                   videoIconRight: 0,
//                   videoIconTop: 0,
//                   height: 55,
//                   isVideo: doctorModel.isTelemedicineProvider,
//                 ),
//                 title: Padding(
//                   padding: const EdgeInsets.only(right: 80),
//                   child: Text(
//                     "${doctorModel.name}",
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 subtitle: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (isQualification)
//                       Text(
//                         "${doctorModel.qualification}",
//                         maxLines: 1,
//                         style: MyTextStyle.styleBodyText2,
//                       ),
//                     if (isQualification)
//                       const SizedBox(
//                         height: 4,
//                       ),
//                     Text(
//                       doctorModel.speciality ?? "N/A",
//                       style: MyTextStyle.styleBodyText2,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 16,
//                   right: 16,
//                   bottom: 12.0,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           text: "Fee\n",
//                           style: const TextStyle(
//                             color: Colors.grey,
//                           ),
//                           children: [
//                             if (doctorModel.medicalCenters!.isNotEmpty ||
//                                 doctorModel.medicalCenters != null)
//                               TextSpan(
//                                 text:
//                                     "${(doctorModel.medicalCenters?.first.md?.first.regularCharges ?? "0")} PKR",
//                                 style: MyTextStyle.styleSubTile2,
//                               ),
//                             if (doctorModel.medicalCenters!.isEmpty ||
//                                 doctorModel.medicalCenters == null)
//                               TextSpan(
//                                 text: "N/A",
//                                 style: MyTextStyle.styleSubTile2,
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     verticalDivider(),
//                     Expanded(
//                       child: RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           text: "Experience\n",
//                           style: MyTextStyle.styleBodyText2,
//                           children: [
//                             TextSpan(
//                               text: "${doctorModel.experience} Yrs",
//                               style: MyTextStyle.styleSubTile2,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     verticalDivider(),
//                     Expanded(
//                       child: RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           text: "Wait Time\n",
//                           style: MyTextStyle.styleBodyText2,
//                           children: [
//                             TextSpan(
//                               text: "Under 15 Min",
//                               style: MyTextStyle.styleSubTile2,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               if (doctorModel.medicalCenters!.isNotEmpty)
//                 AspectRatio(
//                   aspectRatio: 23 / 4,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     physics: const BouncingScrollPhysics(),
//                     itemBuilder: (_, index) {
//                       return LocationCardWidget(
//                         medicalCenter: doctorModel.medicalCenters![index],
//                         isTelemedicineProvider:
//                             doctorModel.isTelemedicineProvider && index == 0,
//                       );
//                     },
//                     itemCount: doctorModel.medicalCenters!.length,
//                   ),
//                 ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 8.0,
//                   vertical: 4,
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: FutureBuilder<bool>(
//                         future: Get.put(FindDoctorController())
//                             .checkDoctorChatAvailability(
//                                 "${doctorModel.userName}"),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return OutlinedButton(
//                               onPressed: () {},
//                               child: const Text('Loading...'),
//                             );
//                           } else {
//                             if (snapshot.hasError) {
//                               return OutlinedButton(
//                                 onPressed: () {
//                                   Get.toNamed(
//                                     AppRoutes.doctorProfile,
//                                     arguments: {'doctor': doctorModel},
//                                   );
//                                 },
//                                 child: const Text('View Profile'),
//                               );
//                             } else {
//                               bool isAvailable = snapshot.data ?? false;
//                               return OutlinedButton(
//                                 onPressed: () async {
//                                   if (isAvailable) {
//                                     bool isGuest = Get.find<Preferences>()
//                                             .getBool(key: Keys.guestUser) ??
//                                         false;
//                                     if (isGuest) {
//                                       Get.toNamed(AppRoutes.login);
//                                     } else {
//                                       await Get.find<HomeController>()
//                                           .createRoom(
//                                               doctorModel.userName ?? "");
//                                     }
//                                   } else {
//                                     Get.toNamed(
//                                       AppRoutes.doctorProfile,
//                                       arguments: {'doctor': doctorModel},
//                                     );
//                                   }
//                                 },
//                                 child: Text(
//                                     isAvailable ? "Chat Now" : 'View Profile'),
//                               );
//                             }
//                           }
//                         },
//                       ),
//                     ),
//                     if (doctorModel.medicalCenters!.isNotEmpty)
//                       const SizedBox(
//                         width: 8.0,
//                       ),
//                     if (doctorModel.medicalCenters!.isNotEmpty)
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () => Get.put(FindDoctorController())
//                               .action(doctorModel),
//                           child: const Text("Book Appointment"),
//                         ),
//                       )
//                   ],
//                 ),
//               )
//             ],
//           ),
//           if (doctorModel.onboard!)
//             Positioned(
//               right: 0,
//               top: 0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 6.0,
//                   vertical: 4.0,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.green.shade50,
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(
//                       8.0,
//                     ),
//                     topRight: Radius.circular(
//                       12.0,
//                     ),
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.check,
//                       size: 14,
//                       color: MyColors.greenColor,
//                     ),
//                     const SizedBox(
//                       width: 6,
//                     ),
//                     Text(
//                       "${doctorModel.notMbbs! ? "PMC" : ""} Verified",
//                       style: Get.textTheme.bodySmall!.copyWith(
//                         color: Colors.green,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 10.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//         ],
//       ),
//     );
//   }

// // String get getButtonTitle {
// //   if (doctorModel.isCallNow()) {
// //     return "Call Helpline";
// //   } else {
// //     return "Book Appointment";
// //   }
// // }
// }
