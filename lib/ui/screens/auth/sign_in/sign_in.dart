import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/forget_password/reset_with_email/ajouter_email.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/mes_boutiques/mes_boutiques.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/sign_up/sign_up.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/sign_with_link/sing_with_link.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../Theme/my_colors.dart';
import '../../../shared/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  // TextEditingController email = TextEditingController(text: 'razifertani1@gmail.com');
  TextEditingController email = TextEditingController(text: '');
  TextEditingController motDePasse = TextEditingController(text: '123456');

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/auth_images/home_sign_in.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Bienvenue",
                        style: MyTextStyles.headline.copyWith(
                            color: MyColors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp.clamp(30, 35)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Email",
                            style: MyTextStyles.subhead
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        CustomCardTextForm(
                          controller: email,
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
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Mot de passe",
                            style: MyTextStyles.subhead
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        CustomCardTextForm(
                          controller: motDePasse,
                          hintText: "Mot de passe",
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
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Mot de passe est requis !';
                            }
                            if (value.length < 4) {
                              return 'Mot de passe n\'est pas valide !';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AjouterEmail()),
                              );
                            },
                            child: Text(
                              "Mot de passe oublier ?",
                              style: MyTextStyles.body
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                        ),
                        CustomButton(
                          txt: "Connexion",
                          fun: (startLoading, stopLoading, btnState) {
                            if (btnState == ButtonState.Idle) {
                              if (key.currentState!.validate()) {
                                startLoading();
                                loginWS(
                                  email: email.text,
                                  password: motDePasse.text,
                                ).then((exceptionOrProfile) {
                                  stopLoading();
                                  exceptionOrProfile.fold(
                                    (exception) {
                                      Utils.showCustomTopSnackBar(context,
                                          success: false,
                                          message: exception.toString());
                                    },
                                    (bool) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MesBoutiquesScreen()),
                                      );
                                    },
                                  );
                                });
                              }
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "Pas encore membre ?",
                                style: MyTextStyles.subhead
                                    .copyWith(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: "S'inscrire",
                                      style: MyTextStyles.subhead
                                          .copyWith(color: MyColors.red),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUpScreen()),
                                          );
                                        }),
                                ])),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "S'inscrire avec un ",
                                style: MyTextStyles.subhead
                                    .copyWith(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: "lien",
                                      style: MyTextStyles.subhead
                                          .copyWith(color: MyColors.red),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignWithLink()),
                                          );
                                        }),
                                  TextSpan(
                                    text: "?",
                                    style: MyTextStyles.subhead
                                        .copyWith(color: Colors.black),
                                  ),
                                ])),
                      ],
                    ),
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
