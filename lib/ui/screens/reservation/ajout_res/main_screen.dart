import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/ajout_res/personees.dart';
import 'package:flutter/material.dart';

import '../../../shared/custom_button.dart';

import '../../../shared/widgets/success_show_model/success_show_model.dart';
import 'date.dart';
import 'heure.dart';
import 'information.dart';

class MainResScreen extends StatefulWidget {
  MainResScreen({Key? key}) : super(key: key);

  @override
  State<MainResScreen> createState() => _MainResScreenState();
}

class _MainResScreenState extends State<MainResScreen> {
  void switchIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  int currentIndex = 0;
  List<String> imagesPath = [
    "assets/icons/calend.png",
    "assets/icons/clock.png",
    "assets/icons/personnes.png",
    "assets/icons/information.png"
  ];
  List<String> labels = ["Date", "Heure", "Personnes", "Informations"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Réserver",
              style: MyTextStyles.headline,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    4,
                    (index) => GestureDetector(
                      onTap: () {
                        switchIndex(index);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            imagesPath[index],
                            color: currentIndex == index
                                ? Theme.of(context).primaryColor
                                : Color(0xFF8E8E8E),
                          ),
                          Text(
                            labels[index],
                            style: TextStyle(
                                color: currentIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Color(0xFF8E8E8E)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (currentIndex == 0) DateScreen(),
            if (currentIndex == 1) HeureScreen(),
            if (currentIndex == 2) PersonnesScreen(),
            if (currentIndex == 3) InformationsScreen(),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                txt: currentIndex == 3 ? "Réserver" : "Suivant",
                fun: (a, b, c) {
                  if (currentIndex == 3) {
                    showDialog(
                        context: context,
                        builder: (_) => SuccessShowmodel(
                              description: "Super! réservation asurée",
                            ));
                  }
                  if (currentIndex < 3) currentIndex++;
                  setState(() {});
                }),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
