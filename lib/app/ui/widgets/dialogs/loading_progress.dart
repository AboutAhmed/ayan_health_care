import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:flutter/material.dart';


class LoadingProgress extends StatelessWidget {
  final double? size;
  const LoadingProgress({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCard(
        radius: 50.0,
        child: Container(
          padding: const EdgeInsets.all(
            8.0,
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0.0,
                left: 0.0,
                top: 0.0,
                bottom: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Image.asset(
                    MyImages.loadingWhiteGif,
                    height: 40.0,
                  ),
                ),
              ),
              SizedBox(
                height: size ?? 50.0,
                width: size ?? 50.0,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
