import 'package:flutter/material.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  ),
);

final textFieldTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
  ),

  //labelStyle: TextStyle(fontSize: 35, decorationColor: Colors.red),
);
