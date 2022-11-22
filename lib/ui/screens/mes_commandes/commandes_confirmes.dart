import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';

import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/commandes_widgets/expansiontile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/theme_controller.dart';

class CommandesConfirm extends StatelessWidget {
  const CommandesConfirm({Key? key}) : super(key: key);

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
              width: 20.w,
              child: Center(
                  child: Text(
                "30.00 €",
                style: MyTextStyles.body
                    .copyWith(color: p.dark ? Colors.white : MyColors.red),
              )),
            ),
            statue: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFCC669).withOpacity(0.6),
              ),
              height: 5.h,
              width: 20.w,
              child: Center(
                  child: Text(
                "En cours",
                style: MyTextStyles.body.copyWith(
                    color: p.dark ? Colors.white : const Color(0xFFD97808)),
              )),
            ),
          ),
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
            statue: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF52C781).withOpacity(0.36),
              ),
              height: 5.h,
              width: 20.w,
              child: Center(
                  child: Text(
                "Terminé",
                style: MyTextStyles.body
                    .copyWith(color: p.dark ? Colors.white : Color(0xFF489A69)),
              )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
