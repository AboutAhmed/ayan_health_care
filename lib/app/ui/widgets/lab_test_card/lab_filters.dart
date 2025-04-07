// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instacare/app/ui/widgets/custom_leading_icon.dart';

// import '../../../../assets/styles/my_colors.dart';
// import '../../../../assets/styles/text_styles/text_styles.dart';
// import '../../../controllers/booking/lab/lab_test_filter_controller.dart';
// import '../../../controllers/booking/lab/lab_test_home_controller.dart';
// import '../../../models/lab/lab_model.dart';
// import '../common/filter_widget.dart';
// import '../custom_card.dart';
// import '../dialogs/loading_progress.dart';

// class LabFilters extends StatelessWidget implements PreferredSizeWidget {
//   const LabFilters({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final LabTestFilterController filterController = Get.find();
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(
//         16.0,
//         16.0,
//         16.0,
//         12.0,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Obx(() {
//             return TextFormField(
//               keyboardType: TextInputType.text,
//               textInputAction: TextInputAction.search,
//               controller: filterController.searchController,
//               onChanged: (text) {
//                 filterController.debounce(() {
//                   filterController.onApplyFilter();
//                 });
//               },
//               maxLength: 150,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   // borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(
//                     30.0,
//                   ),
//                 ),
//                 hintText: "Search Lab Test",
//                 hintStyle: Get.textTheme.bodyMedium?.copyWith(
//                   color: Colors.grey,
//                 ),
//                 prefixIcon: const Icon(
//                   Icons.search,
//                 ),
//                 suffixIcon: filterController.hasClosing.value
//                     ? GestureDetector(
//                         onTap: () {
//                           Get.focusScope!.unfocus();
//                           filterController.searchController.clear();
//                           filterController.onApplyFilter();
//                         },
//                         child: const Icon(
//                           Icons.clear,
//                         ),
//                       )
//                     : null,
//                 counterText: '',
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             );
//           }),
//           const SizedBox(
//             height: 12.0,
//           ),
//           Obx(() {
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Obx(() {
//                   return Expanded(
//                     child: FilterWidget(
//                       title: filterController.selectedLab.value ?? "Select Lab",
//                       onTap: () {
//                         filterController.filterBottomSheet(
//                           widget: Expanded(
//                             child: ListView.builder(
//                               shrinkWrap: true,
//                               physics: const ScrollPhysics(),
//                               padding: const EdgeInsets.fromLTRB(
//                                 16.0,
//                                 8.0,
//                                 16.0,
//                                 16.0,
//                               ),
//                               itemBuilder: (_, index) {
//                                 LabsModel lab =
//                                     Get.find<LabTestHomeController>()
//                                         .labs[index];
//                                 bool selected =
//                                     filterController.labModel == lab;
//                                 return CustomCard(
//                                   onPressed: () {
//                                     filterController.selectedLab.value =
//                                         lab.name;
//                                     filterController.labModel = lab;
//                                     filterController.appBarTitle(lab.name);
//                                     filterController.onApplyFilter();
//                                     filterController.hasFilter.value = true;

//                                     Get.back();
//                                   },
//                                   margin: const EdgeInsets.only(
//                                     bottom: 12.0,
//                                   ),
//                                   child: ListTile(
//                                     selected: selected,
//                                     contentPadding: const EdgeInsets.symmetric(
//                                       vertical: 8.0,
//                                       horizontal: 16.0,
//                                     ),
//                                     shape: selected
//                                         ? RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(12.0),
//                                             side: BorderSide(
//                                               color: Get.theme.primaryColor,
//                                             ),
//                                           )
//                                         : null,
//                                     title: Text(
//                                       lab.name,
//                                       style: Get.theme.textTheme.titleSmall
//                                           ?.copyWith(
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     trailing: Container(
//                                       decoration: BoxDecoration(
//                                         color: selected
//                                             ? MyColors.primaryColor
//                                             : Colors.blue.shade50,
//                                         borderRadius: const BorderRadius.only(
//                                           topRight: Radius.circular(
//                                             8.0,
//                                           ),
//                                           bottomLeft: Radius.circular(
//                                             8.0,
//                                           ),
//                                         ),
//                                       ),
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 6.0,
//                                         vertical: 4.0,
//                                       ),
//                                       child: Text(
//                                         "${lab.maxDiscount}% OFF",
//                                         style:
//                                             Get.textTheme.titleSmall?.copyWith(
//                                           color: selected
//                                               ? Colors.white
//                                               : MyColors.accentColor,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ),
//                                     leading: SizedBox(
//                                       height: 50.0,
//                                       width: 50.0,
//                                       child: CachedNetworkImage(
//                                         imageUrl: lab.imagePath ?? "",
//                                         imageBuilder:
//                                             (context, imageProvider) =>
//                                                 Container(
//                                           height: MyTextStyle.height30,
//                                           width: MyTextStyle.height30,
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             image: DecorationImage(
//                                               image: imageProvider,
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                         placeholder: (context, url) =>
//                                             const LoadingProgress(
//                                           size: 40.0,
//                                         ),
//                                         errorWidget: (_, __, ___) =>
//                                             CustomLeadingIcon(
//                                           title: lab.name,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                               itemCount:
//                                   Get.find<LabTestHomeController>().labs.length,
//                             ),
//                           ),
//                           title: "Select Lab",
//                         );
//                       },
//                     ),
//                   );
//                 }),
//                 const SizedBox(
//                   width: 12.0,
//                 ),
//                 Obx(() {
//                   return Expanded(
//                     child: FilterWidget(
//                       title: filterController.selectedRange.value ??
//                           'Select Range',
//                       onTap: () {
//                         filterController.filterBottomSheet(
//                           widget: ListView.builder(
//                               shrinkWrap: true,
//                               physics: const ScrollPhysics(),
//                               itemCount: filterController.rangeList.length,
//                               itemBuilder: (_, int index) {
//                                 var range = filterController.rangeList[index];
//                                 return ListTile(
//                                   onTap: () {
//                                     filterController.selectedRange.value =
//                                         range;
//                                     filterController.hasFilter.value = true;
//                                     filterController.onApplyFilter();
//                                     Get.back();
//                                   },
//                                   title: Text(
//                                     range,
//                                   ),
//                                 );
//                               }),
//                           title: "Select Price Range",
//                         );
//                       },
//                     ),
//                   );
//                 }),
//                 if (filterController.hasFilter.value)
//                   const SizedBox(
//                     width: 12.0,
//                   ),
//                 if (filterController.hasFilter.value)
//                   GestureDetector(
//                     onTap: filterController.resetFilter,
//                     child: const Text(
//                       'RESET',
//                       style: TextStyle(
//                         color: MyColors.accentColor,
//                       ),
//                     ),
//                   )
//               ],
//             );
//           })
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(100.0);
// }
