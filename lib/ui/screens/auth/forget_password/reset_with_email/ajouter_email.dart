import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/forget_password/reset_with_email/verify_mail.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class AjouterEmail extends StatefulWidget {
  AjouterEmail({Key? key}) : super(key: key);

  @override
  State<AjouterEmail> createState() => _AjouterEmailState();
}

class _AjouterEmailState extends State<AjouterEmail> {
  TextEditingController email = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Mot de passe oublié",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/forget_password/send_email.png",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "veuillez entrer votre adresse e-mail pour recevoir un code de vérification",
                    textAlign: TextAlign.center,
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Adresse email",
                      style: MyTextStyles.subhead
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomCardTextForm(
                    controller: email,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                    txt: "Envoyer",
                    fun: (startLoading, stopLoading, btnState) {
                      if (btnState == ButtonState.Idle) {
                        startLoading();
                        sendResetPasswordLinkWS(
                          email: email.text,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VerifyEmail(
                                    email: email.text,
                                  ),
                                ),
                              );
                            },
                          );
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
