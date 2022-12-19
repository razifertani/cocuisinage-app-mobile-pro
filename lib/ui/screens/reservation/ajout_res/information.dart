import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pre_text_form.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../../services/reservations_api.dart';
import '../../../../utils/utils.dart';
import '../../../shared/widgets/custom_card_text_form.dart';
import '../../../shared/widgets/success_show_model/success_show_model.dart';

typedef void InfoCallback(Map infoMap);

class InformationsScreen extends StatefulWidget {
  final InfoCallback onInfoChanged;
  final GlobalKey globalKey;
  InformationsScreen(
      {Key? key, required this.onInfoChanged, required this.globalKey})
      : super(key: key);

  @override
  State<InformationsScreen> createState() => _InformationsScreenState();
}

class _InformationsScreenState extends State<InformationsScreen> {
  // GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController nom = TextEditingController();

  TextEditingController tlph = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: widget.globalKey,
        onChanged: () {
          widget.onInfoChanged({"nom": nom.text, "nmrTlph": tlph.text});
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PreTextForm(txt: "Nom"),
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

            PreTextForm(txt: "Numéro de téléphone"),
            CustomCardTextForm(
              controller: tlph,
              hintText: "01.02.03.04.05",
              textInputType: TextInputType.phone,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Le numéro de téléphone est requis !';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            // Center(
            //   child: CustomButton(
            //     txt: "Réserver",
            //     fun: (startLoading, stopLoading, btnState) {
            //       widget.onInfoChanged({
            //         "nom": nom.text,
            //         "prenom": prenom.text,
            //         "nmrTlph": tlph.text
            //       });
            //       if (btnState == ButtonState.Idle) {
            //         if (key.currentState!.validate()) {
            //           startLoading();
            //           addReservationWS(

            //             clientName: nom.text,
            //             clientPhoneNumber: tlph.text,

            //           ).then(
            //             (exceptionOrMessage) {
            //               stopLoading();
            //               exceptionOrMessage.fold(
            //                 (exception) {
            //                   Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
            //                 },
            //                 (message) {
            //                   setState(() {});
            //                   Utils.showCustomTopSnackBar(context, success: true, message: message);
            //                   Navigator.pop(context);
            //                 },
            //               );
            //             },
            //           );
            //         }
            //       }
            //     },
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
