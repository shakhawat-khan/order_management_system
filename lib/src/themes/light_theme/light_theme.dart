import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/themes/themes.dart';
import 'package:order_management_system/src/utils/app_colors.dart';

ThemeData get lightTheme => ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primarySwatch: Colors.blue,
    primaryColor: AppColors.primaryColor,
    colorScheme:
        ColorScheme.light(primary: Colors.blue, secondary: Colors.blueAccent),
    useMaterial3: true,
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: textFieldTheme);
