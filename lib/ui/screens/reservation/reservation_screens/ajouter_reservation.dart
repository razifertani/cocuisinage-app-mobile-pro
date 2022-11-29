import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/time_picker/pick_date.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/time_picker/pick_time.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class AjouterReservation extends StatefulWidget {
  AjouterReservation({Key? key}) : super(key: key);

  @override
  State<AjouterReservation> createState() => _AjouterReservationState();
}

class _AjouterReservationState extends State<AjouterReservation> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController nom = TextEditingController();
  TextEditingController nombre = TextEditingController();
  // TextEditingController heure = TextEditingController();
  TextEditingController phone = TextEditingController();
  // TextEditingController date = TextEditingController();

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
        child: Form(
          key: key,
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
              Text("Nom de client",
                  style: MyTextStyles.subhead
                      .copyWith(fontWeight: FontWeight.w600)),
              CustomCardTextForm(
                controller: nom,
                hintText: "nom",
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Nom est requis !';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Numéro de téléphone",
                  style: MyTextStyles.subhead
                      .copyWith(fontWeight: FontWeight.w600)),
              CustomCardTextForm(
                controller: phone,
                hintText: "01.02.03.04.05",
                textInputType: TextInputType.phone,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Le numéro de téléphone est requis !';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Nombre de personne",
                  style: MyTextStyles.subhead
                      .copyWith(fontWeight: FontWeight.w600)),
              CustomCardTextForm(
                controller: nombre,
                hintText: "2",
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Le nombre de personne est requis !';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Date",
                  style: MyTextStyles.subhead
                      .copyWith(fontWeight: FontWeight.w600)),
              // CustomCardTextForm(
              //   controller: date,
              //   hintText: "23:02:2022",
              //   validator: (String? value) {
              //     if (value!.isEmpty) {
              //       return 'La date de personne est requis !';
              //     }
              //     return null;
              //   },
              // ),
              Center(child: PickDate()),
              const SizedBox(
                height: 10,
              ),
              Text("Heure",
                  style: MyTextStyles.subhead
                      .copyWith(fontWeight: FontWeight.w600)),
              // CustomCardTextForm(
              //   controller: heure,
              //   hintText: "15:30",
              //   validator: (String? value) {
              //     if (value!.isEmpty) {
              //       return 'L\'heure de personne est requis !';
              //     }
              //     return null;
              //   },
              // ),
              Center(child: PickTime()),
              const SizedBox(
                height: 10,
              ),
              Text("Commentaire",
                  style: MyTextStyles.subhead
                      .copyWith(fontWeight: FontWeight.w600)),
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
                  fun: (startLoading, stopLoading, btnState) {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
