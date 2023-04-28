import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/boutique_widgets/boutique_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

import '../../../../shared/widgets/recettes_widgets/recette_card.dart';

class CreatorScreen extends StatefulWidget {
  const CreatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatorScreen> createState() => _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
  @override
  String dropdownvaluecateg = 'Catégorie';

  var categories = [
    'Catégorie',
    'Catégorie 2',
    'Catégorie 3',
    'Catégorie 4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Oeuf cocotte",
            style: MyTextStyles.appBarTextStyle.copyWith(fontSize: 16),
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ExploreScreen()),
                  // );
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                radius: 100.w < 480 ? 11.w : 6.w,
                backgroundImage: AssetImage("assets/icons/cocuisinage.png"),
              ),
            ),
            Column(children: [
              Padding(
                padding: EdgeInsets.all(7.w),
                child: Text("Cocuisinage",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
              Center(
                child: SizedBox(
                  width: 90.w,
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
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ajouter un filtre",
                        style: MyTextStyles.subhead
                            .copyWith(fontWeight: FontWeight.w600)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        5,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Chip(
                                shape: StadiumBorder(
                                    side: BorderSide(
                                  color: MyColors.red,
                                )),
                                labelPadding: const EdgeInsets.all(2.0),
                                label: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text("Entrée",
                                      style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp.clamp(14, 18))
                                          .copyWith(
                                              color: MyColors.red,
                                              fontWeight: FontWeight.w600)),
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 2,
                                padding: const EdgeInsets.all(8.0),
                              ),
                            )),
                  ],
                ),
              ),
              ...List.generate(
                4,
                (index) => RecetteCard(
                  mesRecettes: true,
                  imgPath: "assets/images/box.png",
                  nom: "title",
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Text("Voir tous",
                    style: MyTextStyles.body.copyWith(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    )),
              ),
            )
          ],
        )));
  }
}
