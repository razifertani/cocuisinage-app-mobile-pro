import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro/services/roles_permissions_api.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/roles/ajouter_role_popup.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/roles/role_card.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/widgets/roles/delete_confirmation_popup.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({Key? key}) : super(key: key);

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  int selectedCollegueID = Globals.profile.id;

  Widget _titleWidget(String imgPath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Image.asset(
            imgPath,
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: Globals.config.roles.where((element) => element.establishmentId == Globals.params.currentEstablishmentID).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: Globals.profile.isOwner
                        ? Dismissible(
                            key: Key(index.toString()),
                            confirmDismiss: (direction) async {
                              bool toDelete = await showDialog(
                                context: context,
                                builder: (_) => ConfirmationShowmodel(
                                  title: "Voulez-vous vraiment supprimer ce rôle ?",
                                ),
                              );
                              if (toDelete) {
                                deleteRoleWS(
                                  id: Globals.config.roles.where((element) => element.establishmentId == Globals.params.currentEstablishmentID).toList()[index].id,
                                ).then((exceptionOrMessage) {
                                  exceptionOrMessage.fold(
                                    (exception) {
                                      Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                      return false;
                                    },
                                    (message) {
                                      setState(() {});
                                      Utils.showCustomTopSnackBar(context, success: true, message: message);
                                      return true;
                                    },
                                  );
                                });
                              } else {
                                return false;
                              }
                            },
                            child: RoleCard(
                              role: Globals.config.roles.where((element) => element.establishmentId == Globals.params.currentEstablishmentID).toList()[index],
                            ),
                          )
                        : RoleCard(
                            role: Globals.config.roles.where((element) => element.establishmentId == Globals.params.currentEstablishmentID).toList()[index],
                          ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              if (Globals.profile.isOwner)
                CustomButton(
                  txt: "Ajouter un rôle",
                  fun: (startLoading, stopLoading, btnState) {
                    showDialog(
                      context: context,
                      builder: (context) => AjouterRolePopup(),
                    ).then((value) => setState(() {}));
                  },
                ),
              SizedBox(
                height: 5.h,
              )
            ],
          ),
        ),
      );
    });
  }
}
