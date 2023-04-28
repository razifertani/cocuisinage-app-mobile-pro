import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';

import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../shared/widgets/recettes_widgets/preparation_ing_card.dart';

class RecettePreparation extends StatefulWidget {
  const RecettePreparation({Key? key}) : super(key: key);

  @override
  State<RecettePreparation> createState() => _RecettePreparationState();
}

class _RecettePreparationState extends State<RecettePreparation> {
  int currentIndex = 0;

  switchIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      4,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                switchIndex(index);
                              },
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: currentIndex == index
                                            ? MyColors.red
                                            : Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: MyTextStyles.headline
                                          .copyWith(color: MyColors.red),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Comment faire ?",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Ingrédinets",
                style: MyTextStyles.subhead,
              ),
              const SizedBox(
                height: 10,
              ),
              const PreparationIngCard(),
              const PreparationIngCard(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Faire revenir l’oignon, verser les petits pois la laitue mélanger, recouvrir et laisser sur feu doux 5 minutes",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
