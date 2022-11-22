import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro/services/companies_api.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/pre_text_form.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class CompanyDetails extends StatefulWidget {
  CompanyDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController companyName = TextEditingController(text: Globals.profile.company.name);
  TextEditingController companyEmail = TextEditingController(text: Globals.profile.company.email);
  TextEditingController companyPhoneNumber = TextEditingController(text: Globals.profile.company.phoneNumber);
  TextEditingController companyRib = TextEditingController(text: Globals.profile.company.rib);
  TextEditingController companySiret = TextEditingController(text: Globals.profile.company.siret);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (() {
          FocusScope.of(context).unfocus();
        }),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Image.asset("assets/images/app_logo.png"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mon entreprise",
                  style: MyTextStyles.headline.copyWith(color: MyColors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: key,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      PreTextForm(txt: "Nom"),
                      SizedBox(
                        width: 90.w,
                        child: CustomCardTextForm(
                          controller: companyName,
                          hintText: "Nom",
                        ),
                      ),
                      PreTextForm(txt: "Email"),
                      SizedBox(
                        width: 90.w,
                        child: CustomCardTextForm(
                          controller: companyEmail,
                          hintText: "Email",
                          textInputType: TextInputType.emailAddress,
                        ),
                      ),
                      PreTextForm(txt: "Numéro de teléphone"),
                      SizedBox(
                        width: 90.w,
                        child: CustomCardTextForm(
                          controller: companyPhoneNumber,
                          hintText: "Numéro de teléphone",
                          textInputType: TextInputType.phone,
                        ),
                      ),
                      PreTextForm(txt: "RIB"),
                      SizedBox(
                        width: 90.w,
                        child: CustomCardTextForm(
                          controller: companyRib,
                          hintText: "RIB",
                        ),
                      ),
                      PreTextForm(txt: "Numéro de siret"),
                      SizedBox(
                        width: 90.w,
                        child: CustomCardTextForm(
                          controller: companySiret,
                          hintText: "Numéro de siret",
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        txt: "Modifier",
                        fun: (startLoading, stopLoading, btnState) {
                          if (btnState == ButtonState.Idle) {
                            startLoading();

                            updateCompanyWS(
                              companyID: Globals.profile.company.id,
                              name: companyName.text,
                              email: companyEmail.text,
                              phoneNumber: companyPhoneNumber.text,
                              rib: companyRib.text,
                              siret: companySiret.text,
                            ).then((exceptionOrMessage) {
                              stopLoading();
                              exceptionOrMessage.fold(
                                (exception) {
                                  setState(() {});
                                  Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                },
                                (message) {
                                  setState(() {});
                                  Utils.showCustomTopSnackBar(context, success: true, message: message);
                                  Navigator.of(context).pop(true);
                                },
                              );
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
