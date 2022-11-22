import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class RecStatCard extends StatelessWidget {
  String nomDeRec;
  String prix;
  RecStatCard({Key? key, required this.nomDeRec, required this.prix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Row(
          children: [
            Flexible(
              flex: 6,
              child: AutoSizeText(
                nomDeRec,
                style: MyTextStyles.subhead,
                maxLines: 1,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 4,
              child: AutoSizeText(
                prix,
                style: MyTextStyles.body
                    .copyWith(color: MyColors.red, fontSize: 8),
                maxLines: 1,
              ),
            )
          ],
        ),
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              // color: const Color(0xFFECECEC),
              child: DataTable(
                  columnSpacing: 40,
                  columns: <DataColumn>[
                    DataColumn(
                        label: Text(
                      "",
                      style: MyTextStyles.body
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      "Produit",
                      style: MyTextStyles.body
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      "Qantité recette/pers",
                      style: MyTextStyles.body
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      "Prix d’achat moyen",
                      style: MyTextStyles.body
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      "Cout de revient/pers",
                      style: MyTextStyles.body
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      "Fournisseur",
                      style: MyTextStyles.body
                          .copyWith(fontWeight: FontWeight.w600),
                    )),
                  ],
                  rows: List.generate(
                    3,
                    (index) => DataRow(cells: [
                      DataCell(Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: CircleAvatar(
                            radius: 5.w,
                            backgroundImage: const NetworkImage(
                              'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
                            )),
                      )),
                      DataCell(
                        Text(
                          "tomates",
                          style: MyTextStyles.body,
                        ),
                      ),
                      DataCell(
                        Container(
                            decoration: BoxDecoration(
                                color: MyColors.grey,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                '100g',
                                style: MyTextStyles.body,
                              ),
                            )),
                      ),
                      DataCell(
                        Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFFFCC669),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                '2€/kg',
                                style: MyTextStyles.body,
                              ),
                            )),
                      ),
                      DataCell(
                        Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFFB6B9F5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                '1.2€',
                                style: MyTextStyles.body,
                              ),
                            )),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            // Utils.pushScreen(
                            //     context, ChoisirFournisseur(), 0.8);
                          },
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFF4FD18B),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: const Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  ))),
                        ),
                      ),
                    ]),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
