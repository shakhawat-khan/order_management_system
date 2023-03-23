import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

List<XFile>? imageFileList = [];

Future<List<XFile?>> pickImageFromGallery() async {
  /*final XFile? image = await picker.pickImage(
    maxHeight: 700,
    maxWidth: 700,
    source: ImageSource.gallery,
  );*/

  final List<XFile>? selectedImages = await picker.pickMultiImage();
  if (selectedImages!.isNotEmpty) {
    imageFileList!.addAll(selectedImages);
  }
  print("Image List Length:" + imageFileList!.length.toString());

  return selectedImages;
}

Future<DateTime> selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101));

  return picked!;
}
