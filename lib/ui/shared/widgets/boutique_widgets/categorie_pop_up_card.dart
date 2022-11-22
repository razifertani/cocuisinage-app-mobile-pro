import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class CategoriePopUpCard extends StatelessWidget {
  bool? ajouter;
  bool? menu;
  CategoriePopUpCard({Key? key, this.ajouter = false, this.menu = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 32.h,
            width: 80.w,
            child: Column(
              children: [
                Center(
                  child: Text(
                    ajouter! ? "Ajouter" : "Catégories",
                    style: MyTextStyles.headline.copyWith(color: MyColors.red),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: InkWell(
                            onTap: () {
                              // ajouter!
                              //     ? Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => const AjouterPlat()),
                              //       )
                              //     : Utils.pushScreen(context, const PlatPopUp(), 0.7);
                            },
                            child: SizedBox(
                              height: 12.h,
                              width: 20.w,
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/plats.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Plats",
                          style: MyTextStyles.subhead,
                        ),
                      ],
                    ),
                    menu!
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: InkWell(
                                  onTap: () {
                                    // ajouter!
                                    //     ? Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(builder: (context) => const AjouterMenu()),
                                    //       )
                                    //     : Utils.pushScreen(context, const MenuPopUp(), 0.5);
                                  },
                                  child: SizedBox(
                                    height: 12.h,
                                    width: 20.w,
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/menu.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Menu",
                                style: MyTextStyles.subhead,
                              ),
                            ],
                          )
                        : SizedBox(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: InkWell(
                            onTap: () {
                              // ajouter!
                              //     ? Navigator.push(
                              //         context,
                              //         MaterialPageRoute(builder: (context) => const AjouterProduit()),
                              //       )
                              //     : Utils.pushScreen(context, const ProduitPopUP(), 0.7);
                            },
                            child: SizedBox(
                              height: 12.h,
                              width: 20.w,
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/produit.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Produits",
                          style: MyTextStyles.subhead,
                        ),
                      ],
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
