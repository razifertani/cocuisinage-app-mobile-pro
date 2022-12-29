import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/reservations_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_screens/reservation_screen.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/time_picker/pick_date.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/time_picker/pick_time.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class AjouterReservation extends StatefulWidget {
  final DateTime resDate;
  AjouterReservation({Key? key, required this.resDate}) : super(key: key);

  @override
  State<AjouterReservation> createState() => _AjouterReservationState();
}

class _AjouterReservationState extends State<AjouterReservation> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController nom = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController heure = TextEditingController();
  TextEditingController cmntr = TextEditingController();

  late DateTime date;
  @override
  void initState() {
    date = widget.resDate;
    super.initState();
  }

  void updateDate(DateTime dateTime) {
    setState(() {
      date = dateTime;
    });
  }

  TimeOfDay _time = TimeOfDay.now();
  void updateTime(TimeOfDay timeOfDay) {
    setState(() {
      _time = timeOfDay;
    });
  }

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
          leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))),
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
                child: Text("Ajouter une réservation", style: MyTextStyles.headline.copyWith(color: MyColors.red, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Nom de client", style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600)),
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
              Text("Numéro de téléphone", style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600)),
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
              Text("Nombre de personne", style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600)),
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
              Text("Date", style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600)),
              // CustomCardTextForm(
              //   controller: date,
              //   hintText: "2022-04-22",
              //   validator: (String? value) {
              //     if (value!.isEmpty) {
              //       return 'La date est requise !';
              //     }
              //     if (DateTime.tryParse(value) != null) {
              //       return 'La date est requise !';
              //     }

              //     return null;
              //   },
              // ),
              Center(
                  child: PickDate(
                ondateChanged: updateDate,
                initialDate: date,
              )),
              Text("Heure", style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600)),
              // CustomCardTextForm(
              //   controller: heure,
              //   hintText: "15:30",
              //   validator: (String? value) {
              //     if (value!.isEmpty) {
              //       return 'L\'heure est requise !';
              //     }
              //     if (DateTime.tryParse(value) != null) {
              //       return 'L\'heure est requise !';
              //     }
              //     return null;
              //   },
              // ),
              Center(
                  child: PickTime(
                time: TimeOfDay(hour: 7, minute: 15),
                onTimeChanged: updateTime,
              )),
              Text("Commentaire", style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600)),
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
                  fun: (startLoading, stopLoading, btnState) {
                    if (btnState == ButtonState.Idle) {
                      if (key.currentState!.validate()) {
                        startLoading();
                        addReservationWS(
                          clientName: nom.text,
                          clientPhoneNumber: phone.text,
                          nbPeople: nombre.text,
                          day: date,
                          hour: '${_time.hour}:${_time.minute}',
                          comment: cmntr.text,
                        ).then(
                          (exceptionOrMessage) {
                            stopLoading();
                            exceptionOrMessage.fold(
                              (exception) {
                                Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                              },
                              (message) {
                                setState(() {});
                                Utils.showCustomTopSnackBar(context, success: true, message: message);
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      }
                    }
                  },
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
