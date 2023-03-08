import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../common_product_card.dart';

class CaisseItemCard extends StatelessWidget {
  final String title;
  final String price;
  const CaisseItemCard({Key? key, required this.price, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommunProductCard(
      title: title,
      bottomRightWidget: Container(
        width: 15.w,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Center(
            child: Text(
              price,
              style: MyTextStyles.subhead.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
