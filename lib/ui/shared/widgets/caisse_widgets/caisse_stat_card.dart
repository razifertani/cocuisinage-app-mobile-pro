import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class CaisseStatCard extends StatelessWidget {
  final String title;
  final String content;
  const CaisseStatCard({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 18.h,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              AutoSizeText(
                title,
                maxLines: 1,
                style:
                    MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                content,
                style: MyTextStyles.headline
                    .copyWith(fontWeight: FontWeight.w600, color: MyColors.red),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 24.w,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFD43347).withOpacity(0.2),
                ),
                child: Center(
                    child: Text(
                  "Voir",
                  style: MyTextStyles.buttonTextStyle
                      .copyWith(color: MyColors.red),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
