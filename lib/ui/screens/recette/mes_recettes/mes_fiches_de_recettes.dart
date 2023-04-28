import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/mes_recettes/mes_recettes.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/mes_recettes/produit_favorites.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/recette/mes_recettes/recette_favorites.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/serach_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

import '../../../../controllers/theme_controller.dart';

import '../../tutoriel/tutoriel_pop_up.dart';

class MesFichesDeRecettes extends StatefulWidget {
  MesFichesDeRecettes({Key? key}) : super(key: key);

  @override
  State<MesFichesDeRecettes> createState() => _MesFichesDeRecettesState();
}

class _MesFichesDeRecettesState extends State<MesFichesDeRecettes> {
  TextEditingController rech = TextEditingController();

  int currentIndex = 0;

  switchTag(int value) {
    currentIndex = value;
    setState(() {});
  }

  var myGroup = AutoSizeGroup();

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            child: AutoSizeText(
              'Mes recettes',
              maxLines: 1,
              group: myGroup,
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
            ),
          ),
          Tab(
            child: AutoSizeText(
              'Recettes favorites',
              minFontSize: 10,
              maxLines: 1,
              group: myGroup,
              style: MyTextStyles.subhead.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor != Colors.black
                    ? Colors.black
                    : null,
              ),
            ),
          ),
          Tab(
            child: AutoSizeText(
              'Produit favoris',
              maxLines: 1,
              group: myGroup,
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          // floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => RecetteInfo()),
          //     );
          //   },
          //   icon: const Icon(
          //     Icons.add_circle,
          //     color: Colors.white,
          //     size: 30,
          //   ),
          //   label: const Text('Ajouter une recette'),
          //   backgroundColor: MyColors.red,
          // ),
          appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Consumer<ThemeController>(
                  builder: (context, value, child) => ColoredBox(
                      color: value.dark ? Colors.black : Colors.white,
                      child: _tabBar),
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => TutorielPopUp(
                                title: "Mes recettes",
                                description:
                                    "Vous puvez consulter l’ensemble des recettes, les ajouter en favoris, créer une recette et la partager",
                                numberOfPages: 2,
                                secDescription:
                                    "Lorsqu’vous consultez une recette Vous pouvez voir la description de la recette (ingrédients, étapes de préparation, conseils et suivi nutritionnel) et les Statistiques d’historique.",
                              ));
                    },
                    icon: Icon(Icons.question_mark))
              ],
              title: Text(
                "Recettes",
                style: MyTextStyles.appBarTextStyle,
              ),
              centerTitle: true,
              backgroundColor: MyColors.red,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context))),
          body: TabBarView(children: [
            MesRecettesScreen(),
            RecetteFavorites(),
            ProduitsFavorites()
          ]),
        ),
      ),
    );
  }
}
