import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mes_statistiques/plat/statis_plat_screen.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mes_statistiques/produit/statis_produit_screen.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mes_statistiques/rentabilite/statis_rentabilite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../../controllers/theme_controller.dart';

class StatistiqueMainScreen extends StatefulWidget {
  StatistiqueMainScreen({Key? key}) : super(key: key);

  @override
  State<StatistiqueMainScreen> createState() => _StatistiqueMainScreenState();
}

class _StatistiqueMainScreenState extends State<StatistiqueMainScreen> {
  TextEditingController rech = TextEditingController();

  int currentIndex = 0;

  switchTag(int value) {
    currentIndex = value;
    setState(() {});
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            child: Text(
              'Produit',
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
            ),
          ),
          Tab(
            child: Text(
              'Plats',
              style: MyTextStyles.subhead.copyWith(
                  color:
                      Theme.of(context).scaffoldBackgroundColor != Colors.black
                          ? Colors.black
                          : null),
            ),
          ),
          Tab(
            child: Text(
              'Rentabilité',
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
          appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Consumer<ThemeController>(
                  builder: (context, value, child) => ColoredBox(
                      color: value.dark ? Colors.black : Colors.white,
                      child: _tabBar),
                ),
              ),
              title: Text(
                "Mes statistiques",
                style: MyTextStyles.appBarTextStyle,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (_) => TutorielPopUp(
                      //           title: "Mes statistique",
                      //           description:
                      //               "Vous consulterez un tableau de bord permettant de suivre les indicateurs d’activité de votre établissement sous forme visuel (graphique, tableau, …). ",
                      //           numberOfPages: 2,
                      //           secDescription:
                      //               "Une comparaison sera possible selon la période souhaitée J/J-1, Mois N/Mois N-1….\nUn détail sera visible dans « Porte-Monnaie ».",
                      //         ));
                    },
                    icon: Icon(Icons.question_mark))
              ],
              centerTitle: true,
              backgroundColor: MyColors.red,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context))),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  StatisProduitScreen(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  StatisPlatScreen()
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  StatisRentabiliteScreen()
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
