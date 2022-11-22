import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileCard extends StatelessWidget {
  String iconPath;
  String title;
  Function function;

  ProfileCard({Key? key, required this.iconPath, required this.title, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: SizedBox(
          height: 9.h,
          width: 90.w,
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Row(
                children: [
                  SizedBox(width: 12.w, child: Center(child: Image.asset(iconPath))),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: MyTextStyles.cardTextStyle.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(child: Container()),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
