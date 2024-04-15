import 'package:dgtix_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  AppFont(int i, FontWeight bold);

  static TextStyle montserrat(
    double size,
    FontWeight fontWeight, {
    Color? color,
  }) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: fontWeight,
      color: color ?? AppColor.blackColor,
    );
  }
}
