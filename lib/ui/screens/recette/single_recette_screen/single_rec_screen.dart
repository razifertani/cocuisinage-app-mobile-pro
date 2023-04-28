import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/single_recette_screen/recette_header.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/single_recette_screen/recette_identite.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/single_recette_screen/recette_ing_list.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/single_recette_screen/recette_parametre.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/single_recette_screen/recette_preparation.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/single_recette_screen/recette_stat.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/recettes_widgets/recette_tab_bar_card.dart';

class SingleRecScreen extends StatefulWidget {
  const SingleRecScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SingleRecScreen> createState() => _SingleRecScreenState();
}

class _SingleRecScreenState extends State<SingleRecScreen> {
  int currentIndex = 0;

  switchTab(int value) {
    currentIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Oeuf cocotte",
            style: MyTextStyles.appBarTextStyle.copyWith(fontSize: 16),
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ExploreScreen()),
                  // );
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          ],
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const RecHeader(),
                // RecTabbar(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RecetteTabBarCard(
                            title: "Identité",
                            imgPath: "assets/recette_icons/account-outline.png",
                            borderColor:
                                currentIndex == 0 ? MyColors.red : Colors.white,
                            cardFunction: () => switchTab(0)),
                        RecetteTabBarCard(
                            title: "Ingrédients",
                            imgPath: "assets/recette_icons/frigo-noir.png",
                            borderColor:
                                currentIndex == 1 ? MyColors.red : Colors.white,
                            cardFunction: () => switchTab(1)),
                        RecetteTabBarCard(
                            title: "Préparation",
                            imgPath:
                                "assets/recette_icons/equipement-de-cuisine.png",
                            borderColor:
                                currentIndex == 2 ? MyColors.red : Colors.white,
                            cardFunction: () => switchTab(2)),
                        RecetteTabBarCard(
                            title: "Statistique",
                            imgPath: "assets/recette_icons/stat.png",
                            borderColor:
                                currentIndex == 3 ? MyColors.red : Colors.white,
                            cardFunction: () => switchTab(3)),
                        RecetteTabBarCard(
                            title: "Paramétres",
                            imgPath: "assets/icons/black_settings.png",
                            borderColor:
                                currentIndex == 4 ? MyColors.red : Colors.white,
                            cardFunction: () => switchTab(4)),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: 28.w,
                            height: 14.h,
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  )),
                              color: Colors.white,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "21€",
                                      style: MyTextStyles.headline.copyWith(
                                          color: MyColors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text('Prix',
                                        style: MyTextStyles.body.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10.sp.clamp(12, 14))),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                if (currentIndex == 0) const RecetteIdentite(),

                if (currentIndex == 1) const RecIngsList(),
                if (currentIndex == 2) const RecettePreparation(),
                if (currentIndex == 3) RecetteStat(),
                if (currentIndex == 4) const RecetteParemetre()
              ]));
        }));
  }
}
