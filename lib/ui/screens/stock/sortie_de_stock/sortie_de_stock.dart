import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../../controllers/theme_controller.dart';
import '../../../shared/bottom_app_bar.dart';
import '../../../shared/floating_action_button_home.dart';
import '../../tutoriel/tutoriel_pop_up.dart';
import 'caisse.dart';
import 'commande.dart';
import 'menu.dart';

class SortieDeStock extends StatefulWidget {
  SortieDeStock({Key? key}) : super(key: key);

  @override
  State<SortieDeStock> createState() => _SortieDeStockState();
}

class _SortieDeStockState extends State<SortieDeStock> {
  var myGroup = AutoSizeGroup();

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            child: AutoSizeText(
              'Commande',
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
              group: myGroup,
            ),
          ),
          Tab(
            child: AutoSizeText(
              'Menu',
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
              group: myGroup,
            ),
          ),
          Tab(
            child: AutoSizeText(
              'Caisse',
              maxLines: 1,
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
              group: myGroup,
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
                "Sorties de stock",
                style: MyTextStyles.appBarTextStyle,
              ),
              centerTitle: true,
              backgroundColor: MyColors.red,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context))),
          body: const TabBarView(children: [
            CommandeSortieDeStock(),
            MenuSortieDeStock(),
            CaisseSortieDeStock(),
          ]),
        ),
      ),
    );
  }
}
