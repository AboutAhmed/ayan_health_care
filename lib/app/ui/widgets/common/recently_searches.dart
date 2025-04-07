// import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:instacare/app/controllers/common/recently_searches_controller.dart';
// import 'package:instacare/app/models/doctors/category_model.dart';
// import 'package:instacare/app/ui/widgets/custom_card.dart';
// import 'package:instacare/assets/styles/my_colors.dart';
// import '../../../../assets/app_theme_info.dart';

// class RecentlySearches extends StatelessWidget {
//   final bool onlyLab, atHome, atSpeciality, atQR, atPharmacy;

//   const RecentlySearches({
//     Key? key,
//     required this.onlyLab,
//     required this.atHome,
//     required this.atSpeciality,
//     required this.atQR,
//     required this.atPharmacy,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final RecentlySearchController controller =
//         Get.find<RecentlySearchController>();
//     return Obx(
//       () {
//         if (controller.searches.isNotEmpty) {
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (atHome)
//                 AspectRatio(
//                   aspectRatio: 24 / 3,
//                   child: Obx(
//                     () => ListView.builder(
//                       shrinkWrap: true,
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder: (_, int index) {
//                         int reversedIndex = atHome
//                             ? controller.onlyHomeSearches.length - index - 1
//                             : controller.searches.length - index - 1;
//                         RecentSearchesModel searchesModel = atHome
//                             ? controller.onlyHomeSearches[reversedIndex]
//                             : controller.searches[reversedIndex];
//                         return GestureDetector(
//                           onTap: () => controller.onHistoryPress(
//                             searchesModel,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 8.0),
//                             child: Chip(
//                               label: Text(
//                                 searchesModel.nameShort,
//                               ),
//                               avatar: ClipOval(
//                                 child: CachedNetworkImage(
//                                   imageUrl: searchesModel.image ?? "",
//                                   fit: BoxFit.cover,
//                                   height: 30,
//                                   width: 30,
//                                   errorWidget: (_, __, ___) => const Icon(
//                                     Icons.account_circle,
//                                   ),
//                                 ),
//                               ),
//                               onDeleted: () => controller.removeHistory(
//                                 "${searchesModel.id}",
//                               ),
//                               deleteIcon: const Icon(
//                                 Icons.highlight_remove_rounded,
//                                 size: 16,
//                               ),
//                               backgroundColor: Colors.white,
//                               deleteIconColor: Colors.grey,
//                               side: BorderSide(
//                                 color: Colors.grey.shade300,
//                               ),
//                               padding: const EdgeInsets.only(
//                                 left: 8,
//                                 top: 4,
//                                 bottom: 4,
//                                 right: 4,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       padding: const EdgeInsets.only(top: 8),
//                       scrollDirection: Axis.horizontal,
//                       itemCount: atHome
//                           ? controller.onlyHomeSearches.length
//                           : controller.searches.length,
//                     ),
//                   ),
//                 ),
//               if (onlyLab)
//                 AspectRatio(
//                   aspectRatio: 24 / 3,
//                   child: Obx(
//                     () => ListView.builder(
//                         itemBuilder: (_, int index) {
//                           int reversedIndex = onlyLab
//                               ? controller.labSearches.length - index - 1
//                               : controller.searches.length - index - 1;

//                           RecentSearchesModel searchesModel = onlyLab
//                               ? controller.labSearches[reversedIndex]
//                               : controller.searches[reversedIndex];
//                           return GestureDetector(
//                             onTap: () =>
//                                 controller.onHistoryPress(searchesModel),
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 8),
//                               child: Chip(
//                                 label: Text(
//                                   searchesModel.nameShort,
//                                 ),
//                                 avatar: ClipOval(
//                                   child: CachedNetworkImage(
//                                     imageUrl: searchesModel.image ?? "",
//                                     fit: BoxFit.contain,
//                                     errorWidget: (_, __, ___) => const Icon(
//                                       Icons.account_circle,
//                                     ),
//                                   ),
//                                 ),
//                                 onDeleted: () =>
//                                     controller.removeHistory(searchesModel.id!),
//                                 backgroundColor: Colors.white,
//                                 deleteIconColor: Colors.grey,
//                                 side: BorderSide(
//                                   color: Colors.grey.shade300,
//                                 ),
//                                 padding: const EdgeInsets.only(
//                                   left: 8,
//                                   top: 4,
//                                   bottom: 4,
//                                   right: 4,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         padding: const EdgeInsets.only(
//                           top: 8.0,
//                         ),
//                         scrollDirection: Axis.horizontal,
//                         itemCount: onlyLab
//                             ? controller.labSearches.length
//                             : controller.searches.length),
//                   ),
//                 ),
//               if (atSpeciality)
//                 AspectRatio(
//                   aspectRatio: 16 / 4,
//                   child: Obx(
//                     () => ListView.builder(
//                         itemBuilder: (_, int index) {
//                           int reversIndex = atSpeciality
//                               ? controller.onlyCategoriesSearches.length -
//                                   index -
//                                   1
//                               : controller.searches.length - index - 1;

//                           RecentSearchesModel searchesModel = atSpeciality
//                               ? controller.onlyCategoriesSearches[reversIndex]
//                               : controller.searches[reversIndex];

