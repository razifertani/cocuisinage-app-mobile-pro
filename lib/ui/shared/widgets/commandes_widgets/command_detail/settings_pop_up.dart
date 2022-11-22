import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/divider.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:flutter/material.dart';

class SettingsPopUP extends StatelessWidget {
  const SettingsPopUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        MyDivider(),
        SizedBox(
          height: 20,
        ),
        PopUpCard(title: "Rupture de stock", fun: (a, b, c) {}),
        SizedBox(
          height: 10,
        ),
        PopUpCard(title: "Remplacer", fun: (a, b, c) {}),
        SizedBox(
          height: 10,
        ),
        PopUpCard(
            title: "Envoyer en cuisine",
            fun: (a, b, c) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const PreparationDeCommandeScreen()),
              // );
            }),
        SizedBox(
          height: 10,
        ),
        PopUpCard(title: "Ajouter une température", fun: (a, b, c) {})
      ]),
    );
  }
}
