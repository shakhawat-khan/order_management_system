import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_management_system/src/modules/order/provider/functions.dart';

final fileListProvider = StateProvider<File?>((ref) {
  return null;
});

final pickImageProvider =
    NotifierProvider<CameraNotifier, List<File?>>(CameraNotifier.new);

class CameraNotifier extends Notifier<List<File?>> {
  @override
  build() {
    return [];
  }

  void pickImageGallery() async {
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path;
    //  final file = File('${tempPath}/${image.path}');
    // print(file);

    final image = await pickImageFromGallery();

    state = [...state, image];
  }
}

final dropdownProvider =
    NotifierProvider<DropdownNotifier, List<DropdownMenuItem<String>>?>(
        DropdownNotifier.new);

class DropdownNotifier extends Notifier<List<DropdownMenuItem<String>>?> {
  @override
  List<DropdownMenuItem<String>>? build() {
    return <String>['A', 'B', 'C', 'D'].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}

final datetimeProvider =
    NotifierProvider<DateTimeNotifier, DateTime?>(DateTimeNotifier.new);

class DateTimeNotifier extends Notifier<DateTime?> {
  @override
  build() {
    return null;
  }

  void pickDate() async {}
}

final dropdown1Provider = StateProvider<String?>((ref) {
  return null;
});

final dropdown2Provider = StateProvider<String?>((ref) {
  return null;
});
