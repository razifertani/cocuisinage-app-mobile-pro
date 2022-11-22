import 'package:cocuisinage_app_mobile_pro/ui/screens/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class AjouterNouveauMdp extends StatefulWidget {
  const AjouterNouveauMdp({Key? key}) : super(key: key);

  @override
  State<AjouterNouveauMdp> createState() => _AjouterNouveauMdpState();
}

class _AjouterNouveauMdpState extends State<AjouterNouveauMdp> {
  TextEditingController mdp = TextEditingController();

  TextEditingController cMdp = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Ajouter mot de passe",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Ajouter Votre mot de passe",
              style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Votre nouveau mot de passe doit être différent de votre ancien mot de passe",
              style: MyTextStyles.subhead.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomCardTextForm(
              controller: mdp,
              hintText: "Mot de passe",
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
            const SizedBox(
              height: 10,
            ),
            CustomCardTextForm(
              controller: cMdp,
              hintText: "Confirmer",
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
            const SizedBox(
              height: 10,
            ),
            Spacer(),
            // Center(
            //     child: CustomButton(
            //         txt: "Valider",
            //         fun: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) => const SignInScreen()),
            //           );
            //         }))
          ]),
        ),
      ),
    );
  }
}
