import 'package:cocuisinage_app_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../Theme/my_colors.dart';
import 'package:flutter/gestures.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/pre_text_form.dart';
import '../add_company/add_company.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  bool checkedValue = false;
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
            image: AssetImage("assets/images/auth_images/sign_up_bg.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Image.asset("assets/images/app_logo.png"),
                ),
                Text(
                  "Créer un Compte",
                  style: MyTextStyles.headline.copyWith(color: MyColors.red),
                ),
                Form(
                    key: key,
                    child: Column(
                      children: [
                        PreTextForm(txt: "Email"),
                        SizedBox(
                          width: 90.w,
                          child: CustomCardTextForm(
                              controller: email,
                              hintText: "Email",
                              textInputType: TextInputType.emailAddress),
                        ),
                        PreTextForm(txt: "Nom"),
                        SizedBox(
                          width: 90.w,
                          child: CustomCardTextForm(
                              controller: nom, hintText: "Nom"),
                        ),
                        PreTextForm(txt: "Prénom"),
                        SizedBox(
                          width: 90.w,
                          child: CustomCardTextForm(
                              controller: prenom, hintText: "Prenom"),
                        ),
                        PreTextForm(txt: "Mot de passe"),
                        SizedBox(
                          width: 90.w,
                          child: CustomCardTextForm(
                            controller: password,
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
                          ),
                        ),
                        PreTextForm(txt: "Confirmer Mot de passe"),
                        SizedBox(
                          width: 90.w,
                          child: CustomCardTextForm(
                            controller: cPassword,
                            hintText: "Confirmer mot de passe",
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
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CheckboxListTile(
                            title: RichText(
                              text: TextSpan(
                                text: "J'accepte les ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp.clamp(16, 28)),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "Conditions générales d'utilisation",
                                      style: TextStyle(
                                          color: MyColors.red,
                                          fontSize: 16.sp.clamp(16, 28)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        }),
                                  TextSpan(
                                    text: " de Cocuisinage.Lire notre ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp.clamp(16, 28)),
                                  ),
                                  TextSpan(
                                      text: "Politique de confidentalité",
                                      style: TextStyle(
                                          color: MyColors.red,
                                          fontSize: 16.sp.clamp(16, 28)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        }),
                                ],
                              ),
                            ),
                            value: checkedValue,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValue = newValue!;
                              });
                            },
                            activeColor: MyColors.red,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          txt: "Créer mon compte",
                          fun: (startLoading, stopLoading, btnState) {
                            // if (checkedValue) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddCompany(
                                  ownerEmail: email.text,
                                  ownerFirstName: nom.text,
                                  ownerLastName: prenom.text,
                                  ownerPassword: password.text,
                                ),
                              ),
                            );
                            // }
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
