import 'package:ayan_healthcare/app/controller/rating/rating_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/widgets/bottom_navigation_button.dart';
import 'package:ayan_healthcare/app/ui/widgets/doctor_widgets/image_with_video_icon.dart';
import 'package:ayan_healthcare/app/ui/widgets/review_widget/rating_widget.dart';
import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:ayan_healthcare/helper/toaster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayan_healthcare/generated/l10n.dart'; // Import your localization file

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddReviewController());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: Text(S.of(context).rating_and_review), // Use localization
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ImageWithVideoIcon(
                  imagePath: controller
                          .doctorProfileModel.value?.profilePicture ??
                      '',
                  width: size.width,
                  videoIconRight: 16,
                  videoIconTop: 4,
                  height: size.height,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      '${controller.doctorProfileModel.value?.name} ',
                  style: Get.theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${controller.doctorProfileModel.value?.specialityName}",
                style: Get.theme.textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            S.of(context).recommend_doctor, // Use localization
            style: Get.theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * .4,
                    child: RadioListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      value: true,
                      onChanged: (dynamic value) {
                        controller.isRecommended.value = value;
                      },
                      groupValue: controller.isRecommended.value,
                      title: Text(S.of(context).yes), // Use localization
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .4,
                    child: RadioListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      value: false,
                      onChanged: (dynamic value) {
                        controller.isRecommended.value = value;
                      },
                      groupValue: controller.isRecommended.value,
                      title: Text(S.of(context).no), // Use localization
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 4),
          Text(
            S.of(context).waiting_time_question, // Use localization
            style: Get.theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Obx(() => Column(
                children: controller.waitingTimeOptions.map((option) {
                  return RadioListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    groupValue: controller.wtGroup.value,
                    onChanged: (dynamic value) {
                      controller.wtGroup.value = value;
                      controller.checkWaitingTimeValue();
                    },
                    value: option,
                    title: Text(option),
                  );
                }).toList(),
              )),
          const SizedBox(height: 4),
          Text(
            S.of(context).rate_fees, // Use localization
            style: Get.theme.textTheme.bodyMedium,
          ),
          Obx(() => FeeRate(
                title: controller.feeRate.value!,
                rating: controller.overAll,
                onRatingUpdate: (value) {
                  controller.overAll = value;
                  controller.updateTitle();
                },
              )),
          const SizedBox(height: 16),
          Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).tell_experience, // Use localization
                  style: Get.theme.textTheme.bodyMedium,
                ),
                otherSpacerVertically(),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  minLines: 5,
                  maxLines: 6,
                  maxLength: 350,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (text) => controller.feedback = text,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return S.of(context).feedback_empty; // Use localization
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).feedback_hint, // Use localization
                    contentPadding: const EdgeInsets.all(16.0),
                    counterText: '',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: BottomButton(
        pLeft: 24,
        pRight: 24,
        onPressed: () async {
          if (!controller.isWaitingTimeHasData.value) {
            Toaster.showToast(S.of(context).waiting_time_question); // Use localization
            return;
          }
          // controller.onSubmit();
          Get.offAllNamed(AppRoutes.home);
        },
        lable: S.of(context).submit, // Use localization
      ),
    );
  }
}