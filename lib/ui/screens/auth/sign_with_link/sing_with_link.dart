import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/collegue_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/sign_in/sign_in.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/custom_card_text_form.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../ajouter_mdp/ajouter_mdp.dart';

class SignWithLink extends StatefulWidget {
  const SignWithLink({Key? key}) : super(key: key);

  @override
  State<SignWithLink> createState() => _SignWithLinkState();
}

class _SignWithLinkState extends State<SignWithLink> {
  TextEditingController link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "S’inscrire avec lien",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Coller le lien ici",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomCardTextForm(
                controller: link,
                hintText: "Lien",
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: CustomButton(
                  txt: "S'inscrire",
                  fun: (startLoading, stopLoading, btnState) {
                    if (link.text.length > 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPasswordScreen(
                            onTap: (String mdp) {
                              acceptInvitationLinkWS(
                                invitationLink: link.text,
                                password: mdp,
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
                                        builder: (context) =>
                                            const SignInScreen(),
                                      ),
                                    );
                                  },
                                );
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
