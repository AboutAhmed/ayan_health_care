// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instacare/app/controllers/booking/lab/lab_test_cart_controller.dart';
// import 'package:instacare/app/ui/widgets/pkr_widget.dart';
// import 'package:instacare/assets/styles/text_styles//text_styles.dart';

// import '../../../assets/styles/my_colors.dart';
// import '../../models/lab/search_lab_test_model.dart';
// import '../../routes/routes.dart';
// import 'custom_card.dart';

// class TestCard extends StatelessWidget {
//   final Test labTest;
//   final EdgeInsets? margin;

//   const TestCard({Key? key, required this.labTest, this.margin}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final LabTestCartController controller = Get.find();
//     return GestureDetector(
//       onTap: () {
//         Get.toNamed(
//           AppRoutes.testDetail,
//           arguments: labTest,
//         );
//       },
//       child: CustomCard(
//         radius: 12.0,
//         margin: margin ?? const EdgeInsets.only(right: 12.0,),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                   if (!GetUtils.isNullOrBlank(labTest.imagePath)!)
//                     Center(
//                       child: ClipOval(
//                         child: Image.network(
//                           labTest.imagePath!,
//                           height: 50,
//                           width: 50,
//                           // color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   if (!GetUtils.isNullOrBlank(labTest.imagePath)!)
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                   if (GetUtils.isNullOrBlank(labTest.imagePath)!)
//                     Center(
//                       child: Icon(
//                         Icons.medical_services_outlined,
//                         size: MyTextStyle.height34,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   if (GetUtils.isNullOrBlank(labTest.imagePath)!)
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 8.0,
//                       ),
//                       Text(
//                         labTest.testName!,
//                         style: Get.theme.textTheme.bodyLarge!.copyWith(
//                           overflow: TextOverflow.visible,
//                         ),
//                         maxLines: 1,
//                       ),
//                       const SizedBox(
//                         height: 4,
//                       ),
//                       RichText(
//                         maxLines: 1,
//                         text: TextSpan(
//                           text: labTest.knownAs,
//                           style: Get.theme.textTheme.bodySmall!.copyWith(
//                             color: MyColors.primaryColor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 6.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       PKRWidget(
//                         amount: labTest.fee,
//                         align: TextAlign.start,
//                         style: Get.theme.textTheme.bodyMedium?.copyWith(
//                           color: Colors.grey,
//                           decoration: TextDecoration.lineThrough,
//                           decorationThickness: 2.0,
//                         ),
//                       ),
//                       RichText(
//                         text: TextSpan(
//                           text: "${labTest.discount}% OFF",
//                           style: Get.theme.textTheme.bodyMedium!.copyWith(
//                             color: MyColors.greenLight,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 6.0,
//                   ),
//                   PKRWidget(
//                     amount: labTest.discountedPrice?.split('.').first,
//                     align: TextAlign.start,
//                     style: Get.theme.textTheme.titleMedium!.copyWith(
//                       color: Colors.black87,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Obx(
//               () {
//                 Test? tests = controller.tests
//                     .firstWhereOrNull((element) => element.id == labTest.id);
//                 if (controller.tests.isNotEmpty && tests != null) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (labTest.productQuantity >= 0 &&
//                                   labTest.productQuantity < 10) {
//                                 labTest.productQuantity.value++;
//                               }
//                             },
//                             child: const Icon(
//                               Icons.add,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             width: 20,
//                             color: Colors.white,
//                             child: Obx(
//                               () => Text(
//                                 '${labTest.productQuantity.value}',
//                               ),
//                             ),
//                           ),
//                         ),
//                         labTest.productQuantity.value != 1
//                             ? Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     labTest.productQuantity.value--;
//                                   },
//                                   child: const Icon(
//                                     Icons.remove,
//                                   ),
//                                 ),
//                               )
//                             : Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     if (labTest.productQuantity.value <= 1) {
//                                       Get.defaultDialog(
//                                         title: 'Confirmation',
//                                         confirmTextColor: Colors.white,
//                                         middleText:
//                                             'Are you sure you want to remove?',
//                                         onCancel: () {},
//                                         onConfirm: () async {
//                                           Get.find<LabTestCartController>()
//                                               .removeFromCart(labTest);
//                                           Get.back();
//                                         },
//                                       );
//                                     } else {
//                                       labTest.productQuantity.value--;
//                                     }
//                                   },
//                                   child: const Icon(
//                                     Icons.delete,
//                                   ),
//                                 ),
//                               )
//                       ],
//                     ),
//                   );
//                 }
//                 return SizedBox(
//                   width: Get.width,
//                   child: labTest.onboard == true ? Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                     ),
//                     child: OutlinedButton(
//                       onPressed: () =>
//                           Get.find<LabTestCartController>().addToCart(labTest),
//                       child: const Text('Add to Cart'),
//                     ),
//                   ) : const SizedBox.shrink(),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String countDiscount(String fee) {
//     int price = int.tryParse(fee.replaceAll("Rs/- ", ''))!;
//     int discount = (price * .10).round();
//     return "Rs/- ${price - discount}";
//   }
// }
