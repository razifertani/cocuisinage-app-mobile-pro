import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/divider.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:flutter/material.dart';

class PlatPopUp extends StatelessWidget {
  Function? callBack;
  PlatPopUp({Key? key, this.callBack}) : super(key: key);
  List<String> names = [
    "Entrées",
    "Plats",
    "Désserts",
    "Amuse-bouche",
    "Fromages",
    "Boissons",
    "Boulangerie",
    "Les bases",
    "Sauces"
  ];

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
          ...List.generate(
            names.length,
            (index) => PopUpCard(
                title: names[index],
                fun: (startLoading, stopLoading, btnState) {
                  callBack?.call();
                },
                iconPath: "assets/liste_de_course_icons/viande.png"),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
