import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../Theme/my_text_styles.dart';

class ConfirmationShowmodel extends StatefulWidget {
  final String title;

  const ConfirmationShowmodel({Key? key, required this.title})
      : super(key: key);

  @override
  State<ConfirmationShowmodel> createState() => _ConfirmationShowmodelState();
}

class _ConfirmationShowmodelState extends State<ConfirmationShowmodel> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 30.h,
            width: 80.w,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: MyTextStyles.headline,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CustomButton(
                        txt: "Supprimer",
                        fun: (startLoading, stopLoading, btnState) {
                          if (btnState == ButtonState.Idle) {
                            startLoading();
                            Navigator.of(context).pop(true);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomButton(
                        txt: "Annuler",
                        fun: (startLoading, stopLoading, btnState) {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
