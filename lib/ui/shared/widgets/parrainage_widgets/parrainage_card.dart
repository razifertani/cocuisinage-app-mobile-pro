import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class ParrainageCard extends StatelessWidget {
  String title;
  double price;
  ParrainageCard({Key? key, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 31.w,
      decoration: BoxDecoration(
          color: MyColors.red, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              title,
              style: MyTextStyles.cardTextStyle.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            ("$price €"),
            style: MyTextStyles.cardTextStyle.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
