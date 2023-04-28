import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/commande.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/commandes_widgets/command_card.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/time_picker/pick_date.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../drawer/drawer.dart';
import '../tutoriel/tutoriel_pop_up.dart';
import 'commandes_details/commandes_details_screen.dart';

class CommandesScreen extends StatefulWidget {
  const CommandesScreen({Key? key}) : super(key: key);

  @override
  State<CommandesScreen> createState() => _CommandesScreenState();
}

class _CommandesScreenState extends State<CommandesScreen> {
  String dropdownvaluecateg = 'Tous';

  var categories = [
    'Tous',
    'Confirme',
    'En attente',
    'Annule',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Mes Commandes",
          style: MyTextStyles.appBarTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => TutorielPopUp(
                        title: "Mes commandes",
                        description:
                            "Vous pouvez gérer l’ensemble des commandes effectuées en ligne  ",
                        numberOfPages: 3,
                        secDescription:
                            "La commande en attente sera à confirmer ou refusé. vous retrouverez l’ensemble des informations essentielles à la commande.",
                        thirdDescription:
                            "Si la commande est validée alors elle sera transmise au système de préparation de commande  et un compteur de préparation sera enclenché.",
                      ));
            },
            icon: Icon(Icons.question_mark),
          )
        ],
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Résumer de mes commandes",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                PickDate(
                  initialDate: DateTime.now(),
                  ondateChanged: (date) {},
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 35.w,
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
                            child: Text(
                              items,
                              style: MyTextStyles.subhead,
                            ),
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
            const SizedBox(
              height: 20,
            ),
            Text(
              "Aujourd’hui",
              style: MyTextStyles.subhead.copyWith(color: Color(0xff909090)),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommandDetailScreen(
                              commande: Commande(id: 001, commandeProduct: [
                            CommandeProduct(
                              id: 02,
                              status: 2,
                            ),
                            CommandeProduct(id: 02, status: 0),
                            CommandeProduct(id: 02, status: 1),
                          ]))),
                );
              },
              child: CommandCard(
                commandStatus: CommandStatus.annule,
              ),
            ),
            CommandCard(
              commandStatus: CommandStatus.confirme,
            ),
            CommandCard(
              commandStatus: CommandStatus.attente,
            ),
          ],
        ),
      ),
    );
  }
}
