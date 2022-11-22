import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro/services/roles_permissions_api.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AjouterRolePopup extends StatefulWidget {
  const AjouterRolePopup({Key? key}) : super(key: key);

  @override
  State<AjouterRolePopup> createState() => _AjouterRolePopupState();
}

class _AjouterRolePopupState extends State<AjouterRolePopup> {
  TextEditingController role = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 40.h,
            width: 80.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ajouter un rôle",
                    style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomCardTextForm(
                    controller: role,
                    hintText: "Rôle",
                  ),
                  Spacer(),
                  CustomButton(
                    txt: "Valider",
                    fun: (startLoading, stopLoading, btnState) async {
                      if (btnState == ButtonState.Idle) {
                        if (role.text.isNotEmpty) {
                          startLoading();

                          await addRoleWS(
                            name: role.text,
                          ).then((exceptionOrMessage) {
                            stopLoading();
                            exceptionOrMessage.fold(
                              (exception) {
                                Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                              },
                              (message) {
                                Utils.showCustomTopSnackBar(context, success: true, message: message);
                                Navigator.of(context).pop();
                              },
                            );
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
