import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Theme/my_colors.dart';
import '../../Theme/my_text_styles.dart';

class CustomCard extends StatelessWidget {
  String txt;
  String imgPath;
  int? quantite;

  Function fun;
  CustomCard(
      {Key? key,
      required this.imgPath,
      required this.txt,
      this.quantite,
      required this.fun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => fun(),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            child: Card(
              shape: RoundedRectangleBorder(
                // side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                quantite == null
                    ? SizedBox(height: 10.h, child: Image.asset(imgPath))
                    : SizedBox(
                        height: 9.h,
                        child: Image.asset(
                          imgPath,
                          height: 120,
                          width: 120,
                        )),
                SizedBox(
                  height: quantite != null ? 5 : 20,
                ),
                SizedBox(
                  height: 5.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AutoSizeText(
                      txt,
                      maxLines: 1,
                      style: MyTextStyles.cardTextStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                quantite != null
                    ? Text("${quantite}",
                        style: MyTextStyles.cardTextStyle.copyWith(
                            color: MyColors.red, fontWeight: FontWeight.w600))
                    : SizedBox(),
              ]),
            ),
          )),
    );
  }
}
