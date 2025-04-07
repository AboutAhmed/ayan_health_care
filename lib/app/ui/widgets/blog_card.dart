// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../routes/routes.dart';
// import 'dialogs/loading_progress.dart';

// class BlogCard extends StatelessWidget {
//   final Blog blog;

//   const BlogCard({
//     Key? key,
//     required this.blog,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 2,
//       child: InkWell(
//         onTap: () => Get.toNamed(
//           AppRoutes.webview,
//           arguments: [
//             blog.url,
//             blog.title,
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 8.0,
//             horizontal: 16.0,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Expanded(
//                 child: ListTile(
//                   contentPadding: EdgeInsets.zero,
//                   leading: SizedBox(
//                     width: 100.0,
//                     child: CachedNetworkImage(
//                       imageBuilder: (context, imageProvider) {
//                         return Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                               12.0,
//                             ),
//                             image: DecorationImage(
//                               image: imageProvider,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       },
//                       imageUrl: "${blog.featuredImage}",
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => const LoadingProgress(
//                         size: 40.0,
//                       ),
//                     ),
//                   ),
//                   title: Text(
//                     blog.title,
//                     maxLines: 2,
//                     style: Get.theme.textTheme.bodyLarge,
//                   ),
//                   subtitle: Text(
//                     blog.date,
//                     style: Get.theme.textTheme.bodySmall!,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   blog.excerpt,
//                   maxLines: 4,
//                   style: Get.theme.textTheme.titleSmall!.copyWith(
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
