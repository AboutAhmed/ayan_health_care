// import 'package:ayan_healthcare/app/ui/widgets/images_widgets/image_picker_bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../assets/styles/my_Images.dart';
// import '../../../../../assets/styles/my_colors.dart';


// class ProfilePhoto extends StatelessWidget {
//   const ProfilePhoto({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<ProfileSettingController>();
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           height: 100.0,
//           width: 100.0,
//           margin: const EdgeInsets.only(
//             top: 8.0,
//             bottom: 16.0,
//           ),
//           // padding: EdgeInsets.all(4),
//           decoration: BoxDecoration(
//             border: Border.all(
//               width: 0.3,
//               color: Colors.grey.withOpacity(0.5),
//             ),
//             shape: BoxShape.circle,
//           ),
//           child: ClipRRect(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(
//                 80.0,
//               ),
//             ),
//             child: FadeInImage.assetNetwork(
//               fadeInCurve: Curves.easeIn,
//               placeholder: MyImages.user,
//               image: controller.imagePath.value ?? "",
//               fit: BoxFit.cover,
//               imageErrorBuilder: (_, __, ___) {
//                 return Image.asset(
//                   MyImages.user,
//                 );
//               },
//             ),
//           ),
//         ),
//         Positioned(
//           bottom: 12,
//           right: 0,
//           child: GestureDetector(
//             onTap: () {
//               Get.bottomSheet(
//                 ImagePickerBottomSheet(
//                   title: "Profile Photo",
//                   onCameraTap: controller.cameraTap,
//                   onGalleryTap: controller.galleryTap,
//                   viewPhoto: controller.viewProfile,
//                   removePhoto: controller.removePhoto,
//                   isShow: controller.imagePath.value?.isNotEmpty,
//                 ),
//               );
//             },
//             child: Container(
//               height: 40.0,
//               width: 40.0,
//               decoration: const BoxDecoration(
//                 color: AppColors.primaryColor,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.camera_alt,
//                 size: 22.0,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
