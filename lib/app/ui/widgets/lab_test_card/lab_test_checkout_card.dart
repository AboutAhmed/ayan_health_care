// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:instacare/app/controllers/booking/lab/lab_test_cart_controller.dart';
// import 'package:instacare/app/ui/widgets/custom_card.dart';
// import 'package:instacare/app/ui/widgets/pkr_widget.dart';
// import 'package:instacare/assets/styles/my_colors.dart';

// import '../../../models/lab/search_lab_test_model.dart';

// class LabTestCardCheckout extends StatelessWidget {
//   final Test test;
//   final bool editAble;

//   const LabTestCardCheckout(
//       {Key? key, required this.test, this.editAble = true})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomCard(
//       radius: 12.0,
//       margin: const EdgeInsets.only(bottom: 8, right: 4, left: 4, top: 4),
//       child: ListTile(
//         leading: Image.network(
//           test.imagePath!,
//           width: 80,
//           height: 80,
//         ),
//         title: Text(
//           test.testName!,
//           maxLines: 1,
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "${test.labName} ${test.homeSample}",
//               style: Get.theme.textTheme.bodySmall!.copyWith(
//                 color: MyColors.primaryColor,
//               ),
//               maxLines: 1,
//             ),
//             PKRWidget(
//               amount: test.discountedPrice.toString(),
//               align: TextAlign.start,
//               style: Get.theme.textTheme.titleMedium!.copyWith(
//                 color: Colors.black87,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Row(
//               children: [
//                 PKRWidget(
//                   amount: test.fee,
//                   align: TextAlign.start,
//                   style: Get.theme.textTheme.bodyMedium!.copyWith(
//                     color: Colors.grey,
//                     decoration: TextDecoration.lineThrough,
//                     decorationThickness: 2.0,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 6,
//                 ),
//                 Flexible(
//                   child: Text(
//                     "Saving ${test.discount}%",
//                     style: Get.textTheme.bodyMedium?.copyWith(
//                       color: MyColors.greenLight,
//                     ),
//                     maxLines: 1,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//         trailing: editAble
//             ? Obx(() => Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         if (test.productQuantity.value <= 1) {
//                           Get.defaultDialog(
//                             title: 'Confirmation',
//                             middleText: 'Are you sure you want to remove?',
//                             confirmTextColor: Colors.white,
//                             onCancel: () {},
//                             onConfirm: () async {
//                               Get.find<LabTestCartController>()
//                                   .removeFromCart(test);
//                               Get.back();
//                             },
//                           );
//                         } else {
//                           test.productQuantity.value--;
//                         }
//                       },
//                       child: test.productQuantity.value == 1
//                           ? const Icon(
//                               Icons.delete,
//                               size: 20.0,
//                               color: MyColors.lightBlue,
//                             )
//                           : const Icon(
//                               Icons.remove_circle_outline_rounded,
//                               size: 20.0,
//                               color: MyColors.lightBlue,
//                             ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                       ),
//                       child: Text(test.productQuantity.value.toString()),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         test.productQuantity.value++;
//                       },
//                       child: const Icon(
//                         Icons.add_circle_outline_rounded,
//                         size: 20.0,
//                         color: MyColors.lightBlue,
//                       ),
//                     ),
//                   ],
//                 ))
//             : Text(
//                 "qty. ${test.productQuantity.value}",
//                 style: Get.textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//         isThreeLine: true,
//         contentPadding: const EdgeInsets.only(
//           right: 8,
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
