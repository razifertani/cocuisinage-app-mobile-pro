import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/role_permission.dart';

import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/collegue_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';

class AjouterEquipier extends StatefulWidget {
  const AjouterEquipier({Key? key}) : super(key: key);

  @override
  State<AjouterEquipier> createState() => _AjouterEquipierState();
}

class _AjouterEquipierState extends State<AjouterEquipier> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? urlToken;

  List<Role> listOfRoles = [];
  int selectedRoleID = 0;

  @override
  void initState() {
    super.initState();

    Globals.config.roles.forEach((element) {
      if (element.establishmentId == Globals.params.currentEstablishmentID &&
          element.id != Role.PATRON) {
        listOfRoles.add(element);
      }
    });
    selectedRoleID = listOfRoles.isNotEmpty ? listOfRoles.first.id : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ajouter un équipier",
          style: MyTextStyles.appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: MyColors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Créer un nouveau membre",
                  style: MyTextStyles.headline
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomCardTextForm(
                  controller: firstNameController,
                  hintText: "Nom",
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Nom est requis !';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCardTextForm(
                  controller: lastNameController,
                  hintText: "Prénom",
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Prénom est requis !';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCardTextForm(
                  controller: phoneNumberController,
                  hintText: "Numéro de téléphone",
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Numéro de téléphone est requis !';
                    }
                    // if (!Utils.mobileRegExp.hasMatch(value)) {
                    //   return 'Numéro de téléphone n\'est pas valide !';
                    // }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCardTextForm(
                  controller: emailController,
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email est requis !';
                    }
                    if (!Utils.emailRegExp.hasMatch(value)) {
                      return 'Email n\'est pas valide !';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                listOfRoles.isNotEmpty
                    ? SizedBox(
                        height: 8.h.clamp(65, 95),
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton(
                              underline: const SizedBox(),
                              value: selectedRoleID,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: listOfRoles.map((Role role) {
                                return DropdownMenuItem(
                                  value: role.id,
                                  child: Text(
                                    '${role.name}',
                                    style: MyTextStyles.body,
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? roleID) {
                                setState(() {
                                  selectedRoleID = roleID!;
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          'Créer un rôle au moins avant d\'ajouter un équipier !',
                          textAlign: TextAlign.center,
                          style: MyTextStyles.subhead.copyWith(
                            color: MyColors.red,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                if (listOfRoles.isNotEmpty)
                  Center(
                    child: CustomButton(
                      txt: "Inviter l'équipier",
                      fun: (startLoading, stopLoading, btnState) {
                        if (btnState == ButtonState.Idle) {
                          if (key.currentState!.validate()) {
                            startLoading();
                            sendInvitationLinkWS(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              phoneNumber: phoneNumberController.text,
                              email: emailController.text,
                              roleID: selectedRoleID,
                            ).then((exceptionOrMessage) {
                              stopLoading();
                              exceptionOrMessage.fold(
                                (exception) {
                                  Utils.showCustomTopSnackBar(context,
                                      success: false,
                                      message: exception.toString());
                                },
                                (message) {
                                  Utils.showCustomTopSnackBar(context,
                                      success: true, message: message);
                                  Navigator.of(context).pop();
                                },
                              );
                            });
                          }
                        }
                      },
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                // if (urlToken != null)
                //   Center(
                //     child: CopyCard(
                //       text: urlToken!,
                //     ),
                //   ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
