// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    required this.allocatedJob,
    required this.categoryName,
    required this.contactPersonName,
    required this.contactPersonNumber,
    required this.details,
    required this.startDate,
    required this.endDate,
    required this.imagePath,
    required this.rawMaterial,
    required this.orderId,
    required this.userId,
    required this.productImage,
  });

  String allocatedJob;
  String categoryName;
  String contactPersonName;
  String contactPersonNumber;
  String details;
  String startDate;
  String endDate;
  String imagePath;
  String rawMaterial;
  String orderId;
  String userId;
  List<dynamic> productImage;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        allocatedJob: json["allocated_job"],
        categoryName: json["category_name"],
        contactPersonName: json["contact_person_name"],
        contactPersonNumber: json["contact_person_number"],
        details: json["details"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        imagePath: json["image_path"],
        rawMaterial: json["raw_material"],
        orderId: json["order_id"],
        userId: json["user_id"],
        productImage: json["productImage"],
      );

  Map<String, dynamic> toJson() => {
        "allocated_job": allocatedJob,
        "category_name": categoryName,
        "contact_person_name": contactPersonName,
        "contact_person_number": contactPersonNumber,
        "details": details,
        "start_date": startDate,
        "end_date": endDate,
        "image_path": imagePath,
        "raw_material": rawMaterial,
        "order_id": orderId,
        "user_id": userId,
        "productImage": productImage,
      };
}
