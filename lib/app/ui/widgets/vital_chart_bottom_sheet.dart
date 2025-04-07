// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../assets/styles/my_Images.dart';
// import '../../../assets/styles/my_colors.dart';
// import '../../../assets/styles/strings/app_constants.dart';
// import '../../../assets/styles/text_styles/text_styles.dart';
// import '../../../helper/preferences.dart';
// import '../../controllers/user/login/user_accounts_controller.dart';
// import '../../controllers/vital_charts/vital_chart_home/vital_chart_home_controller.dart';
// import '../../models/otp/otp_model.dart';
// import 'custom_card.dart';
// import 'custom_leading_icon.dart';
// import 'dialogs/loading_progress.dart';

// class VitalChartBottomSheet extends StatelessWidget {
//   const VitalChartBottomSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final UserAccountsController controller = Get.put(UserAccountsController());
//     final VitalChartHomeController vitalChartHomeController =
//         Get.find<VitalChartHomeController>();
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//         minHeight: Get.height * 0.3,
//         maxHeight: Get.height * 0.85,
//       ),
//       child: Obx(
//         () {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(
//                 height: 16.0,
//               ),
//               Container(
//                 height: 4.0,
//                 width: 38.0,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(
//                     12.0,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           top: 10.0,
//                           left: 12.0,
//                           bottom: 10.0,
//                         ),
//                         child: Text(
//                           'Family Members',
//                           style: Get.theme.textTheme.titleMedium!.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               if (controller.accounts.isNotEmpty)
//                 Flexible(
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: const BouncingScrollPhysics(),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12.0,
//                       vertical: 4.0,
//                     ),
//                     itemBuilder: (_, int index) {
//                       UserShortModel userList = controller.accounts[index];
//                       return CustomCard(
//                         radius: 12.0,
//                         onPressed: () {
//                           vitalChartHomeController.selectedAccount.value = userList;
//                           Get.find<Preferences>().setString(
//                             key: Keys.selectedName,
//                             value: userList.name,
//                           );
//                           Get.find<Preferences>().setString(
//                             key: Keys.selectedUserName,
//                             value: userList.username,
//                           );
//                           vitalChartHomeController.isBottom(false);
//                           Get.back();
//                         },
//                         margin: const EdgeInsets.only(
//                           bottom: 16.0,
//                         ),
//                         child: ListTile(
//                           leading: userList.imagePath != null
//                               ? SizedBox(
//                                   height: MyTextStyle.height40,
//                                   width: MyTextStyle.height40,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(
//                                         MyTextStyle.height50,
//                                       ),
//                                     ),
//                                     child: CachedNetworkImage(
//                                       // fit: BoxFit.cover,
//                                       imageUrl: "${userList.imagePath}",
//                                       placeholder: (context, url) =>
//                                           Image.asset(
//                                         MyImages.imageNotFound,
//                                       ),
//                                       errorWidget: (context, url, error) =>
//                                           CustomLeadingIcon(
//                                             title: "${userList.name}",
//                                           ),
//                                     ),
//                                   ),
//                                 )
//                               : CustomLeadingIcon(
//                                   title: "${userList.name}",
//                                 ),
//                           title: Text(
//                             userList.name!,
//                             style: Get.theme.textTheme.titleMedium,
//                           ),
//                           subtitle: userList.username == vitalChartHomeController.selectedAccount.value?.username
//                               ? const Text(
//                                   "Currently in Use",
//                                   style: TextStyle(
//                                     color: MyColors.accentColor,
//                                     fontSize: 12.0,
//                                   ),
//                                 )
//                               : null,
//                           trailing: const Icon(
//                             Icons.keyboard_arrow_right,
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: controller.accounts.length,
//                   ),
//                 ),
//               if (controller.accounts.isEmpty)
//                 const SizedBox(
//                   height: 200.0,
//                   child: Center(
//                     child: LoadingProgress(),
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
