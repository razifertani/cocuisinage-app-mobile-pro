import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../../controllers/theme_controller.dart';
import '../../tutoriel/tutoriel_pop_up.dart';
import 'commandes_livraison_annules.dart';
import 'commandes_livraison_confirmes.dart';
import 'commandes_livraison_en_attentes.dart';

class LivraisonScreen extends StatefulWidget {
  const LivraisonScreen({Key? key}) : super(key: key);

  @override
  State<LivraisonScreen> createState() => _LivraisonScreenState();
}

class _LivraisonScreenState extends State<LivraisonScreen> {
  var myGroup = AutoSizeGroup();
  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.red,
        tabs: [
          Tab(
            child: AutoSizeText(
              'Confirmé',
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
              'en attente ',
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
              'Annulé',
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
  TextEditingController rech = TextEditingController();
  int currentIndex = 0;
  switchTab(int value) {
    currentIndex = value;
    setState(() {});
  }

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
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => TutorielPopUp(
                              numberOfPages: 3,
                              title: "Mes livraisons",
                              description:
                                  "vous retrouverez la liste de vos livraisons en attente trié par rayon et fournisseur",
                              secDescription:
                                  "Vous pourrez confirmer ou refuser la livraison, modifier le prix d’achat des ingrédients et télécharger la facture et enfin ajouter la température de la livraison en  la refusant si elle n’est pas conforme (norme HCCP)",
                              thirdDescription:
                                  "Une fois la livraison acceptée, les produits alimenteront le stock de la boutique.",
                            ));
                  },
                  icon: const Icon(Icons.question_mark))
            ],
            title: Text(
              "mes livraisons",
              style: MyTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            backgroundColor: MyColors.red,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: const TabBarView(children: [
          SingleChildScrollView(
            child: CommandesLivraisonConfirm(),
          ),
          SingleChildScrollView(
            child: CommandesLivraisonEnAttentes(),
          ),
          SingleChildScrollView(
            child: CommadesLivraisonAnnules(),
          ),
        ]),
      ),
    );
  }
}
