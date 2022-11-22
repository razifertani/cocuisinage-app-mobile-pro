import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/commandes_widgets/command_detail/detail_card.dart';

class CommandDetailScreen extends StatelessWidget {
  CommandDetailScreen({Key? key}) : super(key: key);
  final List<String> produits = [
    "Salade de fuit",
    "Bagel",
    "Agneau en cocotte",
    "Tartares"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Details",
              style: MyTextStyles.appBarTextStyle,
            ),
            actions: [
              PopupMenuButton(
                padding: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                icon: const Icon(
                  Icons.more_vert,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: "Appelle le livreur",
                    child: Text(
                      "Appelle le livreur",
                      style: MyTextStyles.subhead,
                    ),
                  ),
                  PopupMenuItem(
                    value: "Envoyer message au client",
                    child: Text(
                      "Envoyer message au client",
                      style: MyTextStyles.subhead,
                    ),
                  ),
                  PopupMenuItem(
                    value: "Laisser un commentaire",
                    child: Text(
                      "Laisser un commentaire",
                      style: MyTextStyles.subhead,
                    ),
                  ),
                  PopupMenuItem(
                    value: "Imprimer commande",
                    child: Text(
                      "Imprimer commande",
                      style: MyTextStyles.subhead,
                    ),
                  ),
                ],
                onSelected: (item) {
                  switch (item) {
                    case "Appelle le livreur":
                      break;
                    case "Envoyer message au client":
                      break;
                    case "Laisser un commentaire":
                      break;
                    case "Imprimer commande":
                      break;
                    default:
                  }
                },
              ),
              IconButton(
                  onPressed: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (_) => TutorielPopUp(
                    //           title: "Systeme de couleurs",
                    //           description:
                    //               "Vert : commande pret\nOrangé : Préparation en cours \nRouge : commande n’est pas pret ",
                    //         ));
                  },
                  icon: const Icon(Icons.question_mark))
            ],
            centerTitle: true,
            backgroundColor: MyColors.red,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Détails du commande n° 04",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Id client : 2346Mk ",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(
                    4,
                    (index) => DetailCard(
                          nom: produits[index],
                          prix: "20",
                          quantite: 1,
                        )),
                DetailCard(
                  nom: "Salade de fruit",
                  prix: "22 €",
                  quantite: 1,
                  remarque: "Remarque <Sans fraise> ",
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sous-totale",
                      style: MyTextStyles.headline
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "100€",
                      style: MyTextStyles.headline
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomButton(txt: "Valider", fun: (a, b, c) {}),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
