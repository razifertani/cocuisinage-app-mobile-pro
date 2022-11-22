import 'dart:io';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/mes_boutiques/mes_boutiques.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/sign_in/sign_in.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_colors.dart';

import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/pre_text_form.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class EditCompany extends StatefulWidget {
  EditCompany({
    Key? key,
  }) : super(key: key);

  @override
  State<EditCompany> createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController companyName = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController companyPhoneNumber = TextEditingController();
  TextEditingController companyRib = TextEditingController();
  TextEditingController companySiret = TextEditingController();

  bool checkedValue = false;
  bool isVisible = false;

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

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
            child: Column(children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Stack(
                children: [
                  Image.asset("assets/images/app_logo.png"),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => pickImage(),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset("assets/icons/edit.png"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
                          obscureText: !isVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
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
                      SizedBox(
                        height: 20,
                      ),
                      Opacity(
                          opacity: 0.65,
                          // changer l'opacity 1 si l'utilisateur a changé certain donnée

                          child: CustomButton(
                              txt: "Enregistrer", fun: (a, b, c) {})),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