//                           return GestureDetector(
//                             onTap: () =>
//                                 controller.onHistoryPress(searchesModel),
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 16.0,),
//                               child: Stack(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           border: Border.all(
//                                             width: 0.3,
//                                             color: Colors.grey.shade300,
//                                           ),
//                                           shape: BoxShape.circle,
//                                         ),
//                                         child: ClipOval(
//                                           child: CachedNetworkImage(
//                                             imageUrl: searchesModel.image ?? "",
//                                             fit: BoxFit.cover,
//                                             height: 45,
//                                             width: 45,
//                                             errorWidget: (_, __, ___) =>
//                                                 const Icon(
//                                               Icons.account_circle,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: SizedBox(
//                                           width: 50,
//                                           child: Text(
//                                             searchesModel.nameShort,
//                                             textAlign: TextAlign.center,
//                                             maxLines: 2,
//                                             style: Get
//                                                 .theme.textTheme.labelMedium!
//                                                 .copyWith(),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Positioned(
//                                     top: 0,
//                                     right: 0,
//                                     child: GestureDetector(
//                                       onTap: () => controller.removeHistory(
//                                         searchesModel.id!,
//                                       ),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.grey.shade100,
//                                         ),
//                                         child: const Padding(
//                                           padding: EdgeInsets.all(2.0),
//                                           child: Icon(
//                                             Icons.close,
//                                             size: 12,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                         scrollDirection: Axis.horizontal,
//                         itemCount: atSpeciality
//                             ? controller.onlyCategoriesSearches.length
//                             : controller.searches.length),
//                   ),
//                 ),
//               if (atQR)
//                 AspectRatio(
//                   aspectRatio: 8 / 3,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemBuilder: (_, int index) {
//                       int reversIndex = atQR
//                           ? controller.searchesOnlyQr.length - index - 1
//                           : controller.searches.length - index - 1;
//                       RecentSearchesModel searchesModel = atQR
//                           ? controller.searchesOnlyQr[reversIndex]
//                           : controller.searches[reversIndex];
//                       return SizedBox(
//                         width: Get.size.width / 2,
//                         child: CustomCard(
//                           margin: const EdgeInsets.only(left: 16),
//                           onPressed: () {
//                             Clipboard.setData(
//                               ClipboardData(
//                                 text: searchesModel.id.toString(),
//                               ),
//                             );
//                             Fluttertoast.showToast(
//                               msg: "Copy to Clipboard",
//                             );
//                           },
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 left: 14,
//                                 top: 12,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     ClipOval(
//                                       child: CachedNetworkImage(
//                                         imageUrl: searchesModel.image ?? "",
//                                         height: 32,
//                                         fit: BoxFit.contain,
//                                         errorWidget: (_, __, ___) => const Icon(
//                                           Icons.account_circle,
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 14,
//                                     ),
//                                     Text(
//                                       jsonDecode(searchesModel.model!)["Name"],
//                                       style: Get.theme.textTheme.titleSmall
//                                           ?.copyWith(
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 6,
//                                     ),
//                                     Text(
//                                       searchesModel.id.toString(),
//                                       style: Get.theme.textTheme.headlineSmall
//                                           ?.copyWith(),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Positioned(
//                                 right: 0,
//                                 top: 0,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 80,
//                                   ),
//                                   child: Align(
//                                     alignment: Alignment.topRight,
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.blue.shade50,
//                                         borderRadius: BorderRadius.only(
//                                           topRight: Radius.circular(
//                                             AppThemeInfo.borderRadius,
//                                           ),
//                                           bottomLeft: Radius.circular(
//                                             AppThemeInfo.borderRadius,
//                                           ),
//                                         ),
//                                       ),
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 6,
//                                         vertical: 4,
//                                       ),
//                                       child: Text(
//                                         (jsonDecode(searchesModel.model!)[
//                                                     "MaxDiscount"] ??
//                                                 "") +
//                                             "% OFF",
//                                         style:
//                                             Get.textTheme.titleSmall?.copyWith(
//                                           color: MyColors.accentColor,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     padding: const EdgeInsets.all(8.0),
//                     scrollDirection: Axis.horizontal,
//                     itemCount: atQR
//                         ? controller.searchesOnlyQr.length
//                         : controller.searches.length,
//                   ),
//                 ),
//               if (atPharmacy)
//                 AspectRatio(
//                   aspectRatio: 24 / 3,
//                   child: Obx(
//                     () => ListView.builder(
//                         itemBuilder: (_, int index) {
//                           int reversIndex = atPharmacy
//                               ? controller.pharmacySearches.length - index - 1
//                               : controller.searches.length - index - 1;

//                           RecentSearchesModel searchesModel = atPharmacy
//                               ? controller.pharmacySearches[reversIndex]
//                               : controller.searches[reversIndex];
//                           return GestureDetector(
//                             onTap: () =>
//                                 controller.onHistoryPress(searchesModel),
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 8),
//                               child: Chip(
//                                 label: Text(
//                                   searchesModel.nameShort,
//                                 ),
//                                 avatar: ClipOval(
//                                   child: CachedNetworkImage(
//                                     imageUrl: searchesModel.image ?? "",
//                                     fit: BoxFit.contain,
//                                     errorWidget: (_, __, ___) => const Icon(
//                                       Icons.account_circle,
//                                     ),
//                                   ),
//                                 ),
//                                 onDeleted: () =>
//                                     controller.removeHistory(searchesModel.id!),
//                                 backgroundColor: Colors.white,
//                                 deleteIconColor: Colors.grey,
//                                 side: BorderSide(
//                                   color: Colors.grey.shade300,
//                                 ),
//                                 padding: const EdgeInsets.only(
//                                   left: 8,
//                                   top: 4,
//                                   bottom: 4,
//                                   right: 4,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         padding: const EdgeInsets.only(top: 8),
//                         scrollDirection: Axis.horizontal,
//                         itemCount: atPharmacy
//                             ? controller.pharmacySearches.length
//                             : controller.searches.length),
//                   ),
//                 ),
//             ],
//           );
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
