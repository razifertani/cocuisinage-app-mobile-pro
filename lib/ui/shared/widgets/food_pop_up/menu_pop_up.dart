import 'package:cocuisinage_app_mobile_pro/ui/shared/divider.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:flutter/material.dart';

class MenuPopUp extends StatelessWidget {
  const MenuPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const MyDivider(),
          const SizedBox(
            height: 20,
          ),
          PopUpCard(title: "Boissons", fun: (startLoading, stopLoading, btnState) {}, iconPath: "assets/liste_de_course_icons/boissons.png"),
          PopUpCard(title: "Entrées", fun: (startLoading, stopLoading, btnState) {}, iconPath: "assets/recette_icons/entre.png"),
          PopUpCard(title: "Plats", fun: (startLoading, stopLoading, btnState) {}, iconPath: "assets/recette_icons/plat.png"),
          PopUpCard(title: "Désserts", fun: (startLoading, stopLoading, btnState) {}, iconPath: "assets/recette_icons/dessert.png"),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
