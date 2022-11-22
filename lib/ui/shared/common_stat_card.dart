import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonStatCard extends StatelessWidget {
  String title;
  String content;
  bool stat;
  CommonStatCard({Key? key, required this.title, required this.content, required this.stat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            AutoSizeText(
              title,
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              content,
              style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600, color: MyColors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            stat
                ? Container(
                    width: 24.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFDCF5E8),
                    ),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/grown_up.png"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "+ 11%",
                            style: MyTextStyles.body.copyWith(color: const Color(0xFF4FD18B)),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    width: 24.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFD43347).withOpacity(0.2),
                    ),
                    child: Center(
                        child: Text(
                      "Voir",
                      style: MyTextStyles.buttonTextStyle.copyWith(color: MyColors.red),
                    )),
                  ),
          ],
        ),
      ),
    );
  }
}
