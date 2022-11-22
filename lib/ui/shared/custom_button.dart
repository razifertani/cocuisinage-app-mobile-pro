import 'dart:async';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Theme/my_colors.dart';
import '../../Theme/my_text_styles.dart';

class CustomButton extends StatelessWidget {
  String txt;
  Function(Function, Function, ButtonState) fun;
  CustomButton({Key? key, required this.txt, required this.fun}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: 8.h,
      width: 42.w,
      minWidth: 42.w,
      color: MyColors.red,
      borderRadius: 15.0,
      roundLoadingShape: false,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: AutoSizeText(
        txt,
        maxLines: 1,
        style: MyTextStyles.buttonTextStyle,
      ),
      loader: SpinKitRing(
        color: Colors.white,
        size: 40,
        lineWidth: 4,
      ),
      onTap: fun,
    );
/*
    return SizedBox(
      width: 42.w,
      height: 8.h,
      child: ElevatedButton(
          child: AutoSizeText(txt, maxLines: 1),
          onPressed: () => fun(),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            primary: MyColors.red,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            textStyle: MyTextStyles.buttonTextStyle,
          )),
    );
*/
  }
}
