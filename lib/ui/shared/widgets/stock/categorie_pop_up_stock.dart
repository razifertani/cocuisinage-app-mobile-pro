import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../../utils/utils.dart';
import '../../../screens/stock/ajouter_produit/ajouter-produit.dart';
import '../food_pop_up/plat_pop_up.dart';
import '../food_pop_up/produit_pop_up.dart';

class CategoriePopUpCardStock extends StatelessWidget {
  const CategoriePopUpCardStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 25.h,
            width: 80.w,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Catégories",
                    style: MyTextStyles.headline.copyWith(color: MyColors.red),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Utils.pushScreen(context, PlatPopUp(), 0.7);
                      },
                      child: Image.asset(
                        "assets/images/plats.png",

                        // height: 100,
                        // width: 100,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Utils.pushScreen(context, ProduitPopUP(), 0.7);
                      },
                      child: Image.asset(
                        "assets/images/produit.png",
                        // height: 100,
                        // width: 100,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Plats",
                      style: MyTextStyles.subhead,
                    ),
                    Text(
                      "Produits",
                      style: MyTextStyles.subhead,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
