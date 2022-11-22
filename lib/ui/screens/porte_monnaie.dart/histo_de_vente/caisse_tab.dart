import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/commandes_widgets/expansiontile_widget.dart';
import '../../../shared/widgets/planning_widgets/horizontal_calendar.dart';

class CaisseTabPorteMonnaie extends StatelessWidget {
  const CaisseTabPorteMonnaie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HorizontalCalendar(),
        SizedBox(
          height: 20,
        ),
        ExpansionTileCommandWidget(
            title: "Caisse 1",
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
            title: "Caisse 2",
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
    );
  }
}
