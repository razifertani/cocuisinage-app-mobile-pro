import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_text_styles.dart';

class MesAbonnements extends StatelessWidget {
  const MesAbonnements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                  label: Text(
                "Date",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
              DataColumn(
                  label: Text(
                "Nom",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
              DataColumn(
                  label: Text(
                "Prix",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
              DataColumn(
                  label: Text(
                "Facture",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
              DataColumn(
                  label: Text(
                "Status",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
            ],
            rows: List.generate(
              2,
              (index) => DataRow(cells: [
                DataCell(
                  Text(
                    "04/03/2022",
                    style: MyTextStyles.body,
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Pack starter',
                      style: MyTextStyles.body,
                    ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      '12€',
                      style: MyTextStyles.subhead
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const DataCell(
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.file_download_outlined),
                  ),
                ),
                DataCell(
                  Container(
                      decoration: BoxDecoration(
                          color: MyColors.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Payé',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ]),
            )),
      ),
    );
  }
}
