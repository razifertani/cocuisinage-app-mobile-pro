import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/tables_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_text_styles.dart';

class ModifierNmrDeTable extends StatefulWidget {
  ModifierNmrDeTable({Key? key}) : super(key: key);

  @override
  State<ModifierNmrDeTable> createState() => _ModifierNmrDeTableState();
}

class _ModifierNmrDeTableState extends State<ModifierNmrDeTable> {
  TextEditingController nmr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, set) {
      return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: SizedBox(
            height: 35.h,
            width: 80.w,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "modifier  numéro de table",
                    textAlign: TextAlign.center,
                    style: MyTextStyles.headline.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCardTextForm(
                  controller: nmr,
                  hintText: "numéro",
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  txt: "Modifier",
                  fun: (startLoading, stopLoading, btnState) {},
                )
              ],
            ),
          ));
    });
  }
}
