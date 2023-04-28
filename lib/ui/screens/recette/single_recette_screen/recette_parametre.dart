import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/custom_card_text_form.dart';
import '../../../shared/widgets/fournisseur_reseau/fournisseur_rx_card.dart';
import '../../../shared/widgets/modif_showmodel/modif_prix_qt_showmodel.dart';
import '../../../shared/widgets/recettes_widgets/simple_prod_card.dart';

class RecetteParemetre extends StatefulWidget {
  const RecetteParemetre({Key? key}) : super(key: key);

  @override
  State<RecetteParemetre> createState() => _RecetteParemetreState();
}

class _RecetteParemetreState extends State<RecetteParemetre> {
  TextEditingController qte = TextEditingController();

  String dropdownvaluecateg = 'g';

  var categories = [
    'g',
    'kg',
    'ml',
    'l',
  ];
  double opacity = 0.5;
  int currentIndex = 0;
  switchCard(int index) {
    currentIndex = index;
    setState(() {});
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Paramétres",
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Quantité minimum a commander",
            style: MyTextStyles.subhead,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                  width: 40.w,
                  child: CustomCardTextForm(
                      controller: qte, hintText: "Quantité")),
              SizedBox(
                width: 20.w,
                child: Card(
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
                        });
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Switch(
                activeColor: MyColors.red,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Quantité maximum a commander",
            style: MyTextStyles.subhead,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                  width: 40.w,
                  child: CustomCardTextForm(
                      controller: qte, hintText: "Quantité")),
              SizedBox(
                width: 20.w,
                child: Card(
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
                        });
                      },
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Switch(
                activeColor: MyColors.red,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Fournisseur",
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
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
                                  opacity: currentIndex == index ? opacity : 1,
                                  child: FournisseurReseauCard(
                                    imgPath:
                                        "https://www.espace-concours.fr/drupal/files/chef_cuisinier_metier.jpg",
                                    nom: "nom",
                                    type: "type de fournisseur",
                                  ),
                                ),
                                currentIndex == index
                                    ? Positioned(
                                        right: 90,
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
            height: 20,
          ),
          Text(
            "1 ere produit ",
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          SimpleProdCard(
            nom: "Pomme de terre",
            imgPath:
                "https://5.imimg.com/data5/ANDROID/Default/2021/2/UH/HH/LB/44089979/potatoes-jpg-250x250.jpg",
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Prix de fournisseur",
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70.w,
                height: 8.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "10.00€",
                        style: MyTextStyles.subhead,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 15.w,
                height: 8.h,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => ModifPrixQteShowmodel());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: Center(
                        child: Icon(
                      Icons.edit_outlined,
                      color: MyColors.red,
                    )),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Quantité ",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 40.w,
                    height: 8.h,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "10.00€",
                            style: MyTextStyles.subhead,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prix",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 40.w,
                    height: 8.h,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "10.00€",
                            style: MyTextStyles.subhead,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
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
                                  opacity: currentIndex == index ? opacity : 1,
                                  child: FournisseurReseauCard(
                                    imgPath:
                                        "https://www.espace-concours.fr/drupal/files/chef_cuisinier_metier.jpg",
                                    nom: "nom",
                                    type: "type de fournisseur",
                                  ),
                                ),
                                currentIndex == index
                                    ? Positioned(
                                        right: 90,
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
            height: 20,
          ),
          Text(
            "Cout de revient",
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Prix totale par personne",
            style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 70.w,
            height: 8.h,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "10.00€",
                    style: MyTextStyles.subhead,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Prix de vente de la boutique",
            style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70.w,
                height: 8.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "10.00€",
                        style: MyTextStyles.subhead,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 15.w,
                height: 8.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Center(
                      child: Icon(
                    Icons.edit_outlined,
                    color: MyColors.red,
                  )),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Bénéfice",
            style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 70.w,
            height: 8.h,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "10.00€",
                    style: MyTextStyles.subhead,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
