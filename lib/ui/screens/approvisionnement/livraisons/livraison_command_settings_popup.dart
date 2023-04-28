import 'package:flutter/material.dart';

import '../../../shared/divider.dart';
import '../../../shared/pop_up_card.dart';
import '../../../shared/widgets/modif_showmodel/modif_showmodel.dart';

class LivrasionCommandSettingsPopUp extends StatelessWidget {
  const LivrasionCommandSettingsPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        MyDivider(),
        SizedBox(
          height: 20,
        ),
        PopUpCard(title: "Réfuser le produit", fun: (a, b, c) {}),
        PopUpCard(title: "Ajouter au stock", fun: (a, b, c) {}),
        PopUpCard(
            title: "Ajouter la température",
            fun: (a, b, c) {
              showDialog(
                  context: context,
                  builder: (_) => ModifShowModel(
                        function: () {},
                        title: "Ajouter température",
                        content: "25°C",
                      ));
            }),
        PopUpCard(
            title: "Modifier prix",
            fun: (a, b, c) {
              showDialog(
                  context: context,
                  builder: (_) => ModifShowModel(
                        function: () {},
                        title: "Modifier prix",
                        content: "1 €",
                      ));
            }),
        PopUpCard(
            title: "Modifier la quantité",
            fun: (a, b, c) {
              showDialog(
                  context: context,
                  builder: (_) => ModifShowModel(
                        function: () {},
                        title: "Modifier quantité",
                        content: "1 ",
                      ));
            }),
      ]),
    );
  }
}
