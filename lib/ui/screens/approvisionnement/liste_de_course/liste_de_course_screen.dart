import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../../utils/utils.dart';

import '../../../shared/widgets/food_pop_up/plat_pop_up.dart';
import '../../../shared/widgets/food_pop_up/produit_pop_up.dart';
import '../../../shared/widgets/fournisseur_reseau/fournisseur_rx_card.dart';
import '../../../shared/widgets/liste_de_course/ingredient/ing_card.dart';

import '../../tutoriel/tutoriel_pop_up.dart';

import 'conversion_en_email.dart';

class ListeDeCourseScreen extends StatefulWidget {
  ListeDeCourseScreen({Key? key}) : super(key: key);

  @override
  State<ListeDeCourseScreen> createState() => _ListeDeCourseScreenState();
}

class _ListeDeCourseScreenState extends State<ListeDeCourseScreen> {
  double opacity = 0.5;
  int currentIndex = 0;
  switchCard(int index) {
    currentIndex = index;
    setState(() {});
  }

  String dropdownvaluecateg = 'Categorie 1';

  var categories = [
    'Categorie 1',
    'Categorie 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => TutorielPopUp(
                            numberOfPages: 1,
                            title: "Ma liste de course",
                            description:
                                "Les ingrédients manquants seront classifiés par rayon et fournisseur au meilleur prix. Vous pourrez convertir votre commande par appel/email/sms à une date de livraison définie.",
                          ));
                },
                icon: const Icon(Icons.question_mark))
          ],
          title: Text(
            "ma liste de courses",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Vous avez 4 produits a commander !",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButton(
                  underline: const SizedBox(),
                  value: dropdownvaluecateg,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: categories.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvaluecateg = newValue!;
                      switch (newValue) {
                        case "Categorie 1":
                          Utils.pushScreen(context, PlatPopUp(), 0.7);
                          break;
                        case "Categorie 2":
                          Utils.pushScreen(context, ProduitPopUP(), 0.7);
                          break;
                        default:
                      }
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Mes produits",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: SizedBox(
                          height: 30.h,
                          width: 55.w,
                          child: ListeDeCourseIngCard(
                              // imgPath: ImagePathsAndNames.produitsImages[index],
                              // prix: ImagePathsAndNames.prix[index],
                              // title: ImagePathsAndNames.produitsNames[index],
                              ),
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Prix moyen estimé:",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text("12 €",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                "Mon réseau de producteur",
                maxLines: 1,
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      5,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                switchCard(index);
                                opacity = 0.5;

                                setState(() {});
                              },
                              child: Stack(
                                children: [
                                  Opacity(
                                      opacity:
                                          currentIndex == index ? opacity : 1,
                                      child: FournisseurReseauCard(
                                        imgPath:
                                            "https://www.espace-concours.fr/drupal/files/chef_cuisinier_metier.jpg",
                                        nom: "nom",
                                        type: "type de fournisseur",
                                      )),
                                  currentIndex == index
                                      ? Positioned(
                                          right: 100,
                                          top: 60,
                                          child: Image.asset(
                                            "assets/images/rounded_tick.png",
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ),
                          ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context, builder: (_) => ConversionEnEmail());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: MyColors.red,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "conversion en email",
                        style: MyTextStyles.body.copyWith(color: MyColors.red),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors.red,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "conversion en sms",
                      style: MyTextStyles.body.copyWith(color: MyColors.red),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
