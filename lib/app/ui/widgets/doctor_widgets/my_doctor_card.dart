// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../assets/styles/text_styles/text_styles.dart';
// import '../../../models/doctors/find_doctor_response_model.dart';
// import '../../../routes/routes.dart';
// import '../custom_card.dart';
// import 'image_with_video_icon.dart';

// class MyDoctorCard extends StatelessWidget {
//   final DoctorModel doctorModel;
//   final VoidCallback? onTap, showProfile;

//   const MyDoctorCard({
//     Key? key,
//     required this.doctorModel,
//     this.onTap,
//     this.showProfile,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // bool isQualification = doctorModel.qualification != null;
//     return CustomCard(
//       onPressed: showProfile,
//       margin: const EdgeInsets.only(
//         bottom: 12.0,
//       ),
//       child: ListTile(
//         onTap: showProfile ??
//             () {
//               Get.toNamed(
//                 AppRoutes.doctorProfile,
//                 arguments: {'doctor': doctorModel},
//               );
//             },
//         // isThreeLine: isQualification,
//         leading: ImageWithVideoIcon(
//           imagePath: doctorModel.imagePath,
//           width: 50,
//           videoIconRight: 0,
//           videoIconTop: 0,
//           height: 50,
//           isVideo: doctorModel.isTelemedicineProvider,
//         ),
//         title: Padding(
//           padding: const EdgeInsets.only(right: 80),
//           child: Text(
//             "${doctorModel.name}",
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//         subtitle: Text(
//           doctorModel.speciality ?? "N/A",
//           style: MyTextStyle.styleBodyText2,
//         ),
//         trailing: const Icon(
//           Icons.keyboard_arrow_right,
//         ),
//         // subtitle: Column(
//         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //   crossAxisAlignment: CrossAxisAlignment.start,
//         //   children: [
//         //     if (isQualification)
//         //       Text(
//         //         doctorModel.qualification ??
//         //             "N/A",
//         //         maxLines: 2,
//         //         style: MyTextStyle.styleBodyText2,
//         //       ),
//         //     if (isQualification)
//         //       const SizedBox(
//         //         height: 4,
//         //       ),
//         //     Text(
//         //       doctorModel.speciality ?? "N/A",
//         //       style: MyTextStyle.styleBodyText2,
//         //     ),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }
