import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_text_styles.dart';

class PopUpWidget extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String title;
  Function(Function, Function, ButtonState) function;
  PopUpWidget({Key? key, required this.controller, required this.title, required this.function}) : super(key: key);

  @override
  State<PopUpWidget> createState() => _PopUpWidgetState();
}

class _PopUpWidgetState extends State<PopUpWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 35.h,
            width: 80.w,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    widget.title,
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
                  controller: widget.controller,
                  hintText: "Nom",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  fun: widget.function,
                  txt: "Valider",
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
