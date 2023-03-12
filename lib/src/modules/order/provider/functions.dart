import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

Future<File> pickImageFromGallery() async {
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  return File(image!.path);
}

Future<DateTime?> selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));

  return picked;
}
