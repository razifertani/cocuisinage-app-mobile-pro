import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/professional_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/sign_in/sign_in.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mon_equipe/equipe/ajouter_equipier.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/mon_equipe/equipe/detail_planning/detail_planning.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../shared/widgets/roles/delete_confirmation_popup.dart';

class Equipe extends StatefulWidget {
  const Equipe({Key? key}) : super(key: key);

  @override
  State<Equipe> createState() => _EquipeState();
}

class _EquipeState extends State<Equipe> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.w > 600 ? 300 : 200,
              childAspectRatio: 0.9,
              crossAxisSpacing: 20,
              mainAxisSpacing: 1.5.h,
            ),
            itemCount: Globals.profile.getColleagues().length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    if (Globals.profile.isOwner || Globals.profile.id == Globals.profile.getColleagues()[index].id) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPlanning(
                            collegueID: Globals.profile.getColleagues()[index].id,
                          ),
                        ),
                      ).then((value) => setState(() {}));
                    }
                  },
                  child: Stack(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 2.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: MyColors.red,
                                child: CircleAvatar(
                                  radius: 42,
                                  backgroundImage: NetworkImage(
                                    "${Globals.profile.getColleagues()[index].imageUrl}",
                                  ),
                                  child: Material(
                                    shape: const CircleBorder(),
                                    clipBehavior: Clip.hardEdge,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: AutoSizeText(
                                "${Globals.profile.getColleagues()[index].firstName} ${Globals.profile.getColleagues()[index].lastName}",
                                style: MyTextStyles.subhead,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: AutoSizeText(
                                "${Globals.profile.getColleagueRole(id: Globals.profile.getColleagues()[index].id).name}",
                                maxLines: 1,
                                style: MyTextStyles.body.copyWith(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: Globals.profile.isOwner || Globals.profile.id == Globals.profile.getColleagues()[index].id,
                        child: Positioned(
                          right: 20,
                          top: 5,
                          child: GestureDetector(
                            onTap: () async {
                              bool delete = await showDialog(
                                  context: context,
                                  builder: (context) => ConfirmationShowmodel(
                                        title: "Vous êtes sur de supprimer cet employé ?",
                                      ));
                              if (delete) {
                                deleteUserWS(
                                  userID: Globals.profile.getColleagues()[index].id,
                                ).then((exceptionOrMessage) {
                                  exceptionOrMessage.fold(
                                    (exception) {
                                      Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                    },
                                    (message) {
                                      Utils.showCustomTopSnackBar(context, success: true, message: message);
                                      if (!Globals.profile.isOwner) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                                          (Route<dynamic> route) => false,
                                        );
                                      }
                                    },
                                  );
                                });
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          if (Globals.profile.getPermissions().any((element) => [Permission.ADD_COLLABORATORS].contains(element.pivotEstablishmentsPermissions.permissionId)))
            CustomButton(
                txt: "Ajouter un membre",
                fun: (startLoading, stopLoading, btnState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AjouterEquipier()),
                  ).then((value) => setState(() {}));
                }),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
