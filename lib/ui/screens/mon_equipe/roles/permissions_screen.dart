import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/collegue.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/roles_permissions_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../shared/custom_row_switch.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  int selectedCollegueID = Globals.profile.id;

  Widget _titleWidget(String imgPath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 35,
            child: Image.asset(
              imgPath,
              height: 30,
              width: 30,
            ),
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Sélectionner un membre de l’équipe pour lui attribuer des permissions :",
              style: MyTextStyles.subhead,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 90.w,
              height: 8.h.clamp(65, 95),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    value: selectedCollegueID,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: ((Globals.profile.isOwner ||
                                Globals.profile
                                    .getColleguePermissions(
                                        id: selectedCollegueID)
                                    .contains(Permission.MANAGE_ROLES))
                            ? Globals.profile.getColleagues()
                            : [
                                Globals.profile
                                    .getColleague(id: Globals.profile.id)
                              ])
                        .map((Collegue collegue) {
                      return DropdownMenuItem(
                        value: collegue.id,
                        child: Text(
                          '${collegue.firstName} ${collegue.lastName} - ${Globals.profile.getColleagueRole(id: collegue.id).name}',
                          style: MyTextStyles.body,
                        ),
                      );
                    }).toList(),
                    onChanged: (int? collegueID) {
                      setState(() {
                        selectedCollegueID = collegueID!;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _titleWidget("assets/primary_icons/equipe.png", "Mon équipe"),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: Globals.config.permissions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: CustomRowSwitch(
                    text: Globals.config.permissions[index].name,
                    value: Globals.profile
                        .getColleguePermissions(id: selectedCollegueID)
                        .contains(index + 1),
                    onChanged: (bool) {
                      togglePermissionWS(
                        collegueID: selectedCollegueID,
                        permissionID: Globals.config.permissions[index].id,
                      ).then((exceptionOrMessage) {
                        exceptionOrMessage.fold(
                          (exception) {
                            Utils.showCustomTopSnackBar(context,
                                success: false, message: exception.toString());
                          },
                          (message) {
                            setState(() {});
                            Utils.showCustomTopSnackBar(context,
                                success: true, message: message);
                          },
                        );
                      });
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            _titleWidget("assets/primary_icons/production.png", "Production"),
            Column(
              children: [
                CustomRowSwitch(
                  text: "Gérer les status de commandes",
                  value: false,
                  onChanged: (p0) {},
                ),
                CustomRowSwitch(
                  text: "Gérer la préparation des commandes",
                  value: false,
                  onChanged: (p0) {},
                ),
                CustomRowSwitch(
                  text: "Gérer la caisse",
                  value: false,
                  onChanged: (p0) {},
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _titleWidget(
                "assets/primary_icons/approvis.png", "Approvisionnement"),
            Column(
              children: [
                CustomRowSwitch(
                  text: "Gérer la carte du restaurant",
                  value: false,
                  onChanged: (p0) {},
                ),
                CustomRowSwitch(
                  text: "Gérer les commandes de fournisseurs",
                  value: false,
                  onChanged: (p0) {},
                ),
                CustomRowSwitch(
                  text: "Gérer les livraisons de fournisseurs",
                  value: false,
                  onChanged: (p0) {},
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _titleWidget("assets/primary_icons/inventaire.png", "Inventaire"),
            Column(
              children: [
                CustomRowSwitch(
                  text: "Gérer les modifications du stock",
                  value: false,
                  onChanged: (p0) {},
                ),
                CustomRowSwitch(
                  text: "Gérer les sortie du stock",
                  value: false,
                  onChanged: (p0) {},
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _titleWidget("assets/primary_icons/rec.png", "Mes recettes"),
            Column(
              children: [
                CustomRowSwitch(
                  text: "Ajouter une recette",
                  value: false,
                  onChanged: (p0) {},
                ),
                CustomRowSwitch(
                  text: "Mettre en favoris les recettes",
                  value: false,
                  onChanged: (p0) {},
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
