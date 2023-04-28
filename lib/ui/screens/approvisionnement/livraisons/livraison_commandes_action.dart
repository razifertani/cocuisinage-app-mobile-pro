import 'package:flutter/material.dart';

import '../../../shared/divider.dart';
import '../../../shared/pop_up_card.dart';
import '../../../shared/widgets/modif_showmodel/modif_showmodel.dart';

class LivraisonCommandeAction extends StatelessWidget {
  const LivraisonCommandeAction({Key? key}) : super(key: key);

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
          PopUpCard(title: "Ajouter la facture", fun: (a, b, c) {}),
          PopUpCard(title: "Réfuser la livraison", fun: (a, b, c) {}),
        ],
      )),
    );
  }
}
