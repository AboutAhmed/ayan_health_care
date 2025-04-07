// import 'package:flutter/material.dart';
// import '../../../../assets/styles/text_styles/text_styles.dart';
// import '../../../models/doctors/find_doctor_response_model.dart';
// import '../custom_card.dart';
// import '../dividers/dividers.dart';
// import '../doctor_widgets/image_with_video_icon.dart';

// class AppDoctorCard extends StatelessWidget {
//   final DoctorModel? doctorModel;
//   final String? doctorFee;

//   const AppDoctorCard({super.key, required this.doctorModel, required this.doctorFee});

//   @override
//   Widget build(BuildContext context) {
//     return CustomCard(
//       radius: 12.0,
//       margin: const EdgeInsets.only(
//         left: 12,
//         right: 12,
//         top: 16,
//       ),
//       child: Column(
//         children: [
//           ListTile(
//             leading: ImageWithVideoIcon(
//               imagePath: doctorModel?.imagePath ?? "",
//               width: 54.0,
//               videoIconRight: 0,
//               videoIconTop: 0,
//               height: 54.0,
//             ),
//             title: Padding(
//               padding: const EdgeInsets.only(
//                 right: 80.0,
//               ),
//               child: Text(
//                 "${doctorModel?.name}",
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             subtitle: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 4.0,
//                 ),
//                 Text(
//                   doctorModel?.speciality ?? "N/A",
//                   style: MyTextStyle.styleBodyText2,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 16.0,
//               right: 16.0,
//               bottom: 12.0,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text: "Fee\n",
//                       style: const TextStyle(
//                         color: Colors.grey,
//                       ),
//                       children: [
//                         if (doctorModel?.medicalCenters != null)
//                           TextSpan(
//                             text: doctorFee,
//                             style: MyTextStyle.styleSubTile2,
//                           ),
//                         if (doctorModel?.medicalCenters == null)
//                           TextSpan(
//                             text: "N/A",
//                             style: MyTextStyle.styleSubTile2,
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 verticalDivider(),
//                 Expanded(
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text: "Experience\n",
//                       style: MyTextStyle.styleBodyText2,
//                       children: [
//                         TextSpan(
//                           text: "${doctorModel?.experience} Yrs",
//                           style: MyTextStyle.styleSubTile2,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 verticalDivider(),
//                 Expanded(
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text: "Wait Time\n",
//                       style: MyTextStyle.styleBodyText2,
//                       children: [
//                         TextSpan(
//                           text: "Under 15 Min",
//                           style: MyTextStyle.styleSubTile2,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
