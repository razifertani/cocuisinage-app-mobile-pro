import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import 'food_top_card.dart';

class RecetteIdentite extends StatelessWidget {
  const RecetteIdentite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 1.h,
          ),
          const FoodTopCard(),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.all(2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                difucultyWidget(1),
              ],
            ),
          ),
          Text(
            "Description",
            style: MyTextStyles.headline,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Ajouter des dés de jambon et vous avez une salade compléte pour le déjeuner des enfants",
            style: MyTextStyles.body,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Thématique de la recette",
            style: MyTextStyles.headline,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            labelPadding: const EdgeInsets.all(2.0),
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text("Salades Composes",
                                  style: MyTextStyles.body
                                      .copyWith(fontWeight: FontWeight.w600)),
                            ),
                            backgroundColor: const Color(0xFFFCC669),
                            elevation: 2,
                            padding: const EdgeInsets.all(8.0),
                          ),
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget difucultyWidget(nbrIconColored) {
    List<Icon> coloredIcon = List.generate(
      nbrIconColored,
      (index) => Icon(
        Icons.circle,
        color: MyColors.red,
      ),
    );
    for (var i = nbrIconColored; i < 5; i++) {
      coloredIcon.add(Icon(
        Icons.circle_outlined,
        color: MyColors.red,
      ));
    }

    String text = "";
    switch (nbrIconColored) {
      case 1:
        text = 'Cuisinier Débutant';
        break;
      case 2:
        text = 'Cuisinier Occasionnel';
        break;
      case 3:
        text = 'Cuisinier Intermédiaire';
        break;
      case 4:
        text = 'Cuisinier Expérimenté';
        break;
      case 5:
        text = 'Cuisinier Confirmé';
        break;
      default:
    }
    return Column(
      children: [
        Row(
          children: <Widget>[
            ...coloredIcon,
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(text, style: MyTextStyles.headline),
      ],
    );
  }
}
