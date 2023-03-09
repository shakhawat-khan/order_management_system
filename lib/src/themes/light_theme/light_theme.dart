import 'package:flutter/material.dart';
import 'package:order_management_system/src/themes/themes.dart';

ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.indigo,
    useMaterial3: true,
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: textFieldTheme);
