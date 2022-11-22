import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IngCard extends StatelessWidget {
  String ingImage;
  String ingName;
  String ingQte;
  String ingStock;
  IngCard({Key? key, required this.ingImage, required this.ingName, required this.ingQte, required this.ingStock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  ingImage,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  ingName,
                  style: MyTextStyles.body,
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ingQte,
              style: MyTextStyles.body,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ingStock,
              style: MyTextStyles.body,
            ),
          )
        ],
      ),
    );
  }
}
