import 'package:flutter/material.dart';

import '../../../shared/divider.dart';
import '../../../shared/pop_up_card.dart';
import 'item_settings/ajouter_tracabilite.dart';
import 'item_settings/creer_etiquette.dart';

class PopUpScreenSortieDeStock extends StatelessWidget {
  const PopUpScreenSortieDeStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const MyDivider(),
          const SizedBox(
            height: 10,
          ),
          PopUpCard(
              title: "Créer une étiquette",
              fun: (a, b, c) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreerEtiquetteSortieDeStock()),
                );
              }),
          PopUpCard(
              title: "Ajouter la température",
              fun: (a, b, c) {
                Navigator.pop(context);
                // showDialog(
                //     context: context,
                //     builder: (_) => ModifShowModel(
                //           function: () {},
                //           title: "Ajouter température",
                //           content: "25°C",
                //         ));
              }),
          PopUpCard(
              title: "Ajouter une tracabilité",
              fun: (a, b, c) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AjouterTracabiliteSortieDeStock()),
                );
              }),
          PopUpCard(
              title: "Déstocké",
              fun: (a, b, c) {
                Navigator.pop(context);
              }),
        ],
      )),
    );
  }
}
