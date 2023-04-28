import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/widgets/carte_widgets/recette_card.dart';
import '../../../shared/widgets/planning_widgets/horizontal_calendar.dart';
import '../../../shared/widgets/serach_bar/search_bar.dart';
import '../../tutoriel/tutoriel_pop_up.dart';
import 'ingredient/ing_manquantes.dart';
import 'ingredient/liste_ing.dart';

class CarteScreen extends StatefulWidget {
  const CarteScreen({Key? key}) : super(key: key);

  @override
  State<CarteScreen> createState() => _CarteScreenState();
}

class _CarteScreenState extends State<CarteScreen> {
  TextEditingController rech = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Ma carte",
            style: MyTextStyles.appBarTextStyle,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => TutorielPopUp(
                          title: "Ma carte",
                          description:
                              "Le restaurateur va consulter les plats qu’il aura ajouté à sa boutique et/ou les ingrédients nécessaire à la préparation de sa recette.",
                          numberOfPages: 2,
                          secDescription:
                              "Grâce aux paramètres « nombre de couverts » et les recettes à réaliser, le système générera une liste d’ingrédients manquants  en fonction de son stock actuel. Il pourra les ajouter à sa liste de courses afin de se réalimenter. "));
                },
                icon: const Icon(Icons.question_mark))
          ],
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: GestureDetector(
        onTap: (() {
          FocusScope.of(context).unfocus();
          // _textEditingController.clear();
        }),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HorizontalCalendar(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Menu facile à utiliser",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
              SearchBar(controller: rech, hintText: "chercher une recette..."),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Ingrédient",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      txt: "Liste d'ingrédients",
                      fun: (a, b, c) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListeIng()),
                        );
                      }),
                  CustomButton(
                      txt: "Ingrédients manquantes",
                      fun: (a, b, c) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IngManquantes()),
                        );
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Mes recettes",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600)),
              ),
              Column(
                children: [
                  RecetteTable(
                    // foodImages: [...ImagePathsAndNames.recettesImages],
                    // foodNoms: [...ImagePathsAndNames.recettesNames],
                    typeDeRec: "Entrées",
                    img: "assets/recette_icons/entre.png",
                  ),
                  RecetteTable(
                    // foodImages: [...ImagePathsAndNames.recettesImages],
                    // foodNoms: [...ImagePathsAndNames.recettesNames],
                    typeDeRec: "Plats",
                    img: "assets/recette_icons/plat.png",
                  ),
                  RecetteTable(
                    // foodImages: [...ImagePathsAndNames.produitsImages],
                    // foodNoms: [...ImagePathsAndNames.produitsNames],
                    typeDeRec: "Desserts",
                    img: "assets/recette_icons/dessert.png",
                  ),
                  RecetteTable(
                    // foodImages: [...ImagePathsAndNames.produitsImages],
                    // foodNoms: [...ImagePathsAndNames.produitsNames],
                    typeDeRec: "amuse-bouche",
                    img: "assets/recette_icons/amuse_bouche.png",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      txt: "Ajouter",
                      fun: (a, b, c) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const AjouterPlat()),
                        // );
                      })
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
