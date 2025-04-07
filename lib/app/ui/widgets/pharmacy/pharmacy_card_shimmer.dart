// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instacare/assets/styles/my_colors.dart';
// import 'package:instacare/assets/styles/text_styles//text_styles.dart';
// import 'package:shimmer/shimmer.dart';

// class PharmacyCardShimmer extends StatelessWidget {
//   const PharmacyCardShimmer({Key? key}) : super(key: key);

//   Widget _buildContainer(double height, double width, {EdgeInsets? margin}) {
//     return Container(
//       height: height,
//       width: width,
//       padding: const EdgeInsets.all(
//         12.0,
//       ),
//       margin: margin ?? EdgeInsets.zero,
//       decoration: BoxDecoration(
//         color: Colors.grey,
//         border: Border.all(),
//         borderRadius: BorderRadius.circular(
//           12.0,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(
//         vertical: 2,
//         horizontal: 4,
//       ),
//       child: Shimmer.fromColors(
//         baseColor: MyColors.shimmerBaseColor,
//         highlightColor: MyColors.shimmerHighlightColor,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildContainer(
//               90,
//               180,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             _buildContainer(
//               14.0,
//               Get.width / 2,
//             ),
//             const SizedBox(
//               height: 4.0,
//             ),
//             _buildContainer(
//               10.0,
//               Get.width / 4,
//             ),
//             const SizedBox(
//               height: 6.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildContainer(
//                   14.0,
//                   MyTextStyle.width40,
//                 ),
//                 _buildContainer(
//                   14.0,
//                   MyTextStyle.width40,
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 6.0,
//             ),
//             _buildContainer(
//               12.0,
//               MyTextStyle.width40,
//             ),
//             const SizedBox(
//               height: 6.0,
//             ),
//             _buildContainer(
//               MyTextStyle.height40,
//               Get.width / 2,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
