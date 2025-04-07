import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/app/ui/widgets/doctor_widgets/image_with_video_icon.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/text_styles/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for appointment
    final appointment = {
      "doctorName": "Dr. John Doe",
      "doctorSpeciality": "Cardiologist",
      "doctorImage": "assets/images/doctor.png",
      "doctorFee": 1500,
      "videoCharges": 500,
      "transactionStatus": "Paid",
      "status": "Confirmed",
      "dateFormatted": "2023-10-20",
      "time": "10:00 AM",
      "appointmentType": "Regular Checkup",
      "clinicAddress": "123 Main St, City",
      "reason": "Routine checkup",
      "notes": "N/A",
      "isTelemedicineProvider": false,
      "isEditable": () => true, // Dummy function to simulate editability
    };

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Appointment Detail",
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                child: Stack(
                  children: [
                    // Contents
                    Positioned(
                      top: 50,
                      left: 16.0,
                      right: 16.0,
                      child: CustomCard(
                        radius: 12.0,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(top: 80),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "InstaCare Customer Service",
                                    style: Get.textTheme.titleMedium,
                                  ),
                                  Text(
                                    "",
                                    style: regularText,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 16.0,
                                      horizontal: 12.0,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.lightBorderColor,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      "Appointment Confirmed",
                                      style: mainHeadings.copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                  ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      AppointmentDetailRowWidget(
                                        title: "Appointment Price:",
                                        value:
                                            '${appointment["doctorFee"]} PKR',
                                      ),
                                      const Divider(
                                        height: 0,
                                        color: AppColors.lightBorderColor,
                                      ),
                                      // AppointmentDetailRowWidget(
                                      //   title: "Payment Status:",
                                      //   value:
                                      //       'appointment["transactionStatus"]',
                                      //   color: AppColors.primaryColor,
                                      // ),
                                      // const Divider(
                                      //   height: 0,
                                      //   color: AppColors.lightBorderColor,
                                      // ),
                                      const AppointmentDetailRowWidget(
                                        title: "Status:",
                                        value: 'Pending',
                                        color: AppColors.primaryColor,
                                      ),
                                      const Divider(
                                        height: 0.0,
                                        color: AppColors.lightBorderColor,
                                      ),
                                      AppointmentDetailRowWidget(
                                        title: "Date & Time:",
                                        value:
                                            "${appointment["dateFormatted"]} At ${appointment["time"]}",
                                      ),
                                      const Divider(
                                        height: 0.0,
                                        color: AppColors.lightBorderColor,
                                      ),
                                      const AppointmentDetailRowWidget(
                                        title: "Reason:",
                                        value: '',
                                      ),
                                      const Divider(
                                        height: 0.0,
                                        color: AppColors.lightBorderColor,
                                      ),
                                      const AppointmentDetailRowWidget(
                                        title: "Notes:",
                                        value: '' ?? "N/A",
                                      ),
                                      const Divider(
                                        height: 0.0,
                                        color: AppColors.lightBorderColor,
                                      ),
                                      const AppointmentDetailRowWidget(
                                        title: "Location:",
                                        value: '',
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Positioned(
                            //   top: 0.0,
                            //   right: 16.0,
                            //   child: SvgPicture.asset(
                            //     MyIcons.icFeatured,
                            //     height: 25, // Adjust height as needed
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // Profile image
                    Positioned(
                      top: 0.0,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: ImageWithVideoIcon(
                          imagePath: 'assets/images/find-doctor.png',
                          width: 105, // Adjust width as needed
                          height: 105, // Adjust height as needed
                          // isVideo: appointment["isTelemedicineProvider"],
                          videoIconRight: 12.0,
                          videoIconTop: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.only(
      //       left: 12.0,
      //       right: 12.0,
      //       bottom: 12.0,
      //     ),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         if (appointment["status"] != "Cancelled" &&
      //             appointment["status"] != "Rejected")
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               SizedBox(
      //                 width: MediaQuery.of(context).size.width,
      //                 child: OutlinedButton(
      //                   onPressed: () {
      //                     // Handle cancel appointment action
      //                   },
      //                   child: const Text("Cancel Appointment"),
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: MediaQuery.of(context).size.width,
      //                 child: ElevatedButton(
      //                   onPressed: () {
      //                     // Handle reschedule appointment action
      //                   },
      //                   child: const Text("Reschedule Appointment"),
      //                 ),
      //               ),
      //               Text(
      //                 "Rescheduling must be done 1 hour prior to due time.",
      //                 style: Get.theme.textTheme.bodySmall,
      //               )
      //             ],
      //           ),
      //         if (appointment["status"] == "Cancelled" ||
      //             appointment["status"] == "Rejected")
      //           SizedBox(
      //             width: MediaQuery.of(context).size.width,
      //             child: ElevatedButton(
      //               onPressed: () {
      //                 // Handle rebook appointment action
      //               },
      //               child: const Text("Rebook Appointment"),
      //             ),
      //           ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class AppointmentDetailRowWidget extends StatelessWidget {
  final String? title, value;
  final Color? color;

  const AppointmentDetailRowWidget({
    super.key,
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(top: 8.0, bottom: 4, left: 12.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title!,
              style: Get.theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            width: 6.0,
          ),
          Expanded(
            flex: 6,
            child: Text(
              value ?? '',
              style: Get.theme.textTheme.titleSmall!.copyWith(
                color: color ?? Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
