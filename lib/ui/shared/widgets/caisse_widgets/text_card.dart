import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CaisseCardText extends StatelessWidget {
  String title;
  CaisseCardText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      width: 40.w,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: MyColors.red, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: AutoSizeText(
              title,
              style: MyTextStyles.subhead,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
