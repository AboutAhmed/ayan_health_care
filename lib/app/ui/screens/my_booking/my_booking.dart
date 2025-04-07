import 'package:ayan_healthcare/app/controller/my_booking/my_booking_controller.dart';
import 'package:ayan_healthcare/app/routes/routes.dart';
import 'package:ayan_healthcare/app/ui/widgets/common/app_bar_search_widget.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/assets/styles/my_images.dart';
import 'package:ayan_healthcare/extension/spacing_extension.dart';
import 'package:ayan_healthcare/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  final MyBookingController controller = Get.put(MyBookingController());
  final TextEditingController billSearchController = TextEditingController();
  final TextEditingController appointmentSearchController =
      TextEditingController();
  final RxBool showBillSuffix = false.obs;
  final RxBool showAppointmentSuffix = false.obs;

  @override
  void initState() {
    super.initState();
    controller.fetchBills();
    controller.fetchAppointments();

    billSearchController.addListener(() {
      showBillSuffix.value = billSearchController.text.isNotEmpty;
    });
    appointmentSearchController.addListener(() {
      showAppointmentSuffix.value = appointmentSearchController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    billSearchController.dispose();
    appointmentSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            S.of(context).my_booking,
          )),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DefaultTabController(
            length: 2, // Number of tabs
            child: Column(
              children: [
                // Custom TabBar
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: AppColors.bgColor, // Fill color for selected tab
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
                    ),
                    dividerColor: Colors.black,
                    labelColor: AppColors.textPrimary,
                    // Text color for selected tab
                    unselectedLabelColor: Colors.black54,
                    // Text color for unselected tabs
                    tabs: [
                      Tab(text: S.of(context).bills),
                      Tab(text: S.of(context).appointment),
                    ],
                  ),
                ),
                1.kH, // Space between TabBar and content
                const Divider(color: AppColors.darkBorderColor),
                1.kH,
                Expanded(
                  child: TabBarView(
                    children: [
                      // Content for "My Bills" tab
                      _buildMyBillsTab(),
                      // Content for "Appointments" tab
                      _buildAppointmentsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMyBillsTab() {
    return Column(
      children: [
        buildSearchBar(
          hintText: S.of(context).search_bill,
          controller: billSearchController,
          onSearch: () {
            String query = billSearchController.text.toLowerCase();
            controller.searchBills(query); // ✅ Correct way to filter
          },
          onClear: () {
            billSearchController.clear();
            controller.fetchBills(); // ✅ Reset bills
          },
          showSuffix: showBillSuffix.value,
        ),
        2.kH,
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.filteredBills.isEmpty) {
              return const Center(child: Text("No bills available"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: controller.filteredBills.length, // ✅ Use filtered list
              itemBuilder: (BuildContext context, int index) {
                final bill = controller.filteredBills[index]; // ✅ Use model

                String formattedDate = bill.dateTime != null
                    ? DateFormat("EEE, dd MMM yyyy").format(
                        DateFormat("dd MMM yyyy | hh:mm a")
                            .parse(bill.dateTime!))
                    : "Unknown Date";

                return CustomCard(
                  onPressed: () {
                    Get.toNamed(AppRoutes.billsDetail);
                  },
                  radius: 12.0,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    title: Text(
                      "Invoice # ${bill.invoiceId}", // ✅ Correct field
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Total: ${bill.grandTotal}",
                            style: const TextStyle(fontSize: 12.0)),
                        const SizedBox(height: 4.0),
                        Text(formattedDate,
                            style: const TextStyle(fontSize: 12.0)),
                      ],
                    ),
                    leading: Image.asset(MyImages.file,
                        color: Colors
                            .grey), // Placeholder since `prescriptionPath` is missing
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAppointmentsTab() {
    return Column(
      children: [
        buildSearchBar(
          hintText: S.of(context).search_appointment,
          controller: appointmentSearchController,
          onSearch: () {
            String query = appointmentSearchController.text.toLowerCase();
            controller.searchAppointments(query); // ✅ Correct way to filter
          },
          onClear: () {
            appointmentSearchController.clear();
            controller.fetchAppointments(); // ✅ Reset appointments
          },
          showSuffix: showAppointmentSuffix.value,
        ),
        2.kH,
        Expanded(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.filteredAppointments.isEmpty) {
              return const Center(child: Text("No appointments available"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount:
                  controller.filteredAppointments.length, // ✅ Use filtered list
              itemBuilder: (BuildContext context, int index) {
                final appointment =
                    controller.filteredAppointments[index]; // ✅ Correct model
                String formattedDate = appointment.dateTime != null
                    ? DateFormat("EEE, dd MMM yyyy").format(
                        DateFormat("dd MMM yyyy | hh:mm a")
                            .parse(appointment.dateTime!))
                    : "Unknown Date";

                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.appointmentDetail);
                  },
                  child: CustomCard(
                    radius: 12.0,
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: ListTile(
                      title: Text(
                        "Appointment # ${appointment.id}", // ✅ Correct field
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(appointment.doctorName ?? "Unknown Doctor",
                              style: const TextStyle(fontSize: 12.0)),
                          const SizedBox(height: 4.0),
                          Text(formattedDate,
                              style: const TextStyle(fontSize: 12.0)),
                          const SizedBox(height: 4.0),
                          Text("Status: ${appointment.status ?? 'Unknown'}",
                              style: const TextStyle(fontSize: 12.0)),
                        ],
                      ),
                      leading: Image.asset(MyImages.doctor,
                          color: Colors
                              .grey), // Placeholder since `imagePath` is missing
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
