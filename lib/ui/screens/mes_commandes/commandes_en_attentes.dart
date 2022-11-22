import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_text_styles.dart';
import '../../../controllers/theme_controller.dart';
import '../../shared/widgets/commandes_widgets/expansiontile_widget.dart';

class CommandesEnAttentes extends StatelessWidget {
  const CommandesEnAttentes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<ThemeController>(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Mes commandes",
              style:
                  MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ExpansionTileCommandWidget(
              title: "A domicile",
              prix: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD43347).withOpacity(0.16),
                ),
                height: 5.h,
                width: 18.w,
                child: Center(
                    child: Text(
                  "30.00 €",
                  style: MyTextStyles.body
                      .copyWith(color: p.dark ? Colors.white : MyColors.red),
                )),
              ),
              statue: Row(
                children: [
                  GestureDetector(
                      child: Image.asset("assets/icons/close-square.png")),
                  GestureDetector(
                      child: Image.asset("assets/icons/tick-square.png")),
                ],
              )),
          ExpansionTileCommandWidget(
              title: "Click and collecte",
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
                  style: MyTextStyles.body
                      .copyWith(color: p.dark ? Colors.white : MyColors.red),
                )),
              ),
              statue: Row(
                children: [
                  GestureDetector(
                      child: Image.asset("assets/icons/close-square.png")),
                  GestureDetector(
                      child: Image.asset("assets/icons/tick-square.png")),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
