import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_parametrage/duree_de_service/duree_de_service_screen.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_parametrage/horaire_de_service/horaire_de_service_screen.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import 'capacite_etab/capacite_etab_screen.dart';

class ReservationParameterScreen extends StatelessWidget {
  const ReservationParameterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paramétrage",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Paramétrage de réservation",
                style: MyTextStyles.headline
                    .copyWith(color: MyColors.red, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              PopUpCard(
                title: "Horaires de services",
                fun: (a, b, c) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HoraireDeServiceScreen(),
                      ));
                },
              ),
              SizedBox(
                height: 10,
              ),
              PopUpCard(
                  title: "Durée de réservation",
                  fun: (a, b, c) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DureeDeServiceScreen(),
                        ));
                  }),
              SizedBox(
                height: 10,
              ),
              PopUpCard(
                  title: "Capacité de l’établissement",
                  fun: (a, b, c) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CapacitEtablisScreen(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
