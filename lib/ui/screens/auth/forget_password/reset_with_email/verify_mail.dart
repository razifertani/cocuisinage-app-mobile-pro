import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/auth/ajouter_mdp/ajouter_mdp.dart';
import 'package:cocuisinage_app_mobile_pro/ui/screens/auth/sign_in/sign_in.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';

class VerifyEmail extends StatefulWidget {
  final String email;

  VerifyEmail({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController token = TextEditingController(text: '0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
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
                "Vérifiez votre Email",
                textAlign: TextAlign.center,
                style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nous vous avons envoyé des instructions de récupération de mot de passe à votre adresse Email",
                style: MyTextStyles.body.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomCardTextForm(
                controller: token,
                hintText: "Code",
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                txt: "Envoyer",
                fun: (startLoading, stopLoading, btnState) {
                  if (btnState == ButtonState.Idle) {
                    startLoading();
                    verifyCodeWS(
                      email: widget.email,
                      token: token.text,
                    ).then((exceptionOrMessage) {
                      stopLoading();
                      exceptionOrMessage.fold(
                        (exception) {
                          Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                        },
                        (message) {
                          Utils.showCustomTopSnackBar(context, success: true, message: message);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPasswordScreen(
                                onTap: (String mdp) {
                                  resetPasswordWS(
                                    email: widget.email,
                                    token: token.text,
                                    password: mdp,
                                  ).then((exceptionOrMessage) {
                                    stopLoading();
                                    exceptionOrMessage.fold(
                                      (exception) {
                                        Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                      },
                                      (message) {
                                        Utils.showCustomTopSnackBar(context, success: true, message: message);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const SignInScreen(),
                                          ),
                                        );
                                      },
                                    );
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      );
                    });
                  }
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Vous ne recevez pas le mail ? Vérifiez vos spams ou",
                  style: MyTextStyles.body.copyWith(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: " Essayez une autre adresse e-mail",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pop();
                          ;
                        },
                      style: MyTextStyles.body.copyWith(color: MyColors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
