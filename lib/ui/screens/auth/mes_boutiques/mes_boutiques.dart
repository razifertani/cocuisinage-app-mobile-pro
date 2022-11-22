import 'package:cocuisinage_app_mobile_pro/layout/layout_screen.dart';
import 'package:cocuisinage_app_mobile_pro/models/role_permission.dart';
import 'package:cocuisinage_app_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro/services/fcm_service.dart';
import 'package:cocuisinage_app_mobile_pro/services/permissions_service.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/auth/edit_company/company_details.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/auth/mes_boutiques/modif_popup.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/boutique/creer_boutique/creer_boutique_details.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/home/employe_home_screen.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/auth/boutique/boutique_card.dart';
import '../../home/patron_home_screen.dart';

class MesBoutiquesScreen extends StatefulWidget {
  MesBoutiquesScreen({Key? key}) : super(key: key);

  @override
  State<MesBoutiquesScreen> createState() => _MesBoutiquesScreenState();
}

class _MesBoutiquesScreenState extends State<MesBoutiquesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mes boutiques",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              if (Globals.profile.isOwner)
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => CompanyDetails())));
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Text(
                          "Mon entreprise",
                          style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Mes boutiques",
                style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Globals.profile.establishmentsRoles.length > 0
                  ? ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Globals.profile.establishmentsRoles.length,
                      separatorBuilder: ((context, index) {
                        return SizedBox(
                          height: 16,
                        );
                      }),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () {
                            if (Globals.profile.isOwner) {
                              Globals.params.currentEstablishmentID = Globals.profile.establishmentsRoles[index].id;
                              Utils.pushScreen(context, ModifBoutiquePopUp(
                                function: () {
                                  setState(() {});
                                },
                              ), 0.4);
                            }
                          },
                          onTap: () async {
                            Globals.params.currentEstablishmentID = Globals.profile.establishmentsRoles[index].id;

                            try {
                              await PermissionsService.configure();
                              await FCMService.configure(context: context);
                            } catch (e) {
                              Utils.showCustomTopSnackBar(context, success: false, message: e.toString());
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LayoutPage(),
                              ),
                            );

                            // if (Globals.profile.isOwner) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => PatronHomeScreen(),
                            //     ),
                            //   );
                            // } else {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => EmployeHomeScreen(),
                            //     ),
                            //   );
                            // }
                          },
                          child: BoutiqueCardAuth(
                            name: '${Globals.profile.establishmentsRoles[index].name}\n${Globals.config.roles.firstWhere((element) => element.id == Globals.profile.establishmentsRoles[index].pivotEstablishmentsRoles.roleId).name}',
                            address: '${Globals.profile.establishmentsRoles[index].city}',
                            imgPath: '${Globals.profile.establishmentsRoles[index].imageUrl}',
                            rate: 5,
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('Pas de boutiques créées !'),
                    ),
              const SizedBox(
                height: 20,
              ),
              if (Globals.profile.isOwner)
                Center(
                  child: CustomButton(
                    txt: "Ajouter",
                    fun: (startLoading, stopLoading, btnState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreerBoutiqueDetail(),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
