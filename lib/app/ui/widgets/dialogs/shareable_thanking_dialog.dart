import 'package:flutter/material.dart';

class ShareableThankingDialog extends StatelessWidget {
  final String? doctorName, date, time, location, type, status;

  const ShareableThankingDialog({
    super.key,
    this.doctorName,
    this.date,
    this.time,
    this.location,
    this.type,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Details",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700),
          ),
          const SizedBox(
            height: 16,
          ),
          detailWidget("Doctor Name: ", "$doctorName"),
          detailWidget('Date: ', '$date'),
          detailWidget('Time: ', '$time'),
          if (location!.isNotEmpty) detailWidget('Location: ','$location' ),
          detailWidget("Type: ", "$type"),
          detailWidget("Status: ", "$status"),
        ],
      ),
    );
  }

  Widget detailWidget(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          Flexible(
            child: Text(
              value, overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
