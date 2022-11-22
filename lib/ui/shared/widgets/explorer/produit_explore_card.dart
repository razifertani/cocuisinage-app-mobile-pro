import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../common_product_card.dart';

class ProduitExplorerCard extends StatelessWidget {
  const ProduitExplorerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommunProductCard(
      title: "produit",
      topLeftWidget: Image.asset("assets/stock_icons/info.png"),
      topRightWidget: Icon(
        Icons.close,
        color: MyColors.red,
        size: 20,
      ),
      bottomRightWidget: Container(
        width: 15.w,
        decoration: BoxDecoration(
          color: MyColors.red,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Center(
            child: Text(
              "3€",
              style: MyTextStyles.subhead.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
