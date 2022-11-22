import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro/services/roles_permissions_api.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ModifierRolePopup extends StatefulWidget {
  final Role role;
  const ModifierRolePopup({Key? key, required this.role}) : super(key: key);

  @override
  State<ModifierRolePopup> createState() => _ModifierRolePopupState();
}

class _ModifierRolePopupState extends State<ModifierRolePopup> {
  TextEditingController role = TextEditingController();

  @override
  void initState() {
    super.initState();
    role.text = widget.role.name;
  }

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
                    "Modifier le rôle",
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
                    txt: "Modifier",
                    fun: (startLoading, stopLoading, btnState) {
                      if (role.text != '') {
                        startLoading();
                        updateRoleWS(
                          id: widget.role.id,
                          name: role.text,
                        ).then((exceptionOrMessage) {
                          stopLoading();
                          exceptionOrMessage.fold(
                            (exception) {
                              Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                            },
                            (message) {
                              role.clear();
                              setState(() {});
                              Utils.showCustomTopSnackBar(context, success: true, message: message);
                              Navigator.pop(context, role.text);
                            },
                          );
                        });
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
