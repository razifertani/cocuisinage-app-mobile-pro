import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/commandes_widgets/expansiontile_widget.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/planning_widgets/horizontal_calendar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class LivraisonTabPorteMonnaie extends StatelessWidget {
  const LivraisonTabPorteMonnaie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HorizontalCalendar(),
        SizedBox(
          height: 20,
        ),
        ExpansionTileCommandWidget(
            title: "App",
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
            title: "Site Web",
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
