import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mes_commandes/commandes_details/commandes_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../controllers/theme_controller.dart';

class ExpansionTileCommandWidget extends StatelessWidget {
  String title;
  Widget? prix;
  Widget? statue;
  bool? isPorteMonnaie;
  List<DataRow>? rows;

  ExpansionTileCommandWidget(
      {Key? key,
      required this.title,
      this.prix,
      this.statue,
      this.isPorteMonnaie,
      this.rows})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<ThemeController>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ExpansionTile(
        title: Text(
          title,
          style: MyTextStyles.headline,
        ),
        children: [
          Container(
            width: 100.w,
            decoration: const BoxDecoration(
              // color: Color(0xFFECECEC),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
            ),
            child: DataTable(columns: <DataColumn>[
              DataColumn(
                  label: Text(
                "Prix",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
              DataColumn(
                  label: Text(
                isPorteMonnaie ?? false ? "Facture" : "Statue",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
              DataColumn(
                  label: Text(
                "Détails",
                style: MyTextStyles.body.copyWith(fontWeight: FontWeight.w600),
              )),
            ], rows: rows!),
          ),
        ],
      ),
    );
  }
}
