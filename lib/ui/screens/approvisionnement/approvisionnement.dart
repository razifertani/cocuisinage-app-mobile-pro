import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/bottom_app_bar.dart';
import '../../shared/common_stat_card.dart';
import '../../shared/custom_card.dart';
import '../../shared/floating_action_button_home.dart';
import '../../shared/widgets/porte_monnaie_widgets/chart.dart';
import '../../shared/widgets/statistique_widgets/chart_widget.dart';

import 'carte/carte_screen.dart';
import 'liste_de_course/liste_de_course_screen.dart';
import 'livraisons/livraison_screen.dart';

class ApprovisoinnementScreen extends StatefulWidget {
  const ApprovisoinnementScreen({Key? key}) : super(key: key);

  @override
  State<ApprovisoinnementScreen> createState() =>
      _ApprovisoinnementScreenState();
}

class _ApprovisoinnementScreenState extends State<ApprovisoinnementScreen> {
  String dropdownvaluecateg = 'Annuels';

  var categories = [
    'Annuels',
    'Mensuels',
    'Categorie 3',
    'Categorie 4',
    'Categorie 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Approvisionement",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Réapprovisionement",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
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
                        CommonStatCard(
                            title: "Fournisseurs", content: "32", stat: false),
                        CommonStatCard(
                            title: "Produits", content: "32", stat: false),
                        CommonStatCard(
                            title: "Produits non liés",
                            content: "25",
                            stat: false),
                        CommonStatCard(
                            title: "Plats", content: "12", stat: true),
                        CommonStatCard(
                            title: "Recettes", content: "12", stat: false),
                      ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Historique",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 40.w,
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
                height: 20,
              ),
              const LineChartSample7(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 28.h,
                child: GridView.count(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    childAspectRatio: 1,
                    mainAxisSpacing: 1.5.h,
                    crossAxisSpacing: 1.5.h,
                    children: [
                      CustomCard(
                          imgPath: "assets/primary_icons/carte.png",
                          txt: "Ma carte",
                          quantite: 250,
                          fun: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CarteScreen()),
                            );
                          }),
                      CustomCard(
                          imgPath: "assets/primary_icons/liste_de_course.png",
                          txt: "Ma liste de course",
                          quantite: 250,
                          fun: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListeDeCourseScreen()),
                            );
                          }),
                      CustomCard(
                          imgPath: "assets/primary_icons/livraison.png",
                          txt: "Mes livraison",
                          quantite: 250,
                          fun: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LivraisonScreen()),
                            );
                          }),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
