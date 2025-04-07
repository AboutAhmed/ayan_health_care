// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../models/lab/search_lab_test_model.dart';

// class LabTestMyBookingTile extends StatelessWidget {
//   const LabTestMyBookingTile({
//     Key? key,
//     required this.test,
//     required this.counter,
//   }) : super(key: key);

//   final MyTestOrderModel test;
//   final int counter;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: const EdgeInsets.only(
//         right: 12,
//       ),
//       title: Text(
//         test.productName.trim(),
//         maxLines: 2,
//         overflow: TextOverflow.ellipsis,
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             test.labName ?? "N/A",
//             overflow: TextOverflow.ellipsis,
//             softWrap: false,
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           Text(
//             "${test.productQuantity} x ${test.price} PKR ",
//             style: Get.textTheme.bodySmall?.copyWith(
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//       isThreeLine: true,
//       trailing: Text(
//         "${test.discountPercent}% OFF",
//         style: Get.textTheme.bodyLarge?.copyWith(
//           color: Colors.redAccent,
//         ),
//       ),
//       horizontalTitleGap: 8,
//       leading: SizedBox(
//         width: 20,
//         child: Align(
//           alignment: Alignment.centerRight,
//           child: Text(
//             '$counter',
//             style: Get.theme.textTheme.titleSmall!.copyWith(
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//       dense: true,
//     );
//   }
// }
