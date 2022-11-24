import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/porte_monnaie.dart/histo_de_depense.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/porte_monnaie.dart/histo_de_vente/histo_de_vente.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/porte_monnaie.dart/mes_abonnements.dart';

import 'package:flutter/material.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';

import '../../shared/widgets/porte_monnaie_widgets/chart.dart';
import '../../shared/widgets/porte_monnaie_widgets/porte_monnaie_card.dart';
import '../tutoriel/tutoriel_pop_up.dart';
import 'exporter_mes_donnees.dart';

class MonPorteMonnaieScreen extends StatelessWidget {
  const MonPorteMonnaieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            PopupMenuButton(
              padding: const EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "Exporter mes données",
                  child: Text(
                    "Exporter mes données",
                    style: MyTextStyles.subhead,
                  ),
                ),
              ],
              onSelected: (item) {
                switch (item) {
                  case "Exporter mes données":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExporterMesDonnes()),
                    );
                    break;
                  default:
                }
              },
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => TutorielPopUp(
                            title: "Mon porte monnaies",
                            description:
                                "Vous aurez la possibilité d’alimenter votre compte virtuel et de consulter votre solde.",
                            numberOfPages: 2,
                            secDescription:
                                "Vous pourrez voir l’historique du détail de vos dépenses co-cuisinage à une fréquence donnée et télécharger les factures de l’ensemble de vos activité.",
                          ));
                },
                icon: Icon(Icons.question_mark))
          ],
          title: Text(
            "Mon porte monnaie",
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
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Dashboard",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                PorteMonnaieCard(
                    title: "Mon solde restant",
                    havePopup: true,
                    price: 123,
                    cardFunction: () {},
                    imgPath: "assets/porte_monnaie_icons/wallet.png"),
                PorteMonnaieCard(
                    title: "Mes dépenses du mois",
                    price: 123,
                    cardFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoDeDepense()),
                      );
                    },
                    imgPath:
                        "assets/porte_monnaie_icons/taux-de-croissance.png"),
                PorteMonnaieCard(
                    title: "Mes ventes du mois",
                    price: 123,
                    cardFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoDeVente()),
                      );
                    },
                    imgPath: "assets/porte_monnaie_icons/profits.png"),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Suivi de l’année 2022",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BarChartSample1(),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Mes abonnements",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const MesAbonnements()
          ],
        ),
      )),
    );
  }
}
