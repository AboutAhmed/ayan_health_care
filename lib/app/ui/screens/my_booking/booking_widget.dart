// booking_widget.dart
import 'package:flutter/material.dart';

class BookingWidget extends StatelessWidget {
  final BookingModel bookingModel;

  const BookingWidget({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookingModel.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date: ${bookingModel.date.toLocal().toString().split(' ')[0]}', // Format the date as needed
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            // Add more fields as necessary
          ],
        ),
      ),
    );
  }
}

// booking_model.dart
class BookingModel {
  final String title;
  final DateTime date;

  BookingModel({
    required this.title,
    required this.date,
  });
}
