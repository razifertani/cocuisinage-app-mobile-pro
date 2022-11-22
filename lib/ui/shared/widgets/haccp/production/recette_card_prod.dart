import 'package:flutter/material.dart';

import '../../../../../Theme/my_colors.dart';
import '../../common_product_card.dart';

class RecetteCardProd extends StatelessWidget {
  const RecetteCardProd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommunProductCard(
      title: "Salade",
      topRightWidget: Icon(
        Icons.close,
        color: MyColors.red,
      ),
    );
  }
}
