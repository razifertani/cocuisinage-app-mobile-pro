import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 3, // thickness of the line
      indent: 35.w, // empty space to the leading edge of divider.
      endIndent: 35.w, // empty space to the trailing edge of the divider.
      color: Colors.black
          .withOpacity(0.3), // The color to use when painting the line.
      height: 20, // The divider's height extent.
    );
  }
}
