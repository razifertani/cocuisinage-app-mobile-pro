import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../common_product_card.dart';

class RecetteExplorerCard extends StatelessWidget {
  const RecetteExplorerCard({Key? key}) : super(key: key);

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
    );
  }
}
