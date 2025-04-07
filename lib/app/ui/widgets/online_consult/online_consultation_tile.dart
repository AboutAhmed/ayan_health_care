// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instacare/assets/styles/my_colors.dart';

// import '../../../controllers/home/home_controller.dart';
// import '../custom_card.dart';

// class CampaignTile extends StatelessWidget {
//   const CampaignTile({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.find<HomeController>();

//     return CustomCard(
//       onPressed: controller.navigateToConsultation,
//       color: MyColors.primaryColor,
//       margin: const EdgeInsets.symmetric(
//         horizontal: 16,
//       ),
//       child: ListTile(
//         leading: const CircleAvatar(
//           radius: 18.0,
//           backgroundColor: Colors.white,
//           child: Icon(
//             Icons.video_call,
//             color: MyColors.primaryColor,
//           ),
//         ),
//         title: Text(
//           controller.campaigns.first.title,
//           style: Get.textTheme.bodyLarge?.copyWith(
//             color: Colors.white,
//           ),
//         ),
//         trailing: const Icon(
//           Icons.arrow_forward_ios_rounded,
//           size: 18,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
