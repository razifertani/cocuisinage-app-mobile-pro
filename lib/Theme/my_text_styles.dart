import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyTextStyles {
  static TextStyle appBarTextStyle = TextStyle(
    fontSize: 17.sp.clamp(20, 34),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline = TextStyle(
    fontSize: 17.sp.clamp(19, 32),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle subhead = TextStyle(
    fontSize: 17.sp.clamp(15, 28),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static TextStyle body = TextStyle(
    fontSize: 17.sp.clamp(12, 22),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle cardTextStyle = TextStyle(
    fontSize: 17.sp.clamp(18, 32),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: const Color(0xFF5D5D5D),
  );

  static TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 17.sp.clamp(14, 22),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
}
