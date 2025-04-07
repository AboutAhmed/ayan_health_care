// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:photo_view/photo_view.dart';

// class ZoomImage extends StatelessWidget {
//   final String? image, heroId, name;

//   const ZoomImage({
//     Key? key,
//     this.image,
//     this.heroId,
//     this.name,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           name ?? "",
//         ),
//       ),
//       body: determineContentType(),
//     );
//   }

//   Widget determineContentType() {
//     if (image != null && image!.toLowerCase().endsWith('.pdf')) {
//       return const PDF(
//         swipeHorizontal: true,
//       ).cachedFromUrl(image!);
//     } else if (image != null) {
//       return PhotoView(
//         imageProvider: CachedNetworkImageProvider(image!),
//         minScale: PhotoViewComputedScale.contained * 0.8,
//         maxScale: PhotoViewComputedScale.covered * 2,
//         heroAttributes: PhotoViewHeroAttributes(
//           tag: heroId!,
//         ),
//       );
//     } else {
//       return const Center(
//         child: Text('Something went wrong'),
//       );
//     }
//   }
// }
