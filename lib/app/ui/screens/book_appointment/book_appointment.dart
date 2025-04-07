import 'package:ayan_healthcare/app/controller/my_booking/my_booking_controller.dart';
import 'package:ayan_healthcare/app/models/appointment_model.dart';
import 'package:ayan_healthcare/app/models/doctot_list_model.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/app/ui/screens/doctors/widget/app_doctor_card.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_button.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:ayan_healthcare/helper/toaster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BookAppointment extends StatefulWidget {
  final DoctorList doctor;

  const BookAppointment({super.key, required this.doctor});

  @override
  BookAppointmentState createState() => BookAppointmentState();
}

class BookAppointmentState extends State<BookAppointment> {
  final MyBookingController controller = Get.put(MyBookingController());
  String? selectedSlot;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Book Appointment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            AppDoctorCard(
                doctorName: widget.doctor.name ?? "N/A",
                doctorSpecialty: widget.doctor.specialityName ?? "N/A",
                doctorFee: "${widget.doctor.fee ?? 0} PKR",
                doctorImagePath:
                    "https://instacare.pk/assets/img/Image-not-found.jpg"),
            const SizedBox(height: 16),
            const Text("Select Date",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildDateSelector(widget.doctor.username ?? ""),
            const SizedBox(height: 16),
            const Text("Appointment Type",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildAppointmentTypeSelector(),
            const SizedBox(height: 16),
            const Text("Available Slots",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildAvailableSlots(),
            const SizedBox(height: 16),
            4.kH,
            CustomButton(
              text: "Book Appointment",
              onPressed: _onBookAppointment,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentTypeSelector() {
    return Obx(() {
      return DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Appointment Type',
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        ),
        value: controller.appointmentType.value.isEmpty
            ? null
            : controller.appointmentType.value,
        items: controller.appointmentTypeList.map((type) {
          return DropdownMenuItem(value: type, child: Text(type));
        }).toList(),
        onChanged: (String? type) {
          controller.setAppointmentType(type, widget.doctor.username ?? "");
        },
      );
    });
  }

  Widget _buildDateSelector(String doctorUsername) {
    return GestureDetector(
      onTap: () async {
        DateTime? dateTime = await CustomDatePicker.showPicker(
          firstParams: DateTime.now(),
          lastParams: DateTime.now().add(const Duration(days: 10000)),
          initialParams: controller.selectedDate.value,
        );
        if (dateTime == null) return;
        controller.setDate(dateTime, doctorUsername);
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller.dateFieldController,
          decoration: const InputDecoration(
            hintText: "e.g MMM/dd/yyyy",
            labelText: 'Date',
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableSlots() {
    return Column(
      children: [
        Obx(() {
          Debug.log(
              "🔄 Checking Slot Data: ${controller.startTimeSlots}, ${controller.endTimeSlots}");

          if (controller.isTimeLoading.value) {
            return Row(
              children: [
                Expanded(child: _shimmerEffect()),
                const SizedBox(width: 10),
                Expanded(child: _shimmerEffect()),
              ],
            );
          }

          if (controller.startTimeSlots.isNotEmpty &&
              controller.endTimeSlots.isNotEmpty) {
            return Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(labelText: 'Start Time'),
                    value:
                        controller.selectedStartTime.value?.isNotEmpty == true
                            ? controller.selectedStartTime.value
                            : null,
                    items: controller.startTimeSlots.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (String? start) {
                      controller.selectedStartTime.value = start ?? "";
                      int index = controller.startTimeSlots.indexOf(start!);
                      if (controller.endTimeSlots.length > index) {
                        controller.selectedEndTime.value =
                            controller.endTimeSlots[index];
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(labelText: 'End Time'),
                    value: controller.selectedEndTime.value?.isNotEmpty == true
                        ? controller.selectedEndTime.value
                        : null,
                    items: controller.endTimeSlots.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (String? end) {
                      controller.selectedEndTime.value = end ?? "";
                    },
                  ),
                ),
              ],
            );
          }

          return const Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            child: ListTile(
              enabled: false,
              dense: true,
              title: Text("No Slot Available"),
            ),
          );
        }),
      ],
    );
  }

  Widget _shimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _onBookAppointment() async {
    if (controller.selectedStartTime.value == null ||
        controller.selectedEndTime.value == null) {
      Toaster.showToast("Error: Please select a time slot.");
      return;
    }

    AppointmentModel appointment = AppointmentModel(
      dateTime: controller.selectedDate.value.toString(),
      doctorName: "InstaCare Customer Success",
      imagePath: null,
      status: "Pending",
      createdBy: "DM20210915052434",
      patientUsername: Constant.patientUsername,
      doctorUsername: widget.doctor.username,
      medUsername: Constant.locationID,
      details: "",
      reason: "",
      notes: "",
      smsReminder: "",
      remarks: "",
      scheduledDate: controller.selectedDate.value.toString(),
      timeStamp: controller.selectedStartTime.value,
      location: Constant.locationID,
      endTime: controller.selectedEndTime.value,
      appointmentSource: Constant.appName,
      masterUsername: Constant.masterUsername,
      type: "Regular-checkup",
      serviceId: 0,
    );

    bool success = await ApiFetch.createAppointment(appointment);
    if (success) {
      Toaster.showToast("Appointment booked successfully!");
      Get.toNamed(AppRoutes.bookingSuccess);
    } else {
      Toaster.showToast("Error: Failed to book appointment.");
    }
  }
}
