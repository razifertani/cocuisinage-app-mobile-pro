import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/tables_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_parametrage/capacite_etab/ajout_capacit.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class CapacitEtablisScreen extends StatefulWidget {
  const CapacitEtablisScreen({Key? key}) : super(key: key);

  @override
  State<CapacitEtablisScreen> createState() => _CapacitEtablisScreenState();
}

class _CapacitEtablisScreenState extends State<CapacitEtablisScreen> {
  int nbCouvert = 0;

  @override
  void initState() {
    super.initState();

    calculateCouverts();
  }

  calculateCouverts() {
    nbCouvert = 0;
    Globals.profile.getEstablishment().tables.forEach((element) {
      nbCouvert = nbCouvert + element.nbPersons;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Capacité de l’établissement",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Globals.profile.getEstablishment().tables.length == 0
                  ? Center(
                      child: Column(
                        children: [
                          Image.asset("assets/images/table.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Ajouter des tables jusqua à 10 couverts",
                            style: MyTextStyles.subhead.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Capacité total : ",
                              style: MyTextStyles.subhead,
                            ),
                            Text(
                              "$nbCouvert couverts",
                              style: MyTextStyles.subhead.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Nom de la table",
                                  style: MyTextStyles.headline,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Nb. de couverts",
                                  style: MyTextStyles.headline,
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 2,
                        ),
                        ...List.generate(
                          Globals.profile.getEstablishment().tables.length,
                          (index) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        '${Globals.profile.getEstablishment().tables[index].name}',
                                        style: MyTextStyles.body,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '${Globals.profile.getEstablishment().tables[index].nbPersons}',
                                        style: MyTextStyles.subhead,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 10,
                                endIndent: 10,
                                thickness: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                txt: "Ajouter",
                fun: (startLoading, stopLoading, btnState) {
                  List<int> newTables = [1, 2];
                  showDialog(
                    context: context,
                    builder: (context) => AjoutCapacite(
                      newTables: newTables,
                      callBack: () {
                        setState(() {
                          for (var i = 0; i < newTables[0]; i++) {
                            addTableWS(
                              name: Globals.profile.getEstablishment().tables.isEmpty ? '${i + 1}' : "${int.parse(Globals.profile.getEstablishment().tables.last.name) + i + 1}",
                              nbPeople: newTables[1].toString(),
                            ).then((exceptionOrMessage) {
                              exceptionOrMessage.fold(
                                (exception) {
                                  Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                },
                                (message) {
                                  calculateCouverts();
                                  setState(() {});
                                  // Utils.showCustomTopSnackBar(context, success: true, message: message);
                                },
                              );
                            });
                          }
                        });
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
