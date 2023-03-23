import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:order_management_system/src/models/orders_models.dart';
import 'package:order_management_system/src/modules/order/provider/functions.dart';

// final fileListProvider = StateProvider<List<XFile?>>((ref) {
//   return null;
// });

final pickImageProvider = NotifierProvider<CameraNotifier, List<XFile?>>(CameraNotifier.new);

class CameraNotifier extends Notifier<List<XFile?>> {
  @override
  build() {
    return [];
  }


 /* final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await
    imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());

  }*/

  void pickImageGallery() async {
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path;
    //  final file = File('${tempPath}/${image.path}');
    // print(file);

    var image = await pickImageFromGallery();
     List<XFile>limage=[];
    if(image.length>3){

      for(int i=0;i<=3;i++){
        limage.add(image[i]!);
      }
      image = limage;
    }



   // state = [...state, image];
    state = image;
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

// final FirebaseProvider =
//     NotifierProvider<FirebaseNotifier, List<Orders>>(FirebaseNotifier.new);

// class FirebaseNotifier extends Notifier<List<Orders>> {
//   @override
//   build() {
//     FirebaseFirestore.instance.collection('orders').snapshots().listen((event) {
//       mapRecords(event);
//     });
//     fetchData();
//     //lenState();
//     return [];
//   }

//   Future<void> fetchData() async {
//     var records = await FirebaseFirestore.instance.collection('orders').get();
//     mapRecords(records);
//   }

//   void mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
//     var list = records.docs
//         .map((order) => Orders(
//             id: order.id,
//             allocatedJob: order['allocated_job'],
//             categoryName: order['category_name'],
//             contactPersonName: order['contact_person_name'],
//             contactPersonNumber: order['contact_person_number'],
//             details: order['details'],
//             startDate: order['start_date'],
//             endDate: order['end_date'],
//             imagePath: order['image_path'],
//             rawMaterial: order['raw_material']))
//         .toList();

//     state = [...list];
//   }

//   int lenState() {
//     print(state.length.toString());
//     return state.length;
//   }
// }
