import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/divider.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:flutter/material.dart';

class ProduitPopUP extends StatelessWidget {
  const ProduitPopUP({Key? key}) : super(key: key);

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
              title: "Viandes(2)",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/viande.png"),
          PopUpCard(
              title: "Fruits(9)",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/des-fruits.png"),
          PopUpCard(
              title: "Boissons(4)",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/boissons.png"),
          PopUpCard(
              title: "Fromages",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/fromage.png"),
          PopUpCard(
              title: "Produits transformés",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/croissant.png"),
          PopUpCard(
              title: "Légumes",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/legume.png"),
          PopUpCard(
              title: "Surgelés",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/des-surgeles.png"),
          PopUpCard(
              title: "Poissons",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/des-surgeles.png"),
          PopUpCard(
              title: "Oeufs",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/des-surgeles.png"),
          PopUpCard(
              title: "Céréales",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/des-surgeles.png"),
          PopUpCard(
              title: "Crémerie",
              fun: (startLoading, stopLoading, btnState) {},
              iconPath: "assets/liste_de_course_icons/des-surgeles.png"),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
