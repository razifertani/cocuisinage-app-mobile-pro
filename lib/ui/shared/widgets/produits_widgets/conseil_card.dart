import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConseilCard extends StatelessWidget {
  const ConseilCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12.0, bottom: 12, right: 15, left: 12),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmo a. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ",
                  style: MyTextStyles.subhead,
                ),
              ),
            ),
          ),
          Positioned(
            right: 6,
            top: 5,
            child: SizedBox(
              width: 8.w,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: MyTextStyles.subhead.copyWith(color: MyColors.red),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
