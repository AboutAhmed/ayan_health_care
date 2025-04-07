import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabBanners extends StatelessWidget {
  const LabBanners({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt current = RxInt(0);
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        onPageChanged: (index, reason) {
          current(index);
        },
        aspectRatio: 14 / 6,
        autoPlayInterval: const Duration(seconds: 8),
        autoPlayAnimationDuration: const Duration(seconds: 3),
        viewportFraction: 1.0,
      ),
      items: _imageList.map(
        (map) {
          Color color = Color(map['Color']);
          return Container(
            padding: const EdgeInsets.only(right: 4.0),
            margin: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            child: Image.asset(
              map["ImagePath"],
              fit: BoxFit.contain,
            ),
          );
        },
      ).toList(),
    );
  }

  List<Map<String, dynamic>> get _imageList => [
        {
          "ImagePath": 'assets/images/banners/lab-test-banner-1.png',
          "Color": 0xFFF7F8F9
        },
        {
          "ImagePath": 'assets/images/banners/lab-test-banner-2.png',
          "Color": 0xFFF091B8D
        },
        {
          "ImagePath": 'assets/images/banners/lab-test-banner-3.png',
          "Color": 0xFFF7F8F9
        }
      ];
}
