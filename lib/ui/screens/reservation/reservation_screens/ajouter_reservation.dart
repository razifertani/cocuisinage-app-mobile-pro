import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class AjouterReservation extends StatelessWidget {
  AjouterReservation({Key? key}) : super(key: key);
  TextEditingController nom = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController heure = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();

  TextEditingController cmntr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Réservations",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("Ajouter une réservation",
                  style: MyTextStyles.headline.copyWith(
                      color: MyColors.red, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Nom de client",
              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
            ),
            CustomCardTextForm(controller: nom, hintText: "nom"),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Numéro de téléphone",
              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
            ),
            CustomCardTextForm(
              controller: phone,
              hintText: "01.02.03.04.05",
              textInputType: TextInputType.phone,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Nombre de personne",
              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
            ),
            CustomCardTextForm(controller: nombre, hintText: "2"),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Date",
              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
            ),
            CustomCardTextForm(controller: date, hintText: "23:02:2022"),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Heure",
              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
            ),
            CustomCardTextForm(controller: heure, hintText: "15:30"),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Commentaire",
              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
            ),
            CustomCardTextForm(
              controller: cmntr,
              hintText: "Votre commentaire",
              minLines: 7,
              maxLines: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(
                  txt: "Valider",
                  fun: (a, b, c) {
                    Navigator.pop(context);
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
