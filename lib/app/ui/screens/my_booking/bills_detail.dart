import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayan_healthcare/assets/styles/my_colors.dart';
import 'package:ayan_healthcare/app/ui/widgets/custom_card.dart';
import 'package:ayan_healthcare/app/ui/widgets/pkr_widget.dart';

class MyBillsDetail extends StatelessWidget {
  const MyBillsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for bill
    final Map<String, dynamic> bill = {
      "billId": "BILL12345",
      "date": "2023-10-20",
      "totalAmount": 1500,
      "status": "Paid",
      "items": [
        {"description": "Blood Test", "amount": 500},
        {"description": "X-Ray", "amount": 1000},
      ],
    };

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white, // Light icon color
          ),
        ),
        backgroundColor: AppColors.primaryColor, // Dark background color
        title: const Text(
          "Bill Details",
          style: TextStyle(color: Colors.white), // Light text color
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomCard(
                radius: 12.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bill ID: ${bill["billId"]}",
                        style: Get.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Date: ${bill["date"]}",
                        style: Get.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Status: ${bill["status"]}",
                        style: Get.textTheme.bodyMedium!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Items:",
                        style: Get.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: bill["items"]!.length,
                        itemBuilder: (context, index) {
                          final item = bill["items"][index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item["description"]),
                                PKRWidget(
                                  amount: item["amount"].toString(),
                                  style: Get.theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const Divider(
                        height: 20,
                        color: AppColors.lightBorderColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount:",
                            style: Get.textTheme.titleMedium,
                          ),
                          PKRWidget(
                            amount: bill["totalAmount"].toString(),
                            style: Get.theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 6,
      //   color: Colors.white,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: SizedBox(
      //       width: Get.width,
      //       child: ElevatedButton(
      //         onPressed: () {
      //           // Handle payment action
      //         },
      //         child: const Text("Pay Now"),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
