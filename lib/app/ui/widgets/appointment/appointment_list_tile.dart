// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../assets/spacing.dart';
// import '../../../../assets/styles/my_colors.dart';
// import '../../../../assets/styles/text_styles/text_styles.dart';
// import '../../../../assets/styles/text_styles/text_theme.dart';
// import '../custom_leading_icon.dart';

// class AppListTile extends StatelessWidget {
//   final String? fee, time, title, headline;
//   final bool? isVideo;
//   final Widget? child;

//   const AppListTile({
//     Key? key,
//     this.headline,
//     this.fee,
//     this.time,
//     this.title,
//     this.isVideo,
//     this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         top: 16.0,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (headline != null)
//             Padding(
//               padding:
//                   EdgeInsets.only(left: 16, bottom: isVideo! ? (12.0) : 12.0),
//               child: Text(
//                 headline!,
//                 style: subTitles,
//               ),
//             ),
//           Container(
//             margin: const EdgeInsets.symmetric(
//               horizontal: 16.0,
//             ),
//             decoration: BoxDecoration(
//               color: isVideo!
//                   ? AppColors.primaryColor.withOpacity(0.2)
//                   : Colors.grey.shade100,
//               borderRadius: BorderRadius.circular(
//                 12.0,
//               ),
//             ),
//             child: Column(
//               children: [
//                 ListTile(
//                   contentPadding: EdgeInsets.symmetric(
//                       horizontal: isVideo! ? 16 : 8.0, vertical: 4 / 2),
//                   title: Text(
//                     title!,
//                     maxLines: 1,
//                   ),
//                   subtitle: Text(time!, style: Get.textTheme.titleSmall),
//                   leading: isVideo!
//                       ? SizedBox(
//                           height: MyTextStyle.height40,
//                           width: MyTextStyle.height40,
//                           child: Card(
//                             elevation: 1,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                 MyTextStyle.height40,
//                               ),
//                             ),
//                             margin: EdgeInsets.zero,
//                             child: const Icon(Icons.videocam_rounded),
//                           ))
//                       : Container(
//                           padding: const EdgeInsets.all(
//                             4.0,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               MyTextStyle.height30,
//                             ),
//                             border: Border.all(
//                               color: AppColors.lightBorderColor,
//                             ),
//                           ),
//                           child: CustomLeadingIcon(
//                             title: "$title",
//                             color: AppColors.primaryColor,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                   trailing: fee != null
//                       ? Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             RichText(
//                               textAlign: TextAlign.center,
//                               text: TextSpan(
//                                 text: "FEE\n",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 10.0,
//                                     color: Colors.black.withOpacity(0.84)),
//                                 children: [
//                                   TextSpan(
//                                     text: "$fee PKR",
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 10.0,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             widgetSpacerHorizontally(),
//                             const Icon(
//                               Icons.keyboard_arrow_down,
//                               size: 16.0,
//                               color: Colors.black,
//                             )
//                           ],
//                         )
//                       : const SizedBox.shrink(),
//                 ),
//                 if (child != null) child!,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
