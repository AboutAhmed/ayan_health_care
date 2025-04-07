// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instacare/app/models/prescription_model.dart';
// import 'package:intl/intl.dart';
// import '../../../../assets/styles/my_Images.dart';
// import '../custom_card.dart';

// class PrescriptionListTile extends StatelessWidget {
//   final PrescriptionModel? prescription;
//   final VoidCallback? onTap;

//   const PrescriptionListTile({Key? key, this.prescription, this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     DateFormat dateFormat = DateFormat("MM/dd/yyyy HH:mm:ss a");
//     DateTime dateTime = dateFormat.parse(prescription!.timeStamp!);

//     return CustomCard(
//       onPressed: onTap,
//       margin: const EdgeInsets.only(bottom: 16.0),
//       child: ListTile(
//         leading: Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.grey.shade100,
//           ),
//           child: Center(
//             child: Image.asset(
//               MyImages.file,
//               height: 26.0,
//               width: 26.0,
//             ),
//           ),
//         ),
//         title: Text(
//           prescription!.title ?? "",
//           maxLines: 1,
//           style: Get.theme.textTheme.titleMedium!.copyWith(),
//         ),
//         subtitle: RichText(
//           maxLines: 1,
//           text: TextSpan(
//             text: '${dateTime.day}-${dateTime.month}-${dateTime.year} | ',
//             style: const TextStyle(
//               fontSize: 12.0,
//               color: Colors.grey,
//             ),
//             children: [
//               TextSpan(
//                 text: prescription!.doctorName,
//               ),
//             ],
//           ),
//         ),
//         trailing: const Icon(
//           Icons.keyboard_arrow_right_sharp,
//         ),
//       ),
//     );
//   }
// }
