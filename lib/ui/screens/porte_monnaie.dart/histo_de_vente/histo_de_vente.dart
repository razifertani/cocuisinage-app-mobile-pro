import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/porte_monnaie.dart/histo_de_vente/caisse_tab.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/porte_monnaie.dart/histo_de_vente/livraison_tab.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/porte_monnaie.dart/histo_de_vente/retrait_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../../controllers/theme_controller.dart';

class HistoDeVente extends StatefulWidget {
  const HistoDeVente({Key? key}) : super(key: key);

  @override
  State<HistoDeVente> createState() => _HistoDeVenteState();
}

class _HistoDeVenteState extends State<HistoDeVente> {
  var myGroup = AutoSizeGroup();
  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            child: AutoSizeText(
              'Caisse',
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
              'Livraison',
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
              'Retrait',
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
    return DefaultTabController(
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
              "Historique des ventes",
              style: MyTextStyles.appBarTextStyle,
            ),
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
                CaisseTabPorteMonnaie()
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                LivraisonTabPorteMonnaie()
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                RetraitTabPorteMonnaie()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
