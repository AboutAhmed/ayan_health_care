import 'package:ayan_healthcare/app/models/appointment_model.dart';
import 'package:ayan_healthcare/app/models/bills_model.dart';
import 'package:ayan_healthcare/app/models/time_slots_model.dart';
import 'package:ayan_healthcare/app/server/fetch_api.dart';
import 'package:ayan_healthcare/assets/styles/strings/constant.dart';
import 'package:ayan_healthcare/debug.dart';
import 'package:ayan_healthcare/helper/connectivity.dart';
import 'package:ayan_healthcare/helper/preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyBookingController extends GetxController {
  var patientId = ''.obs;
  var bills = <BillModel>[].obs;
  var filteredBills = <BillModel>[].obs;
  var appointments = <AppointmentModel>[].obs;
  var filteredAppointments = <AppointmentModel>[].obs;
  var isLoading = false.obs;
  var isTimeLoading = false.obs;
  var startTimeSlots = <String>[].obs;
  var endTimeSlots = <String>[].obs;
  var selectedStartTime = RxnString();
  var selectedEndTime = RxnString();
  final RxnBool _buttonAction = RxnBool(true);
  bool? get buttonAction => _buttonAction.value;

  final Preferences preferences = Get.find<Preferences>();
  var selectedDate = DateTime.now().obs;
  var dateFieldController = TextEditingController();
  var appointmentType = "".obs;
  var appointmentTypeList = ["Online", "RegularCheckup"];

  void setDate(DateTime date, String doctorUsername) {
    selectedDate.value = date;
    dateFieldController.text = DateFormat("MMM dd, yyyy").format(date);

    fetchTimeSlots(
      doctorUsername: doctorUsername,
      date: date,
      locationId: Constant.locationID,
      type: appointmentType.value,
    );
  }

  void setAppointmentType(String? type, String doctorUsername) {
    if (type != null) {
      appointmentType.value = type;
      fetchTimeSlots(
        doctorUsername: doctorUsername,
        date: selectedDate.value,
        locationId: Constant.locationID,
        type: appointmentType.value,
      );
    }
  }

  Future<void> fetchMedicalRecords(String recordType) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> params = {
        "PatientUsername": Constant.patientUsername,
        "RecordType": recordType,
        "MasterUsername": Constant.masterUsername
      };

      final response = await ApiFetch.getMedicalRecord(params);
      Debug.log("📡 Raw API Response: $response");

      if (response is BillResponse) {
        bills.assignAll(response.bills);
        filteredBills.assignAll(response.bills);
      } else if (response is AppointmentResponse) {
        appointments.assignAll(response.appointments);
        filteredAppointments.assignAll(response.appointments);
      } else {
        Debug.log("❌ Unexpected response type: ${response.runtimeType}");
      }
    } catch (e, stacktrace) {
      Debug.log("❌ Error fetching medical records: $e");
      Debug.log("🛠️ Stacktrace: $stacktrace");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchBills() async => await fetchMedicalRecords("Bill");

  Future<void> fetchAppointments() async =>
      await fetchMedicalRecords("Appointment");

  void searchBills(String query) {
    if (query.isEmpty) {
      filteredBills.assignAll(bills);
      return;
    }
    filteredBills.value = bills
        .where((bill) => bill.invoiceId?.contains(query) ?? false)
        .toList();
  }

  void searchAppointments(String query) {
    if (query.isEmpty) {
      filteredAppointments.assignAll(appointments);
      return;
    }
    filteredAppointments.value = appointments.where((appointment) {
      return (appointment.doctorName?.toLowerCase() ?? '')
          .contains(query.toLowerCase());
    }).toList();
  }

  void onBookAppointment() {
    if (selectedStartTime.value == null ||
        selectedEndTime.value == null ||
        appointmentType.value.isEmpty) {
      Get.snackbar("Error", "Please fill all fields before booking");
      return;
    }

    Get.snackbar("Booking Confirmed", "You have booked an appointment.");
    Get.toNamed("/bookingSuccess");
  }

  Future<void> fetchTimeSlots({
    required String doctorUsername,
    required DateTime date,
    required String locationId,
    required String type,
  }) async {
    isTimeLoading.value = true;
    startTimeSlots.clear();
    endTimeSlots.clear();

    if (!await Connectivity.isOnline()) {
      Debug.log("❌ No internet connection.");
      isTimeLoading.value = false;
      return;
    }

    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    String apiUrl = "https://app.instacare.pk/api/TimeSlot/GetTimeSlots"
        "?SystemKey=6b2e7679-34dd-41f9-b0cd-ac0ea0f8bf8b"
        "&doctorUsername=$doctorUsername"
        "&date=$formattedDate"
        "&locationId=$locationId"
        "&type=$type";

    Debug.log("📡 Fetching time slots from: $apiUrl");

    try {
      TimeSlotModel? response = await ApiFetch.getTimeSlotList(apiUrl);
      isTimeLoading.value = false; // Stop loading

      if (response == null || response.timeSlots?.isEmpty == true) {
        Debug.log("⚠️ No time slots available.");
        startTimeSlots.clear();
        endTimeSlots.clear();
        return;
      }

      startTimeSlots.assignAll(response.timeSlots ?? []);
      endTimeSlots.assignAll(response.endTimeSlots ?? []);

      selectedStartTime.value =
          startTimeSlots.isNotEmpty ? startTimeSlots.first : null;
      selectedEndTime.value =
          endTimeSlots.isNotEmpty ? endTimeSlots.first : null;

      Debug.log("✅ Time slots loaded successfully.");
    } catch (e) {
      Debug.log("❌ Error fetching time slots: $e");
    } finally {
      isTimeLoading.value = false;
    }
  }
}
