import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../common_product_card.dart';

class SortieDestockMenuCard extends StatelessWidget {
  final String title;
  final String imgPath;
  const SortieDestockMenuCard(
      {Key? key, required this.title, required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommunProductCard(
      topLeftWidget: Icon(Icons.close, color: MyColors.red),
      topRightWidget: const SizedBox(width: 20),
      bottomLeftWidget: Text(
        "1,2kg",
        style: MyTextStyles.subhead,
      ),
      title: title,
      // imgPath: imgPath,
      bottomRightWidget: Container(
        width: 16.w,
        decoration: BoxDecoration(
          color: Color(0xFF3A3244),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Center(
            child: AutoSizeText(
              "12/08",
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
