import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/utils/app_colors.dart';

final kTextStyleLato = GoogleFonts.lato(
  fontSize: 24,
);

final spalshTextStyleleLato = GoogleFonts.lato(
  fontSize: 24,
);

final kTextStyleLatoBold =
    GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold);

// final kTextStyleButtonText = TextStyle(
//   fontSize: 20,
//   fontWeight: FontWeight.w600,
// );

TextStyle kTextStyleButtonText(Color color) {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: color);
}

final kTextStylePoppinsTitel =
    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500);

final kTextColorOrange = TextStyle(color: Color.fromRGBO(255, 109, 0, 1));

final kGradientColorBlue = LinearGradient(
  begin: Alignment(0, -1),
  end: Alignment(0, 1),
  colors: [Color.fromRGBO(8, 194, 240, .95), Color.fromRGBO(53, 76, 216, 1)],
);

final kGradientColorOrange = LinearGradient(
  begin: Alignment(0, -1),
  end: Alignment(0, 1),
  colors: [AppColors.buttonGradientColor1, AppColors.buttonGradientColor2],
);
