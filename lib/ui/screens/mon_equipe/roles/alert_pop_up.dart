import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class AlertPopUp extends StatelessWidget {
  const AlertPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 30.h,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Oups!",
                    style: MyTextStyles.headline.copyWith(color: MyColors.red, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Vous n’avez pas la permission d’accéder a cette page Veuillez contacter votre administrateur pour modifier vos permissions",
                  style: MyTextStyles.subhead,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
