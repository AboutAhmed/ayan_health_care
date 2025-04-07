import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt current = RxInt(0);
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        onPageChanged: (index, reason) {
          current(index);
        },
        aspectRatio: 2.1,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(seconds: 3),
        viewportFraction: 1.0,
      ),
      items: images
          .map((imagePath) => GestureDetector(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //   onTap: () =>
                //       navigateCorrespondingBanner(images.indexOf(imagePath)),
              ))
          .toList(),
    );
  }

  // void navigateCorrespondingBanner(int index) {
  //   if (index == 0) {
  //     Get.toNamed(
  //       AppRoutes.hospitalProfile,
  //       arguments: "sehat-sahulat",
  //     );
  //   } else if (index == 2) {
  //     Get.toNamed(AppRoutes.categories);
  //   } else if (index == 3) {
  //     Get.toNamed(AppRoutes.labTestHome);
  //   }
  // }

  List<String> get images => [
        'assets/images/banners/home_banner4.png',
        'assets/images/banners/home_banner1.png',
        'assets/images/banners/home_banner2.png',
        'assets/images/banners/home_banner3.png',
      ];
}
