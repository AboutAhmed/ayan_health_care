import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PaymentWebViewShimmer extends StatelessWidget {
  const PaymentWebViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4,
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _sizedBox(),
              Container(
                width: Get.width,
                height: MyTextStyle.height40,
                padding: EdgeInsets.symmetric(
                  horizontal: MyTextStyle.height80,
                  vertical: 12.0,
                ),
                child: _container(
                  width: Get.width / 3,
                  height: 24.0,
                ),
              ),
              SizedBox(
                height: MyTextStyle.height25,
              ),
              Container(
                width: Get.width,
                height: MyTextStyle.height65,
                padding: EdgeInsets.symmetric(
                  horizontal: MyTextStyle.height80,
                  vertical: 12.0,
                ),
                child: _container(
                  width: Get.width / 1,
                  height: 8.0,
                ),
              ),
              SizedBox(
                height: MyTextStyle.height60,
              ),
              Container(
                width: Get.width,
                // height: MyTextStyle.height120 + MyTextStyle.height120,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: MyTextStyle.height70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _container(
                            height: 8.0,
                            width: Get.width / 4,
                          ),
                          SizedBox(
                            height: MyTextStyle.height30,
                          ),
                          SizedBox(
                            width: Get.width,
                            height: MyTextStyle.height32,
                            child: Row(
                              children: [
                                Expanded(
                                  child: _container(
                                    width: Get.width,
                                    height: Get.height,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: _container(
                                    width: Get.width,
                                    height: Get.height,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MyTextStyle.height50,
                    ),
                    _container(
                      height: 8.0,
                      width: Get.width / 4,
                    ),
                    _sizedBox(),
                    _container(
                      height: MyTextStyle.height25,
                      width: Get.width,
                    ),
                    _sizedBox(),
                    _container(
                      height: 8.0,
                      width: Get.width / 4,
                    ),
                    _sizedBox(),
                    _container(
                      height: MyTextStyle.height25,
                      width: Get.width,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _container({double? width, double? height}) {
    return Container(
      color: Colors.white,
      height: height,
      width: width,
    );
  }

  Widget _sizedBox() {
    return const SizedBox(
      height: 24.0,
    );
  }
}
