import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class RecetteTabBarCard extends StatelessWidget {
  String title;
  String imgPath;
  Color borderColor;
  Function cardFunction;
  RecetteTabBarCard(
      {Key? key,
      required this.title,
      required this.imgPath,
      required this.borderColor,
      required this.cardFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cardFunction();
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: 28.w,
          height: 14.h,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(width: 2, color: borderColor)),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 4.5.h,
                    child: Image.asset(
                      imgPath,
                      width: 35,
                    ),
                  ),
                  SizedBox(height: 6),
                  Flexible(
                    child: AutoSizeText(title,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: MyTextStyles.body.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp.clamp(12, 14))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
