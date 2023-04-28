import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/serach_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/bottom_app_bar.dart';
import '../../../shared/floating_action_button_home.dart';
import '../../../shared/widgets/recettes_widgets/recette_card.dart';

class RecetteAcceuil extends StatefulWidget {
  RecetteAcceuil({Key? key}) : super(key: key);

  @override
  State<RecetteAcceuil> createState() => _RecetteAcceuilState();
}

class _RecetteAcceuilState extends State<RecetteAcceuil> {
  String dropdownvaluecateg = 'Categorie 1';

  var categories = [
    'Categorie 1',
    'Categorie 2',
    'Categorie 3',
    'Categorie 4',
    'Categorie 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Recettes",
              style: MyTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            backgroundColor: MyColors.red,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Catégories",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 45.w,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          value: dropdownvaluecateg,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: categories.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvaluecateg = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 45.w,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          value: dropdownvaluecateg,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: categories.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvaluecateg = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ajouter un filtre",
                      style: MyTextStyles.headline
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: MyColors.red,
                        ))
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        5,
                        (index) => GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Chip(
                                  backgroundColor: Colors.white,
                                  labelPadding: const EdgeInsets.all(2.0),
                                  shape: StadiumBorder(
                                      side: BorderSide(color: MyColors.red)),
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Text("Economique",
                                        style: MyTextStyles.subhead.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: MyColors.red)),
                                  ),
                                  elevation: 5.0,
                                  padding: const EdgeInsets.all(8.0),
                                ),
                              ),
                            )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ...List.generate(
                  4,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RecetteCard(
                          imgPath: "assets/images/box.png",
                          nom: "title",
                        ),
                      ))
            ],
          ),
        )));
  }
}
