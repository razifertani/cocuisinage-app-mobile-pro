import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/reservation_parametrage/capacite_etab/ajout_capacit.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
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
  Map tables = {};

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
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            tables.length == 0
                ? Center(
                    child: Column(
                      children: [
                        Image.asset("assets/images/table.png"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Ajouter des tables jusqua a 10 couverts",
                          style:
                              MyTextStyles.subhead.copyWith(color: Colors.grey),
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
                            "42 couverts",
                            style: MyTextStyles.subhead
                                .copyWith(fontWeight: FontWeight.w600),
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
                                "Table",
                                style: MyTextStyles.headline,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Nb Table",
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
                          tables.length,
                          (index) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            tables.keys.toList()[index],
                                            style: MyTextStyles.body,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            tables.values
                                                .toList()[index]
                                                .toString(),
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
                              )),
                    ],
                  ),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
              txt: "Ajouter",
              fun: (p0, p1, p2) {
                showDialog(
                  context: context,
                  builder: (context) => AjoutCapacite(
                    tableMap: tables,
                    callBack: () {
                      setState(() {});
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
