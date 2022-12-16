import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pre_text_form.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_card_text_form.dart';

class InformationsScreen extends StatelessWidget {
  InformationsScreen({Key? key}) : super(key: key);

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tlph = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PreTextForm(txt: "Nom"),
          CustomCardTextForm(controller: nom, hintText: "Nom"),
          PreTextForm(txt: "Prénom"),
          CustomCardTextForm(controller: prenom, hintText: "Prénom"),
          PreTextForm(txt: "Email"),
          CustomCardTextForm(
            controller: email,
            hintText: "Email",
            textInputType: TextInputType.emailAddress,
          ),
          PreTextForm(txt: "Numéro de téléphone"),
          CustomCardTextForm(
            controller: tlph,
            hintText: "Numéro de téléphone",
            textInputType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
