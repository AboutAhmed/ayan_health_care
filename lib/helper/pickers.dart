import 'dart:io';

import 'package:ayan_healthcare/assets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:image_picker/image_picker.dart';


class MyPickers {
  static Future<DateTime?> datePicker(BuildContext context,
      {DateTime? initialDate, DateTime? minDate, DateTime? maxDate}) async {
    return await DatePicker.showSimpleDatePicker(
      context,
      initialDate: initialDate,
      firstDate: minDate,
      lastDate: maxDate,
      dateFormat: "MMM-dd-yyyy",
      locale: DateTimePickerLocale.en_us,
    );
  }

  static Future<File?> pickerActions(BuildContext context) async {
    final picker = ImagePicker();
    File? file = await showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: <Widget>[
          otherSpacerVertically(),
          _buildBottomSheetRow(context, Icons.camera, 'Camera', () async {
            var image = await picker.pickImage(source: ImageSource.camera);
            if (image != null) {
              Navigator.pop(context, File(image.path));
            }
          }),
          _buildBottomSheetRow(context, Icons.photo_library_rounded, 'Gallery',
              () async {
            var image = await picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              Navigator.pop(context, File(image.path));
            }
          }),
        ],
      ),
    );
    return file;
  }

  static Widget _buildBottomSheetRow(BuildContext context, IconData icon,
          String text, Function function) =>
      InkWell(
        onTap: () {
          function();
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                icon,
                color: Colors.grey[700],
              ),
            ),
            otherSpacerHorizontally(),
            Text(text),
          ],
        ),
      );
}
