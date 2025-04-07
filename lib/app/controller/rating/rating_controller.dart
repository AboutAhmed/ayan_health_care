import 'package:ayan_healthcare/app/models/doctot_list_model.dart';
import 'package:ayan_healthcare/helper/toaster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReviewController extends GetxController {
  final Rxn<DoctorList> doctorProfileModel = Rxn<DoctorList>();

  final RxDouble _overAll = RxDouble(5.0);
  final RxBool isWaitingTimeHasData = RxBool(false);
  final RxBool isRecommended = RxBool(true);

  List<String> waitingTimeOptions = [
    'Less than 15 min',
    '15 min to 30 min',
    '30 min to 1 hour',
    'More than 1 hour',
  ];

  final RxnString wtGroup = RxnString();
  final RxnString feeRate = RxnString();

  String? feedback;

  final formKey = GlobalKey<FormState>();

  // Dummy data for patient username
  String patientUserName = "John Doe";

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments == null) {
      Get.back();
    }
    doctorProfileModel.value = Get.arguments;

    updateTitle();
  }

  void checkWaitingTimeValue() {
    if (wtGroup.value != null) {
      isWaitingTimeHasData(true);
    } else {
      isWaitingTimeHasData(false);
    }
  }

  void updateTitle() {
    int rate = overAll.round();
    switch (rate) {
      case 5:
        feeRate("Very Inexpensive");
        break;
      case 4:
        feeRate("Inexpensive");
        break;
      case 3:
        feeRate("Neutral");
        break;
      case 2:
        feeRate("Expensive");
        break;
      case 1:
        feeRate("Extremely Expensive");
        break;
    }
  }

  void onSubmit() {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    Get.focusScope!.unfocus();

    // Simulate submission by printing the review data
    String reviewData = '''
    Patient Username: $patientUserName
    Doctor Username: ${doctorProfileModel.value?.name}
    Rating: ${overAll.toString()}
    Feedback: $feedback
    Recommended: ${isRecommended.value}
    Waiting Time: ${wtGroup.value.toString()}
    Fee Rating: ${feeRate.value}
    ''';

    // Print the review data to the console
    print(reviewData);

    // Show a success message
    Toaster.showToast("Thanks for your feedback");
    Get.back(result: true);
  }

  double get overAll => _overAll.value;

  set overAll(double value) {
    _overAll(value);
  }
}
