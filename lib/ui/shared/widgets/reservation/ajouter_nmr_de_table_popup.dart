import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_text_styles.dart';
import '../../../../Theme/my_colors.dart';

class AjouterNmrDeTablePopUp extends StatefulWidget {
  AjouterNmrDeTablePopUp({
    Key? key,
  }) : super(key: key);

  @override
  State<AjouterNmrDeTablePopUp> createState() => _AjouterNmrDeTablePopUpState();
}

class _AjouterNmrDeTablePopUpState extends State<AjouterNmrDeTablePopUp> {
  int counter = 2;
  void incrementPersCounter(int counter) {
    setState(() {
      counter += 1;
    });
  }

  void decrementPersCounter(int counter) {
    if (counter >= 1) {
      counter--;
    }

    print(counter);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(counter);
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
                    "Ajouter un numéro  de table",
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
                  hintText: "Nom",
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset("assets/icons/equipes.png"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () => incrementPersCounter(counter),
                        icon: Icon(Icons.add_circle, color: MyColors.red)),
                    Text(
                      '${counter} Pers',
                      style: MyTextStyles.subhead
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {
                          decrementPersCounter(counter);
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: MyColors.red,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  fun: (a, b, c) {},
                  txt: "Valider",
                )
              ],
            ),
          ));
    });
  }
}
