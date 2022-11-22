import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/commandes_widgets/command_card.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/commandes_widgets/expansiontile_widget.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/planning_widgets/horizontal_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';

class HistoDeDepense extends StatefulWidget {
  const HistoDeDepense({Key? key}) : super(key: key);

  @override
  State<HistoDeDepense> createState() => _HistoDeDepenseState();
}

class _HistoDeDepenseState extends State<HistoDeDepense> {
  var myGroup = AutoSizeGroup();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Historique des dépenses",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const HorizontalCalendar(),
              const SizedBox(
                height: 20,
              ),
              ExpansionTileCommandWidget(
                  title: "Fournisseur 1",
                  isPorteMonnaie: true,
                  prix: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFD43347).withOpacity(0.16),
                    ),
                    height: 5.h,
                    width: 20.w,
                    child: Center(
                        child: Text(
                      "30.00 €",
                      style: MyTextStyles.body.copyWith(color: MyColors.red),
                    )),
                  ),
                  statue: Container(
                    width: 10.w,
                  )),
              ExpansionTileCommandWidget(
                  title: "Fournisseur 2",
                  isPorteMonnaie: true,
                  prix: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFD43347).withOpacity(0.16),
                    ),
                    height: 5.h,
                    width: 20.w,
                    child: Center(
                        child: Text(
                      "30.00 €",
                      style: MyTextStyles.body.copyWith(color: MyColors.red),
                    )),
                  ),
                  statue: Container(
                    width: 10.w,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
