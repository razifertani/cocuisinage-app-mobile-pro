import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/stock/sortie_de_stock/sortie_de_stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';

import '../../shared/common_stat_card.dart';
import '../../shared/widgets/serach_bar/search_bar.dart';

import '../../shared/widgets/stock/frigo_card/frigo_card.dart';
import '../tutoriel/tutoriel_pop_up.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  TextEditingController rech = TextEditingController();
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  String dropdownvaluecateg = 'Categorie 1';

  var categories = [
    'Categorie 1',
    'Categorie 2',
    'Categorie 3',
    'Categorie 4',
    'Categorie 5',
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScope.of(context).unfocus();
      }),
      child: Scaffold(
        floatingActionButton: SpeedDial(
          openCloseDial: isDialOpen,
          overlayOpacity: 0,
          activeChild: Icon(
            Icons.close,
            color: MyColors.red,
          ),
          icon: Icons.add,
          iconTheme: IconThemeData(color: MyColors.red, size: 30),
          backgroundColor: Colors.white,
          buttonSize: const Size(65, 65),
          childrenButtonSize: const Size(70, 70),
          children: [
            SpeedDialChild(
                child: IconButton(
                    onPressed: () {
                      isDialOpen.value = false;
                      // showDialog(
                      //     context: context,
                      //     builder: (_) => const CategoriePopUpCardStock());
                    },
                    icon: Icon(
                      Icons.add,
                      color: MyColors.red,
                      size: 30,
                    ))),
            SpeedDialChild(
                child: InkWell(
              onTap: () {
                isDialOpen.value = false;
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => ScannerProduitStock()),
                // );
              },
              child: Image.asset(
                "assets/stock_icons/qr.png",
                height: 30,
                width: 30,
              ),
            )),
          ],
        ),
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => TutorielPopUp(
                              title: "Mon stock",
                              description:
                                  "Vous pourrez suivre en temps réel les flux entrants et sortants du stock durant l’activité de votre boutique  (cf. gestion de mes commandes, ma carte, mes livraisons, ma boutique)",
                              numberOfPages: 2,
                              secDescription:
                                  "Vous pourrez modifier/supprimer un produit du stock et prendre une photo de la DLC d’un produit donné permettant l’automatisation des règles HACCP.",
                            ));
                  },
                  icon: Icon(Icons.question_mark))
            ],
            title: Text(
              "Mon stock",
              style: MyTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            backgroundColor: MyColors.red,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mes stats",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: SizedBox(
                    height: 22.h,
                    child: GridView.count(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 1,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 1.5.h,
                        crossAxisSpacing: 1.5.h,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SortieDeStock()),
                              );
                            },
                            child: CommonStatCard(
                                title: "Sortie de Stock",
                                content: "32",
                                stat: false),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => LivraisonScreen()),
                              // );
                            },
                            child: CommonStatCard(
                                title: "Livraison en attente",
                                content: "32",
                                stat: false),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => BoutiqueScreen()),
                              // );
                            },
                            child: CommonStatCard(
                                title: "Produits",
                                content: "510€",
                                stat: false),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => BoutiqueScreen()),
                              // );
                            },
                            child: CommonStatCard(
                                title: "Plats", content: "12", stat: false),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           MesFichesDeRecettes()),
                              // );
                            },
                            child: CommonStatCard(
                                title: "Recettes", content: "12", stat: false),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Mon frigo",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                SearchBar(
                  controller: rech,
                  hintText: "Recherche",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 45.w,
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
                    SizedBox(
                      width: 45.w,
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.82,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20),
                    itemCount: 4,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const ProductScreen()),
                            // );
                          },
                          child: FrigoCard(
                            imgPath: "assets/images/box.png",
                            title: "title",
                          ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
