// To parse this JSON data, do
//
//     final usersData = usersDataFromJson(jsonString);

import 'dart:convert';

UsersData usersDataFromJson(String str) => UsersData.fromJson(json.decode(str));

String usersDataToJson(UsersData data) => json.encode(data.toJson());

class UsersData {
  UsersData({
    required this.email,
    required this.mobileNumber,
    required this.name,
    required this.ownerDesignation,
    required this.ownerName,
    required this.password,
    required this.userId,
  });

  String email;
  String mobileNumber;
  String name;
  String ownerDesignation;
  String ownerName;
  String password;
  String userId;

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        email: json["email"],
        mobileNumber: json["mobile_number"],
        name: json["name"],
        ownerDesignation: json["owner_designation"],
        ownerName: json["owner_name"],
        password: json["password"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "mobile_number": mobileNumber,
        "name": name,
        "owner_designation": ownerDesignation,
        "owner_name": ownerName,
        "password": password,
        "user_id": userId,
      };
}
