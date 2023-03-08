import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PeriodeDeVenteShowModel extends StatefulWidget {
  const PeriodeDeVenteShowModel({Key? key}) : super(key: key);

  @override
  State<PeriodeDeVenteShowModel> createState() =>
      _PeriodeDeVenteShowModelState();
}

class _PeriodeDeVenteShowModelState extends State<PeriodeDeVenteShowModel> {
  int currentIndexMeteo = 0;
  void switchIndexMeteo(int index) {
    currentIndexMeteo = index;
    setState(() {});
  }

  int currentIndexStars = 0;

  void switchIndexStars(int index) {
    currentIndexStars = index;
    setState(() {});
  }

  List<String> icons = [
    "assets/meteo_icons/sun.png",
    "assets/meteo_icons/cloud-sunny.png",
    "assets/meteo_icons/cloud.png",
    "assets/meteo_icons/cloud-drizzle.png",
    "assets/meteo_icons/cloud-lightning.png",
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 40.h,
            width: 85.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ouvrir une periode de vente",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Impression générale",
                    style: MyTextStyles.subhead.copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          5,
                          (index) => SizedBox(
                                width: 28,
                                child: GestureDetector(
                                    onTap: () {
                                      switchIndexStars(index);
                                    },
                                    child: currentIndexStars < index
                                        ? Icon(
                                            Icons.star_border,
                                            color: Colors.grey,
                                          )
                                        : Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          )),
                              ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Météo",
                    style: MyTextStyles.subhead.copyWith(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          5,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: () {
                                      switchIndexMeteo(index);
                                    },
                                    child: Image.asset(
                                      icons[index],
                                      color: currentIndexMeteo == index
                                          ? Colors.red
                                          : null,
                                    )),
                              ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      txt: "Valider",
                      fun: (a, b, c) {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
