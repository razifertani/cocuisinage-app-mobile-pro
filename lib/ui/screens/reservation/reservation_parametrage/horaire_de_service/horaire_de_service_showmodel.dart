import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/time_picker/pick_time.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/custom_button.dart';

class HoraireDeServiceShowModel extends StatefulWidget {
  const HoraireDeServiceShowModel({Key? key}) : super(key: key);

  @override
  State<HoraireDeServiceShowModel> createState() =>
      _HoraireDeServiceShowModelState();
}

class _HoraireDeServiceShowModelState extends State<HoraireDeServiceShowModel> {
  bool isMonthly = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 35.h,
            width: 80.w,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "De",
                              style: MyTextStyles.headline
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            PickTime(onTimeChanged: (time) {})
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "À",
                              style: MyTextStyles.headline
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            PickTime(onTimeChanged: (time) {})
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mensuel",
                          style: MyTextStyles.headline
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Switch(
                          activeColor: MyColors.red,
                          value: isMonthly,
                          onChanged: (value) {
                            setState(() {
                              isMonthly = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        txt: "Valider",
                        fun: (startLoading, stopLoading, btnState) async {})
                  ])),
            ),
          );
        },
      ),
    );
  }
}
