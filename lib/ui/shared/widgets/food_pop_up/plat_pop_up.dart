import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/divider.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:flutter/material.dart';

class PlatPopUp extends StatelessWidget {
  const PlatPopUp({Key? key}) : super(key: key);

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
          PopUpCard(
              title: "Entrées",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Plats",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Désserts",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Amuse-bouche",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Fromages",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Boissons",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Boulangerie",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Les bases",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Sauces",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
