
// import 'package:flutter/material.dart';
// import 'package:instacare/app/models/doctors/verify_doctor_model.dart';
// import 'package:instacare/assets/custom_fonts.dart';
// import 'package:instacare/assets/spacing.dart';
// import 'package:instacare/assets/styles/my_colors.dart';

// import 'verify_status_with_icon.dart';

// class VerifyDoctorCardWidget extends StatelessWidget {
//   final PMDCNumberDetails? details;
//   final VoidCallback? onTap;

//   const VerifyDoctorCardWidget({Key? key, this.details, this.onTap}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Card(
//       elevation: 4,
//       child: Container(
//         width: size.width,
//         padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (details!.isExpired!)
//               const Align(alignment: Alignment.center, child: VerifyStatusWithIcon(status:'License Expired',icon: Icons.warning,color: Colors.amber)),
//             if (!details!.isExpired!)
//               const Align(alignment: Alignment.center, child: VerifyStatusWithIcon(status:'License Verified',icon: Icons.check_box,color: Colors.green)),
//             widgetSpacerVertically(),

//             Text('${details!.name}',style: const TextStyle(fontFamily:  CustomFonts.roboto,fontWeight: FontWeight.w500,fontSize: 16,),),
//             otherSpacerVertically(),
//             AppointmentDetailRowWidget(title: 'Registration Number:',value: '${details!.registrationNo}'),
//             const Divider(
//               height: 0,
//               color: MyColors.lightBorderColor,
//             ),
//             AppointmentDetailRowWidget(title: 'Issued Date: ',value: '${details!.issueDate}'),
//             const Divider(
//               height: 0,
//               color: MyColors.lightBorderColor,
//             ),
//             AppointmentDetailRowWidget(title: 'Validity Date: ',value: '${details!.validityDate}'),
//             const Divider(
//               height: 0,
//               color: MyColors.lightBorderColor,
//             ),
//             AppointmentDetailRowWidget(title: 'University: ',value: '${details!.university}'),
//             const Divider(
//               height: 0,
//               color: MyColors.lightBorderColor,
//             ),
//             AppointmentDetailRowWidget(title: 'Qualification: ',value: '${details!.qualification}'),
//             sectionSmallSpacerVertically(),
//             Align(
//               alignment: Alignment.centerRight,
//               child: ElevatedButton(
//                   onPressed: onTap, child: const Text('Done')),
//             )
//           ],),
//       ),
//     );
//   }
// }

// class AppointmentDetailRowWidget extends StatelessWidget {
//   final String title, value;
//   final Color? color;

//   const AppointmentDetailRowWidget({Key? key,required this.title,required this.value, this.color}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 8.0,bottom: 4.0,),
//       child: Row(children: [
//         Expanded(
//           flex: 4,
//           child: Text(title,style: const TextStyle(fontFamily:  CustomFonts.roboto,fontWeight: FontWeight.w700,fontSize: 14),),
//         ),
//         const SizedBox(width: 6,),
//         Expanded(
//           flex: 6,
//           child: Text(value,style: TextStyle(color: color?? Colors.black,fontFamily:  CustomFonts.roboto,fontWeight: FontWeight.w400,fontSize: 14),),
//         )
//       ],),
//     );
//   }
// }
