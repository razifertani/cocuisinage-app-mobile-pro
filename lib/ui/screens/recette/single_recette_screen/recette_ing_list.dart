import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/widgets/recettes_widgets/aliments/aliment_card.dart';

class RecIngsList extends StatelessWidget {
  const RecIngsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        'Nombre de personnes à table ',
                        style: MyTextStyles.body
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                          'La quantité de chaque ingrédient est variable en fonction du nombre de personnes',
                          style: MyTextStyles.body)
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people,
                      color: MyColors.red,
                      size: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle,
                              color: MyColors.red,
                            )),
                        Text(' 2 Pers',
                            style: MyTextStyles.body
                                .copyWith(fontWeight: FontWeight.w600)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle,
                              color: MyColors.red,
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Column(
                children: List.generate(
                  3,
                  (index) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AlimentCard(),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child:
                    CustomButton(txt: "Ajouter ingredient", fun: (a, b, c) {})),
          )
        ],
      )
    ]);
  }
}
