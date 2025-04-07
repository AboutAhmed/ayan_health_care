import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class AppBarSearchWidget extends StatelessWidget {
//   const AppBarSearchWidget({
//     super.key,
//     this.onTap,
//     this.hintText = "Search",
//     required this.heroId,
//     this.controller, // Add controller parameter
//   });

//   final VoidCallback? onTap;
//   final String hintText;
//   final String heroId;
//   final TextEditingController? controller; // Controller for the text field

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller, // Use the controller
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(color: AppColors.fillColor), // Border color
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(
//               color: AppColors.fillColor), // Border color when enabled
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30.0),
//           borderSide: const BorderSide(
//               color: AppColors.primaryColor), // Border color when focused
//         ),
//         fillColor: AppColors.fillColor, // Fill color
//         filled: true,
//         hintText: hintText,
//         hintStyle: Get.textTheme.bodyLarge?.copyWith(
//           color: Colors.grey,
//         ),
//         prefixIcon: const Icon(
//           Icons.search,
//         ),
//       ),
//     );
//   }
// }
 Widget buildSearchBar({
    required TextEditingController controller,
    required String hintText,
    required Function onSearch,
    required Function onClear,
    required bool showSuffix,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: TextInputType.text,
        maxLength: 150,
        onEditingComplete: Get.focusScope?.unfocus,
        onFieldSubmitted: (query) {
          onClear();
          onSearch();
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: false,
          hintText: hintText,
          counterText: "",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: showSuffix
              ? GestureDetector(
                  onTap: () {
                    Get.focusScope?.unfocus();
                    controller.clear();
                    onClear();
                    onSearch();
                  },
                  child: const Icon(Icons.close),
                )
              : null,
        ),
      ),
    );
  }
