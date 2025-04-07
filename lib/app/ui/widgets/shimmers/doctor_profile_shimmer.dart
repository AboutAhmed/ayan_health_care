import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DoctorProfileShimmer extends StatelessWidget {
  final double heightFor;

  const DoctorProfileShimmer({super.key, required this.heightFor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Shimmer.fromColors(
            baseColor: AppColors.shimmerBaseColor,
            highlightColor: AppColors.shimmerHighlightColor,
            child: Stack(
              children: [
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    top: heightFor,
                    left: 16.0,
                    right: 16.0,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            12.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          fourteenSpacerVertically(),
                          _helperContainer(height: 16, width: 200, radius: 10),
                          fourteenSpacerVertically(),
                          _helperContainer(height: 16, width: 150, radius: 10),
                          fourteenSpacerVertically(),
                          _helperContainer(
                              height: 0.5, width: Get.width, radius: 5),
                          fourteenSpacerVertically(),
                          _helperContainer(height: 16, width: 200, radius: 10),
                          fourteenSpacerVertically(),
                          _helperContainer(
                              height: 0.5, width: Get.width, radius: 5),
                          fourteenSpacerVertically(),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.white,
                                  width: 60,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                                _helperContainer(
                                    height: 24, width: 1, radius: 5),
                                Container(
                                  width: 60,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                                _helperContainer(
                                    height: 24, width: 1, radius: 5),
                                Container(
                                  width: 60,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          widgetSpacerVertically(),
                        ],
                      ),
                    ),
                    sectionSmallSpacerVertically(),
                    widgetSpacerVertically(),
                    ListTile(
                      leading:
                          _helperContainer(height: 35, width: 40, radius: 6.0),
                      title: _helperContainer(height: 16.0, width: 16),
                      contentPadding: EdgeInsets.zero,
                    ),
                    sectionSmallSpacerVertically(),
                    _helperContainer(
                        height: 18, width: size.width * 0.4, radius: 10),
                    widgetSpacerVertically(),
                    ListView.builder(
                      itemBuilder: (_, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _helperContainer(width: 60),
                              _helperContainer(width: 80),
                            ],
                          ),
                        );
                      },
                      itemCount: 7,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                    sectionSmallSpacerVertically(),
                    _helperContainer(height: 18, width: 100, radius: 10),
                    sectionSmallSpacerVertically(),
                    _helperContainer(height: 50, width: 100, radius: 10),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: heightFor - 60, left: 16, right: 16.0),
                    child: _helperContainer(
                      height: 105,
                      width: 105,
                      radius: 100,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  Widget _helperContainer(
      {double width = 80, double height = 10, double radius = 8.0}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius,
          ),
        ),
      ),
    );
  }
}
