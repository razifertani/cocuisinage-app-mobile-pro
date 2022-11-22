import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/auth/mes_boutiques/mes_boutiques.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/auth/sign_in/sign_in.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/pre_text_form.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class AddCompany extends StatefulWidget {
  final String ownerEmail;
  final String ownerFirstName;
  final String ownerLastName;
  final String ownerPassword;

  AddCompany({Key? key, required this.ownerEmail, required this.ownerFirstName, required this.ownerLastName, required this.ownerPassword}) : super(key: key);

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController companyName = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController companyPhoneNumber = TextEditingController();
  TextEditingController companyRib = TextEditingController();
  TextEditingController companySiret = TextEditingController();

  bool checkedValue = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (() {
          FocusScope.of(context).unfocus();
        }),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/auth_images/sign_up_bg.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Image.asset("assets/images/app_logo.png"),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Text(
                  "Ajouter une entreprise",
                  style: MyTextStyles.headline.copyWith(color: MyColors.red),
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
                            obscureText: !isVisible,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                            ),
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
                          height: 20,
                        ),
                        CustomButton(
                          txt: "Créer une entreprise",
                          fun: (startLoading, stopLoading, btnState) {
                            if (btnState == ButtonState.Idle) {
                              // if (key.currentState!.validate()) {
                              startLoading();
                              registerWS(
                                ownerEmail: widget.ownerEmail,
                                ownerFirstName: widget.ownerFirstName,
                                ownerLastName: widget.ownerLastName,
                                ownerPassword: widget.ownerPassword,
                                companyEmail: companyEmail.text,
                                companyName: companyName.text,
                                companyPhoneNumber: companyPhoneNumber.text,
                                companyRib: companyRib.text,
                                companySiret: companySiret.text,
                              ).then((exceptionOrMessage) {
                                stopLoading();
                                exceptionOrMessage.fold(
                                  (exception) {
                                    Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                  },
                                  (message) {
                                    setState(() {});
                                    Utils.showCustomTopSnackBar(context, success: true, message: message);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInScreen(),
                                      ),
                                    );
                                  },
                                );
                              });
                              // }
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
